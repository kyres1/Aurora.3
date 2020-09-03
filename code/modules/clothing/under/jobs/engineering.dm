//Contains: Engineering department jumpsuits
/obj/item/clothing/under/rank/chief_engineer
	name = "chief engineer's jumpsuit"
	desc = "It's a high visibility jumpsuit given to those engineers insane enough to achieve the rank of \"Chief Engineer\". It has minor radiation shielding."
	icon_state = "ce"
	item_state = "ce"
	icon = 'icons/clothing/under/uniforms/ce.dmi'
	contained_sprite = TRUE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 10)
	siemens_coefficient = 0.75

/obj/item/clothing/under/rank/atmospheric_technician
	name = "atmospheric technician's jumpsuit"
	desc = "It's a jumpsuit worn by atmospheric technicians."
	icon_state = "engine_atmos"
	item_state = "engine_atmos"
	icon = 'icons/clothing/under/uniforms/eng_atmos.dmi'
	contained_sprite = TRUE
	siemens_coefficient = 0.75

/obj/item/clothing/under/rank/engineer
	name = "engineer's jumpsuit"
	desc = "It's an orange high visibility jumpsuit worn by engineers. It has minor radiation shielding."
	icon_state = "engine"
	item_state = "engine"
	icon = 'icons/clothing/under/uniforms/eng.dmi'
	contained_sprite = TRUE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 10)
	siemens_coefficient = 0.75

/obj/item/clothing/under/rank/engineer/apprentice
	name = "engineering apprentice's jumpsuit"
	desc = "It's a noticeably cheaper high visibility jumpsuit worn by engineering apprentices. It has minor radiation shielding."
	icon_state = "engine_app"
	item_state = "engine_app"
	icon = 'icons/clothing/under/uniforms/eng_apprentice.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/roboticist
	name = "roboticist's jumpsuit"
	desc = "It's a white and purple jumpsuit with reinforced seams; great for industrial work."
	icon_state = "robotics"
	item_state = "robotics"
	icon = 'icons/clothing/under/uniforms/rnd_robotics.dmi'
	contained_sprite = TRUE
	siemens_coefficient = 0.75
