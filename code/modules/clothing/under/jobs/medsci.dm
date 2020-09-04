/*
 * Science
 */
/obj/item/clothing/under/rank/research_director
	desc = "It's a jumpsuit worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	name = "research director's jumpsuit"
	icon_state = "rd"
	item_state = "rd"
	icon = 'icons/clothing/under/uniforms/rd.dmi'
	contained_sprite = TRUE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/research_director/rdalt
	desc = "A dress suit and slacks stained with hard work and dedication to science. Perhaps other things as well, but mostly hard work and dedication."
	name = "head researcher uniform"
	icon_state = "rd_alt"
	item_state = "rd_alt"
	icon = 'icons/clothing/under/uniforms/rd_alt.dmi'
	contained_sprite = TRUE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/research_director/dress_rd
	name = "research director dress uniform"
	desc = "Feminine fashion for the style concious RD. Its fabric provides minor protection from biological contaminants."
	icon_state = "dress_rd"
	item_state = "dress_rd"
	icon = 'icons/clothing/under/uniforms/rd_dress.dmi'
	contained_sprite = TRUE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/scientist
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has markings that denote the wearer as a scientist."
	name = "scientist's jumpsuit"
	icon_state = "rnd"
	item_state = "rnd"
	icon = 'icons/clothing/under/uniforms/rnd.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/scientist/xenoarcheologist
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has markings that denote the wearer as a scientist."
	name = "xenoarcheologist's jumpsuit"
	icon_state = "xenoarch"
	item_state = "xenoarch"
	icon = 'icons/clothing/under/uniforms/rnd_xenoarch.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/scientist/science_alt
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has markings that denote the wearer as a scientist."
	name = "scientist's uniform"
	icon_state = "rnd_alt"
	item_state = "rnd_alt"
	icon = 'icons/clothing/under/uniforms/rnd_alt.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/scientist/botany
	desc = "It's made of a special fiber that provides minor protection against biohazards. Its colour denotes the wearer as a xenobotanist."
	icon_state = "botany"
	item_state = "botany"
	icon = 'icons/clothing/under/uniforms/rnd_botany.dmi'
	contained_sprite = TRUE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 5, rad = 0)

/obj/item/clothing/under/rank/scientist/intern
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has markings that denote the wearer as a laboratory assistant."
	name = "laboratory assistant's jumpsuit"
	icon_state = "rnd_intern"
	item_state = "rnd_intern"
	icon = 'icons/clothing/under/uniforms/rnd_intern.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/pharmacist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a pharmacist rank stripe on it."
	name = "pharmacist's jumpsuit"
	icon_state = "chemistry"
	item_state = "chemistry"
	icon = 'icons/clothing/under/uniforms/med_chemistry.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/xenoarcheologist
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has markings that denote the wearer as a xenoarcheologist."
	icon_state = "xenoarch"
	item_state = "xenoarch"
	icon = 'icons/clothing/under/uniforms/rnd_xenoarch.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 10, bio = 0, rad = 0)

/*
 * Medical
 */
/obj/item/clothing/under/rank/chief_medical_officer
	desc = "It's a jumpsuit worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	name = "chief medical officer's jumpsuit"
	icon_state = "cmo"
	item_state = "cmo"
	icon = 'icons/clothing/under/uniforms/cmo.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/geneticist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	name = "geneticist's jumpsuit"
	icon_state = "genetics"
	item_state = "w_suit"
	worn_state = "geneticswhite"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/virologist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a virologist rank stripe on it."
	name = "virologist's jumpsuit"
	icon_state = "virology"
	item_state = "w_suit"
	worn_state = "virology"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/iacjumpsuit
	desc = "It's a blue and white jumpsuit, the IAC logo plastered across the back."
	name = "IAC uniform"
	icon_state = "iacuniform"
	item_state = "iacuniform"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 15, rad = 5)

/obj/item/clothing/under/rank/medical
	desc = "It's made of a special fiber that provides minor protection against biohazards. It denotes that the wearer is trained medical personnel."
	name = "physician's jumpsuit"
	icon_state = "med"
	item_state = "med"
	icon = 'icons/clothing/under/uniforms/med.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medical/intern
	desc = "It's made of a special fiber that provides minor protection against biohazards. It denotes that the wearer is still a medical intern."
	name = "medical resident's jumpsuit"
	icon_state = "med_intern"
	item_state = "med_intern"
	icon = 'icons/clothing/under/uniforms/med_intern.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/medical/blue
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in baby blue."
	icon_state = "scrubsblue"
	item_state = "scrubsblue"
	icon = 'icons/clothing/under/uniforms/med_scrubs.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/medical/green
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in dark green."
	icon_state = "scrubsgreen"
	item_state = "scrubsgreen"
	icon = 'icons/clothing/under/uniforms/med_scrubs.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/medical/purple
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in deep purple."
	icon_state = "scrubspurple"
	item_state = "scrubspurple"
	icon = 'icons/clothing/under/uniforms/med_scrubs.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/medical/black
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in black."
	icon_state = "scrubsblack"
	item_state = "scrubsblack"
	icon = 'icons/clothing/under/uniforms/med_scrubs.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/medical/emt
	name = "first responder jumpsuit"
	desc = "A jumpsuit that denotes the wearer as a Nanotrasen First Responder."
	icon = 'icons/clothing/kit/emt.dmi'
	contained_sprite = TRUE
	icon_state = "emtjumpsuit"
	item_state = "emtjumpsuit"

/obj/item/clothing/under/rank/psych
	desc = "A basic white jumpsuit. It has turqouise markings that denote the wearer as a psychiatrist."
	name = "psychiatrist's jumpsuit"
	icon_state = "psych"
	item_state = "psych"
	icon = 'icons/clothing/under/uniforms/med_psych.dmi'
	contained_sprite = TRUE

/obj/item/clothing/under/rank/biochemist
	desc = "Made of a special fiber that gives increased protection against hazards."
	name = "chemist's jumpsuit"
	icon_state = "chemistry"
	item_state = "chemistry"
	icon = 'icons/clothing/under/uniforms/med_chemistry.dmi'
	contained_sprite = TRUE
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
