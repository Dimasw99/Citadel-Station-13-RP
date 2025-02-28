/obj/item/gun/projectile/energy
	name = "energy gun"
	desc = "A basic energy-based gun. Nanotrasen, Hephaestus, Ward-Takahashi, and countless other smaller corporations have their own version of this reliable design."
	icon = 'icons/obj/gun/energy.dmi'
	icon_state = "energy"
	fire_sound_text = "laser blast"

	accuracy = 100
	dispersion = list(0)

	var/obj/item/cell/power_supply //What type of power cell this uses
	var/charge_cost = 240 //How much energy is needed to fire.

	var/accept_cell_type = /obj/item/cell/device
	var/cell_type = /obj/item/cell/device/weapon
	projectile_type = /obj/projectile/beam/practice

	var/modifystate
	var/charge_meter = 1	//if set, the icon state will be chosen based on the current charge

	//self-recharging
	var/self_recharge = 0	//if set, the weapon will recharge itself
	var/use_external_power = 0 //if set, the weapon will look for an external power source to draw from, otherwise it recharges magically
	var/use_organic_power = 0 // If set, the weapon will draw from nutrition or blood.
	var/recharge_time = 4
	var/charge_tick = 0
	var/charge_delay = 75	//delay between firing and charging

	var/battery_lock = 0	//If set, weapon cannot switch batteries

/obj/item/gun/projectile/energy/Initialize(mapload)
	. = ..()
	if(self_recharge)
		power_supply = new /obj/item/cell/device/weapon(src)
		START_PROCESSING(SSobj, src)
	else
		if(cell_type)
			power_supply = new cell_type(src)
		else
			power_supply = null

	update_icon()

/obj/item/gun/projectile/energy/Destroy()
	if(self_recharge)
		STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/gun/projectile/energy/get_cell(inducer)
	return power_supply

/obj/item/gun/projectile/energy/process(delta_time)
	if(self_recharge) //Every [recharge_time] ticks, recharge a shot for the battery
		if(world.time > last_shot + charge_delay)	//Doesn't work if you've fired recently
			if(!power_supply || power_supply.charge >= power_supply.maxcharge)
				return 0 // check if we actually need to recharge

			charge_tick++
			if(charge_tick < recharge_time) return 0
			charge_tick = 0

			var/rechargeamt = power_supply.maxcharge*0.2

			if(use_external_power)
				var/obj/item/cell/external = get_external_power_supply()
				if(!external || !external.use(rechargeamt)) //Take power from the borg...
					return 0

			if(use_organic_power)
				var/mob/living/carbon/human/H
				if(ishuman(loc))
					H = loc

				if(istype(loc, /obj/item/organ))
					var/obj/item/organ/O = loc
					if(O.owner)
						H = O.owner

				if(istype(H))
					var/start_nutrition = H.nutrition
					var/end_nutrition = 0

					H.nutrition -= rechargeamt / 10

					end_nutrition = H.nutrition

					if(start_nutrition - max(0, end_nutrition) < rechargeamt / 10)
						H.remove_blood((rechargeamt / 10) - (start_nutrition - max(0, end_nutrition)))

			power_supply.give(rechargeamt) //... to recharge 1/5th the battery
			update_icon()
		else
			charge_tick = 0
	return 1

/obj/item/gun/projectile/energy/attackby(var/obj/item/A as obj, mob/user as mob)
	..()

/obj/item/gun/projectile/energy/switch_firemodes(mob/user)
	if(..())
		update_icon()

/obj/item/gun/projectile/energy/emp_act(severity)
	..()
	update_icon()

/obj/item/gun/projectile/energy/consume_next_projectile()
	if(!power_supply)
		return null
	if(!ispath(projectile_type))
		return null
	if(!power_supply.checked_use(charge_cost))
		return null
	return new projectile_type(src)

