// AI EYE
//
// A mob that the AI controls to look around the station with.
// It streams chunks as it moves around, which will show it what the AI can and cannot see.

/mob/observer/eye/aiEye
	name = "Inactive AI Eye"
	icon_state = "AI-eye"

/mob/observer/eye/aiEye/Initialize(mapload)
	. = ..()
	visualnet = GLOB.cameranet

/mob/observer/eye/aiEye/setLoc(var/T, var/cancel_tracking = 1)
	if(..())
		var/mob/living/silicon/ai/ai = owner
		if(cancel_tracking)
			ai.ai_cancel_tracking()
		if(ai.hologram_follow)
			ai.move_active_hologram(T)
		return 1

// AI MOVEMENT

// The AI's "eye". Described on the top of the page.

/mob/living/silicon/ai/proc/destroy_eyeobj(var/atom/new_eye)
	if(!eyeobj)
		return
	if(!new_eye)
		new_eye = src
	eyeobj.owner = null
	qdel(eyeobj) // No AI, no Eye
	eyeobj = null
	if(client)
		client.eye = new_eye

/mob/living/silicon/ai/proc/create_eyeobj(var/newloc)
	if(eyeobj)
		destroy_eyeobj()
	if(!newloc)
		newloc = loc
	eyeobj = new /mob/observer/eye/aiEye(newloc)
	eyeobj.owner = src
	eyeobj.name = "[src.name] (AI Eye)" // Give it a name
	reset_perspective(eyeobj)
	SetName(src.name)

// Intiliaze the eye by assigning it's "ai" variable to us. Then set it's loc to us.
/mob/living/silicon/ai/Initialize(mapload)
	. = ..()
	create_eyeobj()
	return INITIALIZE_HINT_LATELOAD

/mob/living/silicon/ai/LateInitialize()
	if(eyeobj && loc)
		eyeobj.forceMove(loc)

/mob/living/silicon/ai/Destroy()
	destroy_eyeobj()
	return ..()

/atom/proc/move_camera_by_click()
	if(istype(usr, /mob/living/silicon/ai))
		var/mob/living/silicon/ai/AI = usr
		if(AI.eyeobj && AI.client.eye == AI.eyeobj)
			var/turf/T = get_turf(src)
			if(T)
				AI.eyeobj.setLoc(T)

/mob/living/silicon/ai/proc/view_core()
	camera = null
	unset_machine()

	if(!src.eyeobj)
		return

	for(var/datum/chunk/c in eyeobj.visibleChunks)
		c.remove(eyeobj)

	eyeobj.setLoc(src)

/mob/living/silicon/ai/proc/toggle_acceleration()
	set category = "AI Settings"
	set name = "Toggle Camera Acceleration"

	if(!eyeobj)
		return

	eyeobj.acceleration = !eyeobj.acceleration
	to_chat(usr, "Camera acceleration has been toggled [eyeobj.acceleration ? "on" : "off"].")
