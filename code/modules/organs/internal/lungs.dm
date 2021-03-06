#define HUMAN_MAX_OXYLOSS 1 //Defines how much oxyloss humans can get per tick. A tile with no air at all (such as space) applies this value, otherwise it's a percentage of it.
#define HUMAN_CRIT_MAX_OXYLOSS ( 2.0 / 6) //The amount of damage you'll get when in critical condition. We want this to be a 5 minute deal = 300s. There are 50HP to get through, so (1/6)*last_tick_duration per second. Breaths however only happen every 4 ticks. last_tick_duration = ~2.0 on average

/obj/item/organ/internal/lungs
	name = "lungs"
	icon_state = "lungs"
	gender = PLURAL
	organ_tag = BP_LUNGS
	parent_organ = BP_CHEST
	robotic_name = "gas exchange system"
	robotic_sprite = "lungs-prosthetic"
	var/rescued = FALSE // whether or not a collapsed lung has been rescued with a syringe

/obj/item/organ/internal/lungs/process()
	..()

	if(!owner)
		return

	if (germ_level > INFECTION_LEVEL_ONE)
		if(prob(5))
			owner.emote("cough")		//Respiratory tract infection

	if(is_broken() || (is_bruised() && !rescued)) // a thoracostomy can only help with a collapsed lung, not a mangled one
		if(prob(2))
			spawn owner.emote("me", 1, "coughs up blood!")
			owner.drip(10)
		if(prob(4))
			spawn owner.emote("me", 1, "gasps for air!")
			owner.losebreath = 1

	if(is_bruised() && rescued)
		if(prob(4))
			to_chat(owner, span("warning", "It feels hard to breathe..."))
			if (owner.losebreath < 5)
				owner.losebreath = min(owner.losebreath + 1, 5) // it's still not good, but it's much better than an untreated collapsed lung

