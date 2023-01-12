/obj/item/gun/energy/laser
	name = "laser rifle"
	desc = "A Hephaestus Industries G40E rifle, designed to kill with concentrated energy blasts.  This variant has the ability to \
	switch between standard fire and a more efficent but weaker 'suppressive' fire."
	icon_state = "laser"
	item_state = "laser"
	wielded_item_state = "laser-wielded"
	fire_delay = 8
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEMSIZE_LARGE
	force = 10
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MAT_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser
	heavy = TRUE
	one_handed_penalty = 30

	firemodes = list(
		list(mode_name="normal", fire_delay=8, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 240),
		list(mode_name="suppressive", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 60),
		)

/obj/item/gun/energy/laser/mounted
	self_recharge = 1
	use_external_power = 1
	one_handed_penalty = 0 // Not sure if two-handing gets checked for mounted weapons, but better safe than sorry.

/obj/item/gun/energy/laser/mounted/augment
	use_external_power = FALSE
	use_organic_power = TRUE

/obj/item/gun/energy/laser/practice
	name = "practice laser carbine"
	desc = "A modified version of the HI G40E, this one fires less concentrated energy bolts designed for target practice."
	projectile_type = /obj/item/projectile/beam/practice
	charge_cost = 48

	cell_type = /obj/item/cell/device

	firemodes = list(
		list(mode_name="normal", projectile_type=/obj/item/projectile/beam/practice, charge_cost = 48),
		list(mode_name="suppressive", projectile_type=/obj/item/projectile/beam/practice, charge_cost = 12),
		)

/obj/item/gun/energy/retro
	name = "retro laser"
	icon_state = "retro"
	item_state = "retro"
	desc = "An older model of the basic lasergun. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	fire_delay = 10 //old technology

/obj/item/gun/energy/retro/mounted
	self_recharge = 1
	use_external_power = 1

/obj/item/gun/energy/retro/empty
	icon_state = "retro"
	cell_type = null

/obj/item/gun/energy/retro/apidean
	name = "apidean retro laser"
	icon_state = "apilaser"
	desc = "An older model of the basic lasergun. This version's casing has been painted yellow. Originating from, and carried by, Apidean combatants, it's unclear where they obtained them."

/datum/category_item/catalogue/anomalous/precursor_a/alien_pistol
	name = "Precursor Alpha Weapon - Appendageheld Laser"
	desc = "This object strongly resembles a weapon, and if one were to pull the \
	trigger located on the handle of the object, it would fire a deadly \
	laser at whatever it was pointed at. The beam fired appears to cause too \
	much damage to whatever it would hit to have served as a long ranged repair tool, \
	therefore this object was most likely designed to be a deadly weapon. If so, this \
	has several implications towards its creators;\
	<br><br>\
	Firstly, it implies that these precursors, at some point during their development, \
	had needed to defend themselves, or otherwise had a need to utilize violence, and \
	as such created better tools to do so. It is unclear if violence was employed against \
	themselves as a form of in-fighting, or if violence was exclusive to outside species.\
	<br><br>\
	Secondly, the shape and design of the weapon implies that the creators of this \
	weapon were able to grasp objects, and be able to manipulate the trigger independently \
	from merely holding onto the weapon, making certain types of appendages like tentacles be \
	unlikely.\
	<br><br>\
	An interesting note about this weapon, when compared to contemporary energy weapons, is \
	that this gun appears to be inferior to modern laser weapons. The beam fired has less \
	of an ability to harm, and the power consumption appears to be higher than average for \
	a human-made energy side-arm. One possible explaination is that the creators of this \
	weapon, in their later years, had less of a need to optimize their capability for war, \
	and instead focused on other endeavors. Another explaination is that vast age of the weapon \
	may have caused it to degrade, yet still remain functional at a reduced capability."
	value = CATALOGUER_REWARD_MEDIUM

/obj/item/gun/energy/alien
	name = "alien pistol"
	desc = "A weapon that works very similarly to a traditional energy weapon. How this came to be will likely be a mystery for the ages."
	catalogue_data = list(/datum/category_item/catalogue/anomalous/precursor_a/alien_pistol)
	icon_state = "alienpistol"
	item_state = "alienpistol"
	fire_delay = 10 // Handguns should be inferior to two-handed weapons. Even alien ones I suppose.
	charge_cost = 480 // Five shots.

	projectile_type = /obj/item/projectile/beam/cyan
	cell_type = /obj/item/cell/device/weapon/recharge/alien // Self charges.
	origin_tech = list(TECH_COMBAT = 8, TECH_MAGNET = 7)
	modifystate = "alienpistol"


