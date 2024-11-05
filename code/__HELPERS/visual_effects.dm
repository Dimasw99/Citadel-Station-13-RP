
///Animates source spinning around itself. For docmentation on the args, check atom/proc/SpinAnimation()
/atom/proc/do_spin_animation(speed = 1 SECONDS, loops = -1, segments = 3, angle = 120, parallel = TRUE)
	var/list/matrices = list()
	for(var/i in 1 to segments-1)
		var/matrix/segment_matrix = matrix(transform)
		segment_matrix.Turn(angle*i)
		matrices += segment_matrix
	var/matrix/last = matrix(transform)
	matrices += last

	speed /= segments

	if(parallel)
		animate(src, transform = matrices[1], time = speed, loop = loops, flags = ANIMATION_PARALLEL)
	else
		animate(src, transform = matrices[1], time = speed, loop = loops)
	for(var/i in 2 to segments) //2 because 1 is covered above
		animate(transform = matrices[i], time = speed)
		//doesn't have an object argument because this is "Stacking" with the animate call above
		//3 billion% intentional

/**
 * Proc called when you want the atom to spin around the center of its icon (or where it would be if its transform var is translated)
 * By default, it makes the atom spin forever and ever at a speed of 60 rpm.
 *
 * Arguments:
 * * speed: how much it takes for the atom to complete one 360° rotation
 * * loops: how many times do we want the atom to rotate
 * * clockwise: whether the atom ought to spin clockwise or counter-clockwise
 * * segments: in how many animate calls the rotation is split. Probably unnecessary, but you shouldn't set it lower than 3 anyway.
 * * parallel: whether the animation calls have the ANIMATION_PARALLEL flag, necessary for it to run alongside concurrent animations.
 */
/atom/proc/SpinAnimation(speed = 1 SECONDS, loops = -1, clockwise = TRUE, segments = 3, parallel = TRUE)
	if(!segments)
		return
	var/segment = 360/segments
	if(!clockwise)
		segment = -segment
	do_spin_animation(speed, loops, segments, segment, parallel)

/// Makes this atom look like a "hologram"
/// So transparent, blue, with a scanline and an emissive glow
/// This is acomplished using a combination of filters and render steps/overlays
/// The degree of the opacity is optional, based off the opacity arg (0 -> 1)
/atom/proc/makeHologram(opacity = 0.5)
	// First, we'll make things blue (roughly) and sorta transparent
	add_filter("HOLO: Color and Transparent", 1, color_matrix_filter(rgb(125,180,225, opacity * 255)))
	// Now we're gonna do a scanline effect
	// Gonna take this atom and give it a render target, then use it as a source for a filter
	// (We use an atom because it seems as if setting render_target on an MA is just invalid. I hate this engine)
	var/atom/movable/scanline = new(null)
	scanline.icon = 'icons/effects/effects.dmi'
	scanline.icon_state = "scanline"
	scanline.appearance_flags |= RESET_TRANSFORM
	// * so it doesn't render
	var/static/uid_scan = 0
	scanline.render_target = "*HoloScanline [uid_scan]"
	uid_scan++
	// Now we add it as a filter, and overlay the appearance so the render source is always around
	add_filter("HOLO: Scanline", 2, alpha_mask_filter(render_source = scanline.render_target))
	add_overlay(scanline)
	qdel(scanline)
