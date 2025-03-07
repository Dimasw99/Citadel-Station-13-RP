/obj/item/robot_parts
	name = "robot parts"
	icon = 'icons/obj/robot_parts.dmi'
	item_state = "buildpipe"
	icon_state = "blank"
	slot_flags = SLOT_BELT
	var/list/part = null // Order of args is important for installing robolimbs.
	var/sabotaged = 0 //Emagging limbs can have repercussions when installed as prosthetics.
	var/model_info
	dir = SOUTH

/obj/item/robot_parts/l_arm
	name = "cyborg left arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	icon_state = "l_arm"
	part = list(BP_L_ARM, BP_L_HAND)
	model_info = 1

/obj/item/robot_parts/r_arm
	name = "cyborg right arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	icon_state = "r_arm"
	part = list(BP_R_ARM, BP_R_HAND)
	model_info = 1

/obj/item/robot_parts/l_leg
	name = "cyborg left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	icon_state = "l_leg"
	part = list(BP_L_LEG, BP_L_FOOT)
	model_info = 1

/obj/item/robot_parts/r_leg
	name = "cyborg leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	icon_state = "r_leg"
	part = list(BP_R_LEG, BP_R_FOOT)
	model_info = 1

/obj/item/robot_parts/chest
	name = "cyborg chest"
	desc = "A heavily reinforced case containing cyborg logic boards, with space for a standard power cell."
	icon_state = "chest"
	part = list(BP_GROIN,BP_TORSO)
	var/wires = 0.0
	var/obj/item/cell/cell = null

/obj/item/robot_parts/head
	name = "cyborg head"
	desc = "A standard reinforced braincase, with spine-plugged neural socket and sensor gimbals."
	icon_state = "head"
	part = list(BP_HEAD)
	var/obj/item/flash/flash1 = null
	var/obj/item/flash/flash2 = null

/obj/item/robot_parts/robot_suit
	name = "endoskeleton"
	desc = "A complex metal backbone with standard limb sockets and pseudomuscle anchors."
	icon_state = "robo_suit"
	var/obj/item/robot_parts/l_arm/l_arm = null
	var/obj/item/robot_parts/r_arm/r_arm = null
	var/obj/item/robot_parts/l_leg/l_leg = null
	var/obj/item/robot_parts/r_leg/r_leg = null
	var/obj/item/robot_parts/chest/chest = null
	var/obj/item/robot_parts/head/head = null
	var/created_name = ""

/obj/item/robot_parts/robot_suit/Initialize(mapload)
	. = ..()
	updateicon()

/obj/item/robot_parts/robot_suit/proc/updateicon()
	cut_overlays()

	var/list/overlays_to_add = list()
	if(l_arm)
		overlays_to_add += "l_arm+o"
	if(r_arm)
		overlays_to_add += "r_arm+o"
	if(chest)
		overlays_to_add += "chest+o"
	if(l_leg)
		overlays_to_add += "l_leg+o"
	if(r_leg)
		overlays_to_add += "r_leg+o"
	if(head)
		overlays_to_add += "head+o"

	add_overlay(overlays_to_add)

/obj/item/robot_parts/robot_suit/proc/check_completion()
	if(src.l_arm && src.r_arm)
		if(src.l_leg && src.r_leg)
			if(src.chest && src.head)
				feedback_inc("cyborg_frames_built",1)
				return 1
	return 0

