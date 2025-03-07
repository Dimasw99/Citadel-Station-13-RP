// // // External Organs
/obj/item/organ/external/chest/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 200
	min_broken_damage = 1000
	vital = TRUE
	emp_mod = 7

/obj/item/organ/external/groin/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 100
	min_broken_damage = 1000 //Multiple
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/head/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000 //Inheritance
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/arm/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000 //Please
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/arm/right/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/leg/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/leg/right/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/hand/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/hand/right/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/foot/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

/obj/item/organ/external/foot/right/unbreakable/nano
	robotic = ORGAN_NANOFORM
	encased = FALSE
	max_damage = 80
	min_broken_damage = 1000
	vital = FALSE
	emp_mod = 4

// // // Internal Organs
/obj/item/organ/internal/nano
	robotic = ORGAN_ROBOT

/obj/item/organ/internal/nano/orchestrator
	name = "orchestrator module"
	desc = "A small computer, designed for highly parallel workloads."
	icon = 'icons/mob/clothing/species/protean/protean.dmi'
	icon_state = "orchestrator"
	organ_tag = O_ORCH
	parent_organ = BP_TORSO
	vital = TRUE

/obj/item/organ/internal/nano/refactory
	name = "refactory module"
	desc = "A miniature metal processing unit and nanite factory."
	icon = 'icons/mob/clothing/species/protean/protean.dmi'
	icon_state = "refactory"
	organ_tag = O_FACT
	parent_organ = BP_TORSO

	var/list/stored_materials = list(MAT_STEEL = 0)
	var/max_storage = 10000
	var/processingbuffs = FALSE

/obj/item/organ/internal/nano/refactory/proc/get_stored_material(var/material)
	if(status & ORGAN_DEAD)
		return 0
	return stored_materials[material] || 0

/obj/item/organ/internal/nano/refactory/proc/add_stored_material(var/material,var/amt)
	if(status & ORGAN_DEAD)
		return 0
	var/increase = min(amt,max(max_storage-stored_materials[material],0))
	if(isnum(stored_materials[material]))
		stored_materials[material] += increase
	else
		stored_materials[material] = increase

	return increase

/obj/item/organ/internal/nano/refactory/proc/use_stored_material(var/material,var/amt)
	if(status & ORGAN_DEAD)
		return 0

	var/available = stored_materials[material]

	//Success
	if(available >= amt)
		var/new_amt = available-amt
		if(new_amt == 0)
			stored_materials -= material
		else
			stored_materials[material] = new_amt
		return amt

	//Failure
	return 0

/obj/item/organ/internal/nano/refactory/loaded
	stored_materials = list(
		MAT_STEEL = /obj/item/organ/internal/nano/refactory::max_storage,
	)

/obj/item/organ/internal/mmi_holder/posibrain/nano
	name = "protean posibrain"
	desc = "A more advanced version of the standard posibrain, typically found in protean bodies."
	icon = 'icons/mob/clothing/species/protean/protean.dmi'
	icon_state = "posi"
	parent_organ = BP_TORSO

	brain_type = /obj/item/mmi/digital/posibrain/nano

/obj/item/organ/internal/mmi_holder/posibrain/nano/robotize()
	. = ..()
	icon_state = "posi1"

/obj/item/organ/internal/mmi_holder/posibrain/nano/mechassist()
	. = ..()
	icon_state = "posi1"


/obj/item/organ/internal/mmi_holder/posibrain/nano/update_from_mmi()
	. = ..()
	icon = initial(icon)
	icon_state = "posi1"
	stored_mmi.icon_state = "posi1"

	stored_mmi.brainmob.languages = owner.languages

// The 'out on the ground' object, not the organ holder
/obj/item/mmi/digital/posibrain/nano
	name = "protean posibrain"
	desc = "A more advanced version of the standard posibrain, typically found in protean bodies."
	icon = 'icons/mob/clothing/species/protean/protean.dmi'
	icon_state = "posi"

/obj/item/mmi/digital/posibrain/nano/Initialize(mapload)
	. = ..()
	icon_state = "posi"

/obj/item/mmi/digital/posibrain/nano/request_player()
	icon_state = initial(icon_state)
	return //We don't do this stuff

/obj/item/mmi/digital/posibrain/nano/reset_search()
	icon_state = initial(icon_state)
	return //Don't do this either because of the above

/obj/item/mmi/digital/posibrain/nano/transfer_personality()
	. = ..()
	icon_state = "posi1"

/obj/item/mmi/digital/posibrain/nano/transfer_identity()
	. = ..()
	icon_state = "posi1"
