/obj/item/deskbell
	name = "desk bell"
	desc = "An annoying bell. Ring for service."
	icon = 'icons/obj/items.dmi'
	icon_state = "deskbell"
	damage_force = 2
	throw_force = 2
	w_class = 2.0
	attack_sound = 'sound/effects/deskbell.ogg'
	var/broken
	attack_verb = list("annoyed")
	var/static/radial_examine = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_examine")
	var/static/radial_use = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_use")
	var/static/radial_pickup = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_pickup")

/obj/item/deskbell/examine(mob/user, dist)
	. = ..()
	if(broken)
		. += "<span class = 'danger'>It looks damaged, the ringer is stuck firmly inside.</span>"

/obj/item/deskbell/attack_hand(mob/user, datum/event_args/actor/clickchain/e_args)

	//This defines the radials and what call we're assiging to them.
	var/list/options = list()
	options["examine"] = radial_examine
	options["pick up"] = radial_pickup
	if(!broken)
		options["use"] = radial_use


	// Just an example, if the bell had no options, due to conditionals, nothing would happen here.
	if(length(options) < 1)
		return

	// Right, if there's only one available radial...
	// For example, say, the bell's broken so you can only examine, it just does that (doesn't show radial)..
	var/list/choice = list()
	if(length(options) == 1)
		for(var/key in options)
			choice = key
	else
	// If we have other options, it will show the radial menu for the player to decide.
		choice = show_radial_menu(user, src, options, require_near = !issilicon(user))

	// Once the player has decided their option, choose the behaviour that will happen under said option.
	switch(choice)
		if("examine")
			user.do_examinate(src)

		if("use")
			if(check_ability(user))
				ring(user)
				add_fingerprint(user)

		if("pick up")
			..()

/obj/item/deskbell/proc/ring(mob/user)
	if(user.a_intent == "harm")
		playsound(user.loc, 'sound/effects/deskbell_rude.ogg', 50, 1)
		to_chat(user,"<span class='notice'>You hammer [src] rudely!</span>")
		if (prob(2))
			break_bell(user)
	else
		playsound(user.loc, 'sound/effects/deskbell.ogg', 50, 1)
		to_chat(user,"<span class='notice'>You gracefully ring [src].</span>")

/obj/item/deskbell/proc/check_ability(mob/user)
	if (ishuman(user))
		return 1
	else
		to_chat(user,"<span class='notice'>You are not able to ring [src].</span>")
	return 0

/obj/item/deskbell/attackby(obj/item/W, mob/user, params)
	if(!istype(W))
		return
	if(W.is_wrench() && isturf(loc))
		if(do_after(5))
			if(!src) return
			to_chat(user, "<span class='notice'>You dissasemble the desk bell</span>")
			new /obj/item/stack/material/steel(get_turf(src), 1)
			qdel(src)
			return
	if(!broken)
		ring(user)


/obj/item/deskbell/proc/break_bell(mob/user)
	to_chat(user,"<span class='notice'>The ringing abruptly stops as [src]'s ringer gets jammed inside!</span>")
	broken = 1