/obj/item/organ/internal/lungs/proc/handle_breath(datum/gas_mixture/breath)
	if(!owner)
		return 1

	//exposure to extreme pressures can rupture lungs
	if(breath && (breath.total_moles/(owner.species?.breath_vol_mul || 1) < BREATH_MOLES / 5 || breath.total_moles/(owner.species?.breath_vol_mul || 1) > BREATH_MOLES * 5))
		if(!is_bruised() && prob(5))
			bruise()

	//check if we actually need to process breath
	if(!breath || (breath.total_moles == 0))
		owner.failed_last_breath = 1
		if(owner.health > config.health_threshold_crit)
			owner.adjustOxyLoss(HUMAN_MAX_OXYLOSS)
		else
			owner.adjustOxyLoss(HUMAN_CRIT_MAX_OXYLOSS)

		owner.oxygen_alert = max(owner.oxygen_alert, 1)
		return 0

	var/safe_pressure_min = owner.species.breath_pressure // Minimum safe partial pressure of breathable gas in kPa

	if(is_broken())
		safe_pressure_min *= 1.5
	else if(is_bruised())
		safe_pressure_min *= 1.25

	var/safe_exhaled_max = 10
	var/safe_toxins_max = 0.2
	var/SA_para_min = 1
	var/SA_sleep_min = 5
	var/inhaled_gas_used = 0

	var/breath_pressure = (breath.total_moles*R_IDEAL_GAS_EQUATION*breath.temperature)/(BREATH_VOLUME * owner.species.breath_vol_mul)

	var/inhaling
	var/poison
	var/exhaling

	var/breath_type
	var/poison_type
	var/exhale_type

	var/failed_inhale = 0
	var/failed_exhale = 0

	if(owner.species.breath_type)
		breath_type = species.breath_type
	else
		breath_type = "oxygen"

	inhaling = breath.gas[breath_type]

	if(owner.species.poison_type)
		poison_type = species.poison_type
	else
		poison_type = "phoron"
	poison = breath.gas[poison_type]

	if(owner.species.exhale_type)
		exhale_type = species.exhale_type
		exhaling = breath.gas[exhale_type]
	else
		exhaling = 0

	var/inhale_pp = (inhaling/breath.total_moles)*breath_pressure
	var/toxins_pp = (poison/breath.total_moles)*breath_pressure
	var/exhaled_pp = (exhaling/breath.total_moles)*breath_pressure

	// Not enough to breathe
	if(inhale_pp < safe_pressure_min)
		if(prob(20))
			spawn(0)
				owner.emote("gasp")

		var/ratio = inhale_pp/safe_pressure_min
		// Don't fuck them up too fast (space only does HUMAN_MAX_OXYLOSS after all!)
		owner.adjustOxyLoss(max(HUMAN_MAX_OXYLOSS*(1-ratio), 0))
		failed_inhale = 1

		owner.oxygen_alert = max(owner.oxygen_alert, 1)
	else
		// We're in safe limits
		owner.oxygen_alert = 0

	inhaled_gas_used = inhaling/6 * (owner.species?.breath_eff_mul || 1)

	breath.adjust_gas(breath_type, -inhaled_gas_used, update = 0) //update afterwards

	if(exhale_type)
		breath.adjust_gas_temp(exhale_type, inhaled_gas_used, owner.bodytemperature, update = 0) //update afterwards

		// Too much exhaled gas in the air
		if(exhaled_pp > safe_exhaled_max)
			if (!owner.co2_alert|| prob(15))
				var/word = pick("extremely dizzy","short of breath","faint","confused")
				to_chat(owner, "<span class='danger'>You feel [word].</span>")

			owner.adjustOxyLoss(HUMAN_MAX_OXYLOSS)
			owner.co2_alert = 1
			failed_exhale = 1

		else if(exhaled_pp > safe_exhaled_max * 0.7)
			if (!owner.co2_alert || prob(1))
				var/word = pick("dizzy","short of breath","faint","momentarily confused")
				to_chat(owner, "<span class='warning'>You feel [word].</span>")

			//scale linearly from 0 to 1 between safe_exhaled_max and safe_exhaled_max*0.7
			var/ratio = 1.0 - (safe_exhaled_max - exhaled_pp)/(safe_exhaled_max*0.3)

			//give them some oxyloss, up to the limit - we don't want people falling unconcious due to CO2 alone until they're pretty close to safe_exhaled_max.
			if (owner.getOxyLoss() < 50*ratio)
				owner.adjustOxyLoss(HUMAN_MAX_OXYLOSS)
			owner.co2_alert = 1
			failed_exhale = 1

		else if(exhaled_pp > safe_exhaled_max * 0.6)
			if (prob(0.3))
				var/word = pick("a little dizzy","short of breath")
				to_chat(owner, "<span class='warning'>You feel [word].</span>")

		else
			owner.co2_alert = 0

	// Too much poison in the air.
	if(toxins_pp > safe_toxins_max)
		var/ratio = (poison/safe_toxins_max) * 10
		if(reagents)
			reagents.add_reagent("toxin", Clamp(ratio, MIN_TOXIN_DAMAGE, MAX_TOXIN_DAMAGE))
			breath.adjust_gas(poison_type, -poison/6, update = 0) //update after
		owner.phoron_alert = max(owner.phoron_alert, 1)
	else
		owner.phoron_alert = 0

	// If there's some other shit in the air lets deal with it here.
	if(breath.gas["sleeping_agent"])
		var/SA_pp = (breath.gas["sleeping_agent"] / breath.total_moles) * breath_pressure

		// Enough to make us paralysed for a bit
		if(SA_pp > SA_para_min)

			// 3 gives them one second to wake up and run away a bit!
			owner.Paralyse(3)

			// Enough to make us sleep as well
			if(SA_pp > SA_sleep_min)
				owner.Sleeping(10)

		// There is sleeping gas in their lungs, but only a little, so give them a bit of a warning
		else if(SA_pp > 0.15)
			if(prob(20))
				spawn(0)
					owner.emote(pick("giggle", "laugh"))
		breath.adjust_gas("sleeping_agent", -breath.gas["sleeping_agent"]/6, update = 0) //update after

	// Were we able to breathe?
	if (failed_inhale || failed_exhale)
		owner.failed_last_breath = 1
	else
		owner.failed_last_breath = 0
		if(owner.disabilities & ASTHMA)
			owner.adjustOxyLoss(rand(-5,0))
		else
			owner.adjustOxyLoss(-5)


	// Hot air hurts :(
	handle_temperature_effects(breath)

	breath.update_values()

	var/failed_breath = failed_inhale || failed_exhale

	return failed_breath