/obj/item/gun/projectile/energy/proc/load_ammo(var/obj/item/C, mob/user)
	if(istype(C, /obj/item/cell))
		if(self_recharge || battery_lock)
			to_chat(user, "<span class='notice'>[src] does not have a battery port.</span>")
			return
		if(istype(C, accept_cell_type))
			var/obj/item/cell/P = C
			if(power_supply)
				to_chat(user, "<span class='notice'>[src] already has a power cell.</span>")
			else
				user.visible_message("[user] is reloading [src].", "<span class='notice'>You start to insert [P] into [src].</span>")
				if(do_after(user, 5 * P.w_class))
					if(!user.attempt_insert_item_for_installation(P, src))
						return
					power_supply = P
					user.visible_message("[user] inserts [P] into [src].", "<span class='notice'>You insert [P] into [src].</span>")
					playsound(src, 'sound/weapons/flipblade.ogg', 50, 1)
					update_icon()
					update_worn_icon()
		else
			to_chat(user, "<span class='notice'>This cell is not fitted for [src].</span>")
	return

/obj/item/gun/projectile/energy/proc/unload_ammo(mob/user)
	if(self_recharge || battery_lock)
		to_chat(user, "<span class='notice'>[src] does not have a battery port.</span>")
		return
	if(power_supply)
		user.put_in_hands(power_supply)
		power_supply.update_icon()
		user.visible_message("[user] removes [power_supply] from [src].", "<span class='notice'>You remove [power_supply] from [src].</span>")
		power_supply = null
		playsound(src, 'sound/weapons/empty.ogg', 50, 1)
		update_icon()
		update_worn_icon()
	else
		to_chat(user, "<span class='notice'>[src] does not have a power cell.</span>")

/obj/item/gun/projectile/energy/attackby(var/obj/item/A as obj, mob/user as mob)
	..()
	load_ammo(A, user)

/obj/item/gun/projectile/energy/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)
	if(user.get_inactive_held_item() == src)
		unload_ammo(user)
	else
		return ..()

/obj/item/gun/projectile/energy/proc/get_external_power_supply()
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return R.cell
	if(istype(src.loc, /obj/item/hardsuit_module))
		var/obj/item/hardsuit_module/module = src.loc
		if(module.holder && module.holder.wearer)
			var/mob/living/carbon/human/H = module.holder.wearer
			if(istype(H) && H.back)
				var/obj/item/hardsuit/suit = H.back
				if(istype(suit))
					return suit.cell
	return null

/obj/item/gun/projectile/energy/examine(mob/user, dist)
	. = ..()
	if(power_supply)
		if(charge_cost)
			var/shots_remaining = round(power_supply.charge / max(1, charge_cost))	// Paranoia
			. += "Has [shots_remaining] shot\s remaining."
		else
			. += "Has infinite shots remaining."
	else
		. += "Does not have a power cell."
	return

/obj/item/gun/projectile/energy/update_icon(ignore_inhands)
	. = ..()
	if((item_renderer || mob_renderer) || !render_use_legacy_by_default)
		return // using new system
	if(power_supply == null)
		if(modifystate)
			icon_state = "[modifystate]_open"
		else
			icon_state = "[initial(icon_state)]_open"
		return
	else if(charge_meter)
		var/ratio = power_supply.percent() * 0.01

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(power_supply.charge < charge_cost)
			ratio = 0
		else
			ratio = max(round(ratio, 0.25) * 100, 25)

		if(modifystate)
			icon_state = "[modifystate][ratio]"
		else
			icon_state = "[initial(icon_state)][ratio]"

	else if(power_supply)
		if(modifystate)
			icon_state = "[modifystate]"
		else
			icon_state = "[initial(icon_state)]"

	if(!ignore_inhands)
		update_worn_icon()

/obj/item/gun/projectile/energy/proc/start_recharge()
	if(power_supply == null)
		power_supply = new /obj/item/cell/device/weapon(src)
	self_recharge = 1
	START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/gun/projectile/energy/get_description_interaction(mob/user)
	var/list/results = list()

	if(!battery_lock && !self_recharge)
		if(power_supply)
			results += "[desc_panel_image("offhand", user)]to remove the weapon cell."
		else
			results += "[desc_panel_image("weapon cell")]to add a new weapon cell."

	results += ..()

	return results

/obj/item/gun/projectile/energy/inducer_scan(obj/item/inducer/I, list/things_to_induce, inducer_flags)
	if(inducer_flags & INDUCER_NO_GUNS)
		return
	return ..()

//* Ammo *//

/obj/item/gun/projectile/energy/get_ammo_ratio()
	if(!power_supply)
		return 0
	return power_supply.charge / power_supply.maxcharge