/obj/item/gun/energy/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "A rare weapon, handcrafted by a now defunct specialty manufacturer on Luna for a small fortune. It's certainly aged well."
	force = 5
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	fire_delay = 10		//Old pistol
	charge_cost = 480	//to compensate a bit for self-recharging
	cell_type = /obj/item/cell/device/weapon/recharge/captain
	battery_lock = 1

/obj/item/gun/energy/lasercannon
	name = "laser cannon"
	desc = "With the laser cannon, the lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron \
	flux in a nuclear reactor core. This incredible technology may help YOU achieve high excitation rates with small laser volumes!"
	icon_state = "lasercannon"
	item_state = null
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	slot_flags = SLOT_BELT|SLOT_BACK
	projectile_type = /obj/item/projectile/beam/heavylaser/cannon
	battery_lock = 1
	fire_delay = 20
	w_class = ITEMSIZE_LARGE
	heavy = TRUE
	one_handed_penalty = 90 // The thing's heavy and huge.
	accuracy = 75
	charge_cost = 600

/obj/item/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = 1
	use_external_power = 1
	recharge_time = 10
	//accuracy = 0 // Mounted cannons are just fine the way they are.
	one_handed_penalty = 0 // Not sure if two-handing gets checked for mounted weapons, but better safe than sorry.
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 400
	fire_delay = 20

/obj/item/gun/energy/xray
	name = "xray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated xray blasts, which are able to penetrate matter easier than \
	standard photonic beams, resulting in an effective 'anti-armor' energy weapon."
	icon_state = "xray"
	heavy = TRUE
	item_state = "xray"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_MAGNET = 2)
	projectile_type = /obj/item/projectile/beam/xray
	charge_cost = 200

/obj/item/gun/energy/sniperrifle
	name = "marksman energy rifle"
	desc = "The HI DMR 9E is an older design of Hephaestus Industries. A designated marksman rifle capable of shooting powerful \
	ionized beams, this is a weapon to kill from a distance."
	icon_state = "sniper"
	item_state = "sniper"
	item_state_slots = list(SLOT_ID_RIGHT_HAND = "z8carbine", SLOT_ID_LEFT_HAND = "z8carbine") //placeholder
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	slot_flags = SLOT_BACK
	charge_cost = 600
	fire_delay = 35
	force = 10
	heavy = TRUE
	w_class = ITEMSIZE_HUGE // So it can't fit in a backpack.
	accuracy = 25 //shooting at the hip
	scoped_accuracy = 80
//	requires_two_hands = 1
	one_handed_penalty = 60 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.

/obj/item/gun/energy/sniperrifle/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1
	set src in usr

	toggle_scope(2.0)

/obj/item/gun/energy/sniperrifle/locked
	name = "expedition marksman energy rifle"
	desc = "A modified version of the HI DMR 9E with a replacement firing pin and reduced shot capacity in exchange for a self recharging cell."
	pin = /obj/item/firing_pin/explorer
	cell_type = /obj/item/cell/device/weapon/recharge/sniper
	accuracy = 45 //Modifications include slightly better hip-firing furniture.
	battery_lock = 1 //With the change that the normal DMR can now change the weapon cell, we need to add this here so people can't take out the self-recharging special cell.
	scoped_accuracy = 100
	charge_cost = 600

/obj/item/gun/energy/monorifle
	name = "antique mono-rifle"
	desc = "An old laser rifle. This one can only fire once before requiring recharging."
	description_fluff = "Modeled after ancient hunting rifles, this rifle was dubbed the 'Rainy Day Special' by some, due to its use as some barmens' fight-stopper of choice. One shot is all it takes, or so they say."
	icon_state = "eshotgun"
	item_state = "shotgun"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_POWER = 3)
	projectile_type = /obj/item/projectile/beam/sniper
	slot_flags = SLOT_BACK
	charge_cost = 1300
	fire_delay = 20
	force = 8
	heavy = TRUE
	w_class = ITEMSIZE_LARGE
	accuracy = 70
	scoped_accuracy = 95
	var/scope_multiplier = 1.5