/obj/item/organ/internal/lungs/proc/handle_temperature_effects(datum/gas_mixture/breath)
	if((breath.temperature < species.cold_level_1 || breath.temperature > species.heat_level_1) && !(COLD_RESISTANCE in owner.mutations))

		if(breath.temperature <= owner.species.cold_level_1)
			if(prob(20))
				to_chat(owner, "<span class='danger'>You feel your face freezing and icicles forming in your lungs!</span>")
		else if(breath.temperature >= owner.species.heat_level_1)
			if(prob(20))
				to_chat(owner, "<span class='danger'>You feel your face burning and a searing heat in your lungs!</span>")

		if(breath.temperature >= owner.species.heat_level_1)
			if(breath.temperature < owner.species.heat_level_2)
				owner.apply_damage(HEAT_GAS_DAMAGE_LEVEL_1, BURN, BP_HEAD, used_weapon = "Excessive Heat")
				owner.fire_alert = max(owner.fire_alert, 2)
			else if(breath.temperature < species.heat_level_3)
				owner.apply_damage(HEAT_GAS_DAMAGE_LEVEL_2, BURN, BP_HEAD, used_weapon = "Excessive Heat")
				owner.fire_alert = max(owner.fire_alert, 2)
			else
				owner.apply_damage(HEAT_GAS_DAMAGE_LEVEL_3, BURN, BP_HEAD, used_weapon = "Excessive Heat")
				owner.fire_alert = max(owner.fire_alert, 2)

		else if(breath.temperature <= owner.species.cold_level_1)
			if(breath.temperature > species.cold_level_2)
				owner.apply_damage(COLD_GAS_DAMAGE_LEVEL_1, BURN, BP_HEAD, used_weapon = "Excessive Cold")
				owner.fire_alert = max(owner.fire_alert, 1)
			else if(breath.temperature > species.cold_level_3)
				owner.apply_damage(COLD_GAS_DAMAGE_LEVEL_2, BURN, BP_HEAD, used_weapon = "Excessive Cold")
				owner.fire_alert = max(owner.fire_alert, 1)
			else
				owner.apply_damage(COLD_GAS_DAMAGE_LEVEL_3, BURN, BP_HEAD, used_weapon = "Excessive Cold")
				owner.fire_alert = max(owner.fire_alert, 1)

		//breathing in hot/cold air also heats/cools you a bit
		var/temp_adj = breath.temperature - owner.bodytemperature
		if (temp_adj < 0)
			temp_adj /= (BODYTEMP_COLD_DIVISOR * 5)	//don't raise temperature as much as if we were directly exposed
		else
			temp_adj /= (BODYTEMP_HEAT_DIVISOR * 5)	//don't raise temperature as much as if we were directly exposed

		var/relative_density = breath.total_moles / (MOLES_CELLSTANDARD * BREATH_PERCENTAGE)
		temp_adj *= relative_density

		if (temp_adj > BODYTEMP_HEATING_MAX) temp_adj = BODYTEMP_HEATING_MAX
		if (temp_adj < BODYTEMP_COOLING_MAX) temp_adj = BODYTEMP_COOLING_MAX
		owner.bodytemperature += temp_adj

	else if(breath.temperature >= owner.species.heat_discomfort_level)
		owner.species.get_environment_discomfort(src,"heat")
	else if(breath.temperature <= owner.species.cold_discomfort_level)
		owner.species.get_environment_discomfort(src,"cold")

#undef HUMAN_MAX_OXYLOSS
#undef HUMAN_CRIT_MAX_OXYLOSS