/obj/item/robot_parts/robot_suit/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if(W.is_material_stack_of(/datum/prototype/material/steel) && !l_arm && !r_arm && !l_leg && !r_leg && !chest && !head)
		var/obj/item/stack/material/M = W
		if (M.use(1))
			new /obj/item/secbot_assembly/ed209_assembly(get_turf(src))
			to_chat(user, "<span class='notice'>You armed the robot frame.</span>")
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You need one sheet of metal to arm the robot frame.</span>")
	if(istype(W, /obj/item/robot_parts/l_leg))
		if(l_leg)
			return
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		l_leg = W
		updateicon()

	if(istype(W, /obj/item/robot_parts/r_leg))
		if(r_leg)
			return
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		r_leg = W
		updateicon()

	if(istype(W, /obj/item/robot_parts/l_arm))
		if(l_arm)
			return
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		l_arm = W
		updateicon()

	if(istype(W, /obj/item/robot_parts/r_arm))
		if(r_arm)
			return
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		r_arm = W
		updateicon()

	if(istype(W, /obj/item/robot_parts/chest))
		if(chest)
			return
		if(W:wires && W:cell)
			if(!user.attempt_insert_item_for_installation(W, src))
				return
			chest = W
			updateicon()
		else if(!W:wires)
			to_chat(user, "<span class='warning'>You need to attach wires to it first!</span>")
		else
			to_chat(user, "<span class='warning'>You need to attach a cell to it first!</span>")

	if(istype(W, /obj/item/robot_parts/head))
		if(head)
			return
		if(W:flash2 && W:flash1)
			if(!user.attempt_insert_item_for_installation(W, src))
				return
			head = W
			updateicon()
		else
			to_chat(user, "<span class='warning'>You need to attach a flash to it first!</span>")

	if(istype(W, /obj/item/mmi))
		var/obj/item/mmi/M = W
		if(check_completion())
			if(!istype(loc,/turf))
				to_chat(user, "<span class='warning'>You can't put \the [W] in, the frame has to be standing on the ground to be perfectly precise.</span>")
				return
			if(!istype(W, /obj/item/mmi/inert))
				if(!M.brainmob)
					to_chat(user, "<span class='warning'>Sticking an empty [W] into the frame would sort of defeat the purpose.</span>")
					return
				if(!M.brainmob.key)
					var/ghost_can_reenter = 0
					if(M.brainmob.mind)
						for(var/mob/observer/dead/G in GLOB.player_list)
							if(G.can_reenter_corpse && G.mind == M.brainmob.mind)
								ghost_can_reenter = 1 //May come in use again at another point.
								to_chat(user, "<span class='notice'>\The [W] is completely unresponsive; though it may be able to auto-resuscitate.</span>") //Jamming a ghosted brain into a borg is likely detrimental, and may result in some problems.
								return
					if(!ghost_can_reenter)
						to_chat(user, "<span class='notice'>\The [W] is completely unresponsive; there's no point.</span>")
						return

				if(M.brainmob.stat == DEAD)
					to_chat(user, "<span class='warning'>Sticking a dead [W] into the frame would sort of defeat the purpose.</span>")
					return

				if(jobban_isbanned(M.brainmob, "Cyborg"))
					to_chat(user, "<span class='warning'>This [W] does not seem to fit.</span>")
					return
			if(!user.temporarily_remove_from_inventory(W))
				return
			var/mob/living/silicon/robot/O = new /mob/living/silicon/robot(get_turf(loc), TRUE)
			if(!O)
				return

			O.mmi = W
			O.post_mmi_setup()
			O.invisibility = 0
			O.custom_name = created_name
			O.updatename("Default")

			if(M.brainmob)
				M.brainmob.mind.transfer(O)
				if(O.mind && O.mind.special_role)
					O.mind.store_memory("In case you look at this after being borged, the objectives are only here until I find a way to make them not show up for you, as I can't simply delete them without screwing up round-end reporting. --NeoFite")
				for(var/datum/prototype/language/L in M.brainmob.languages)
					O.add_language(L.name)
			O.job = "Cyborg"
			O.cell = chest.cell
			O.cell.forceMove(O)
			W.forceMove(O) //Should fix cybros run time erroring when blown up. It got deleted before, along with the frame.

			// Since we "magically" installed a cell, we also have to update the correct component.
			if(O.cell)
				var/datum/robot_component/cell_component = O.components["power cell"]
				cell_component.wrapped = O.cell
				cell_component.installed = 1

			feedback_inc("cyborg_birth",1)
			callHook("borgify", list(O))
			O.Namepick()

			qdel(src)
		else
			to_chat(user, "<span class='warning'>The MMI must go in after everything else!</span>")

	if (istype(W, /obj/item/pen))
		var/t = sanitizeSafe(input(user, "Enter new robot name", src.name, src.created_name), MAX_NAME_LEN)
		if (!t)
			return
		if (!in_range(src, usr) && src.loc != usr)
			return

		src.created_name = t

	return

/obj/item/robot_parts/chest/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/cell))
		if(cell)
			to_chat(user, "<span class='warning'>You have already inserted a cell!</span>")
			return
		else
			if(!user.attempt_insert_item_for_installation(W, src))
				return
			cell = W
			to_chat(user, "<span class='notice'>You insert the cell!</span>")
	if(istype(W, /obj/item/stack/cable_coil))
		if(wires)
			to_chat(user, "<span class='warning'>You have already inserted wire!</span>")
			return
		else
			var/obj/item/stack/cable_coil/coil = W
			coil.use(1)
			wires = 1.0
			to_chat(user, "<span class='notice'>You insert the wire!</span>")
	return

/obj/item/robot_parts/head/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/flash))
		if(istype(user,/mob/living/silicon/robot))
			var/current_module = user.get_active_held_item()
			if(current_module == W)
				to_chat(user, "<span class='warning'>How do you propose to do that?</span>")
				return
			else
				add_flashes(W,user)
		else
			add_flashes(W,user)
	return

/obj/item/robot_parts/head/proc/add_flashes(obj/item/W as obj, mob/user as mob) //Made into a seperate proc to avoid copypasta
	if(flash1 && flash2)
		to_chat(user, "<span class='notice'>You have already inserted the eyes!</span>")
		return
	else if(src.flash1)
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		flash2 = W
		to_chat(user, "<span class='notice'>You insert the flash into the eye socket!</span>")
	else
		if(!user.attempt_insert_item_for_installation(W, src))
			return
		flash1 = W
		to_chat(user, "<span class='notice'>You insert the flash into the eye socket!</span>")


/obj/item/robot_parts/emag_act(var/remaining_charges, var/mob/user)
	if(sabotaged)
		to_chat(user, "<span class='warning'>[src] is already sabotaged!</span>")
	else
		to_chat(user, "<span class='warning'>You short out the safeties.</span>")
		sabotaged = 1
		return 1