/obj/item/gun/energy/monorifle/verb/sights()
	set category = "Object"
	set name = "Aim Down Sights"
	set popup_menu = 1
	set src in usr

	toggle_scope(scope_multiplier)

/obj/item/gun/energy/monorifle/combat
	name = "combat mono-rifle"
	desc = "A modernized version of the mono-rifle. This one can fire twice before requiring recharging."
	description_fluff = "A modern design produced by a company once working from Saint Columbia, based on the antique mono-rifle 'Rainy Day Special' design."
	icon_state = "ecshotgun"
	item_state = "cshotgun"
	charge_cost = 1000
	force = 12
	accuracy = 70
	scoped_accuracy = 95

////////Laser Tag////////////////////

/obj/item/gun/energy/lasertag
	name = "laser tag gun"
	item_state = "laser"
	desc = "Standard issue weapon of the Imperial Guard"
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	matter = list(MAT_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/lasertag/blue
	cell_type = /obj/item/cell/device/weapon/recharge
	battery_lock = 1

/obj/item/gun/energy/lasertag/blue
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_type = /obj/item/projectile/beam/lasertag/blue
	pin = /obj/item/firing_pin/tag/blue

/obj/item/gun/energy/lasertag/red
	icon_state = "redtag"
	item_state = "redtag"
	projectile_type = /obj/item/projectile/beam/lasertag/red
	pin = /obj/item/firing_pin/tag/red

/obj/item/gun/energy/lasertag/omni
	projectile_type = /obj/item/projectile/beam/lasertag/omni

// Laser scattergun, proof of concept.

/obj/item/gun/energy/lasershotgun
	name = "laser scattergun"
	item_state = "laser"
	icon_state = "scatter"
	desc = "A strange Almachi weapon, utilizing a refracting prism to turn a single laser blast into a diverging cluster."
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 1, TECH_MATERIAL = 4)
	heavy = TRUE
	projectile_type = /obj/item/projectile/scatter/laser

// Other laser guns.

/obj/item/gun/energy/tommylaser
	name = "M-2421 'Tommy-Laser'"
	desc = "A automatic laser weapon resembling a Tommy-Gun. Designed by Cybersun Industries to be a man portable supressive fire laser weapon."
	icon_state = "tommylas"
	item_state = "tommylas"
	w_class = ITEMSIZE_LARGE
	heavy = TRUE
	slot_flags = SLOT_BACK
	charge_cost = 60 // 40 shots, lay down the firepower
	projectile_type = /obj/item/projectile/beam/weaklaser
	cell_type = /obj/item/cell/device/weapon
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 5, TECH_ILLEGAL = 3)

	firemodes = list(
		list(mode_name="single shot", burst = 1, fire_delay=4, move_delay=null, burst_accuracy = null, dispersion = null),
		list(mode_name="three shot bursts", burst=3, fire_delay=10 , move_delay=4,    burst_accuracy=list(65,65,65), dispersion=list(1,1,1)),
		list(mode_name="short bursts",	burst=5, fire_delay=10 ,move_delay=6, burst_accuracy = list(65,65,65,65,65), dispersion = list(4,4,4,4,4)),
		)

/obj/item/gun/energy/zip
	name = "Zip-Las"
	desc = "A homemade (and somehow safe) laser gun designed around shooting single powerful laser beam draining the cell entirely. Better not miss and better have spare cells."
	icon_state = "ziplas"
	item_state = "ziplas"
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_BACK
	charge_cost = 1500 //You got 1 shot...
	projectile_type = /obj/item/projectile/beam/heavylaser //But it hurts a lot
	cell_type = /obj/item/cell/device/weapon

//NT SpecOps Laser Rifle
/obj/item/gun/energy/combat
	name = "NT-LR-4 laser rifle"
	desc = "A sturdy laser rifle fine tuned for NanoTrasen special operations. More reliable than mass production models, this weapon was designed to kill, and nothing else."
	icon_state = "clrifle"
	item_state = "clrifle"
	fire_delay = 6
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEMSIZE_LARGE
	force = 10
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 2)
	matter = list(MAT_STEEL = 2000, "plastic" = 1000)
	projectile_type = /obj/item/projectile/beam/midlaser
	heavy = FALSE
	one_handed_penalty = 25

	firemodes = list(
		list(mode_name="normal", fire_delay=6, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 200),
		list(mode_name="suppressive", fire_delay=3, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 50),
		)
