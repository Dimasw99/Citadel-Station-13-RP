/obj/item/vehicle_module/cloak
	name = "cloaking device"
	desc = "Integrated cloaking system. High power usage, but does render you invisible to the naked eye. Doesn't prevent noise, however."
	icon_state = "tesla"
	origin_tech = list(TECH_MAGNET = 5, TECH_DATA = 5)
	equip_cooldown = 2 SECONDS
	energy_drain = 300
	range = 0

	equip_type = EQUIP_SPECIAL

	var/datum/global_iterator/mecha_cloak/cloak_iterator

/obj/item/vehicle_module/cloak/Initialize(mapload)
	. = ..()
	cloak_iterator = new /datum/global_iterator/mecha_cloak(list(src),0)
	cloak_iterator.set_delay(equip_cooldown)

/obj/item/vehicle_module/cloak/Destroy()
	QDEL_NULL(cloak_iterator)
	return ..()

/obj/item/vehicle_module/cloak/detach()
	QDEL_NULL(cloak_iterator)
	if(!equip_ready) //We were running
		stop_cloak()
	return ..()

/obj/item/vehicle_module/cloak/get_equip_info()
	if(!chassis)
		return
	return "<span style=\"color:[equip_ready ? "#0f0":"#f00"];\">*</span>&nbsp;[src.name] - <a href='?src=\ref[src];toggle_cloak=1'>[equip_ready ? "A" : "Dea"]ctivate</a>"

/obj/item/vehicle_module/cloak/Topic(href, href_list)
	..()
	if(href_list["toggle_cloak"])
		if(equip_ready)
			start_cloak()
		else
			stop_cloak()
	return

/obj/item/vehicle_module/cloak/proc/start_cloak()
	if(chassis)
		chassis.cloak()
	log_message("Activated.")
	cloak_iterator.start()
	set_ready_state(0)
	playsound(src, 'sound/effects/EMPulse.ogg', 100, 1)

/obj/item/vehicle_module/cloak/proc/stop_cloak()
	if(chassis)
		chassis.uncloak()
	log_message("Deactivated.")
	cloak_iterator.stop()
	set_ready_state(1)
	playsound(src, 'sound/effects/EMPulse.ogg', 100, 1)

// These things are so silly
/datum/global_iterator/mecha_cloak/process(var/obj/item/vehicle_module/cloak/cloak)
	//Removed from chassis
	if(!cloak.chassis)
		stop()
		cloak.stop_cloak()
		return
	//Ran out of power
	if(!cloak.chassis.use_power(cloak.energy_drain))
		stop()
		cloak.stop_cloak()
		return
