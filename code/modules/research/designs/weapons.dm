/datum/prototype/design/science/weapon
	category = DESIGN_CATEGORY_MUNITIONS
	abstract_type = /datum/prototype/design/science/weapon

/datum/prototype/design/science/weapon/generate_name(template)
	return "Weapon prototype ([..()])"

/datum/prototype/design/science/weapon/ammo
	category = DESIGN_SUBCATEGORY_AMMO
	abstract_type = /datum/prototype/design/science/weapon/ammo

/datum/prototype/design/science/weapon/ammo/generate_name(template)
	return "Weapon ammo ([..()])"

/datum/prototype/design/science/weapon/energy
	subcategory = DESIGN_SUBCATEGORY_ENERGY
	abstract_type = /datum/prototype/design/science/weapon/energy

/datum/prototype/design/science/weapon/energy/generate_name(template)
	return "Energy weapon prototype ([..()])"

/datum/prototype/design/science/weapon/energy/stunrevolver
	id = "stunrevolver"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 2)
	materials_base = list(MAT_STEEL = 4000)
	build_path = /obj/item/gun/projectile/energy/stunrevolver

/datum/prototype/design/science/weapon/energy/nuclear_gun
	id = "nuclear_gun"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 5, TECH_POWER = 3)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 1000, MAT_URANIUM = 500)
	build_path = /obj/item/gun/projectile/energy/gun/nuclear

/datum/prototype/design/science/weapon/energy/phoronpistol
	id = "ppistol"
	req_tech = list(TECH_COMBAT = 5, TECH_PHORON = 4)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 1000, MAT_PHORON = 3000)
	build_path = /obj/item/gun/projectile/energy/toxgun

/datum/prototype/design/science/weapon/energy/lasercannon
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	id = "lasercannon"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	materials_base = list(MAT_STEEL = 10000, MAT_GLASS = 1000, MAT_DIAMOND = 2000)
	build_path = /obj/item/gun/projectile/energy/lasercannon

/datum/prototype/design/science/weapon/energy/decloner
	id = "decloner"
	req_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 7, TECH_BIO = 5, TECH_POWER = 6)
	materials_base = list(MAT_GOLD = 5000,MAT_URANIUM = 10000)
	build_path = /obj/item/gun/projectile/energy/decloner

/datum/prototype/design/science/weapon/energy/temp_gun
	desc = "A gun that shoots high-powered glass-encased energy temperature bullets."
	id = "temp_gun"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 4, TECH_POWER = 3, TECH_MAGNET = 2)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 500, MAT_SILVER = 3000)
	build_path = /obj/item/gun/projectile/energy/temperature

/datum/prototype/design/science/weapon/energy/flora_gun
	id = "flora_gun"
	req_tech = list(TECH_MATERIAL = 2, TECH_BIO = 3, TECH_POWER = 3)
	materials_base = list(MAT_STEEL = 2000, MAT_GLASS = 500, MAT_URANIUM = 500)
	build_path = /obj/item/gun/projectile/energy/floragun

/datum/prototype/design/science/weapon/ballistic
	subcategory = DESIGN_SUBCATEGORY_BALLISTIC
	abstract_type = /datum/prototype/design/science/weapon/ballistic

/datum/prototype/design/science/weapon/ballistic/generate_name(template)
	return "Ballistic weapon prototype ([..()])"

/datum/prototype/design/science/weapon/ballistic/advanced_smg
	id = "smg"
	desc = "An advanced 9mm SMG with a reflective laser optic."
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	materials_base = list(MAT_STEEL = 8000, MAT_SILVER = 2000, MAT_DIAMOND = 1000)
	build_path = /obj/item/gun/projectile/ballistic/automatic/advanced_smg

/datum/prototype/design/science/weapon/ballistic/p90
	id = "p90"
	desc = "The H90K is a compact, large capacity submachine gun produced by Hephaestus Industries. Despite its fierce reputation, it still manages to feel like a toy. Uses 9mm rounds."
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	materials_base = list(MAT_STEEL = 5000, MAT_PLASTIC = 5000, MAT_URANIUM = 1000)
	build_path = /obj/item/gun/projectile/ballistic/automatic/p90

/datum/prototype/design/science/weapon/ballistic/ammo
	abstract_type = /datum/prototype/design/science/weapon/ballistic/ammo

/datum/prototype/design/science/weapon/ballistic/ammo/generate_name(template)
	return "Ballistic weapon ammo ([..()])"

/datum/prototype/design/science/weapon/ballistic/ammo/ammo_9mmAdvanced
	design_name = "9mm magazine"
	id = "ammo_9mm"
	desc = "A 21 round magazine for an advanced 9mm SMG."
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	materials_base = list(MAT_STEEL = 3750, MAT_SILVER = 100) // Requires silver for proprietary magazines! Or something.
	build_path = /obj/item/ammo_magazine/a9mm/advanced_smg

/datum/prototype/design/science/weapon/ballistic/ammo/techshell
	design_name = "unloaded tech shell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshell"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	materials_base = list(MAT_STEEL = 500, MAT_PHORON = 200)
	build_path = /obj/item/ammo_casing/a12g/techshell

/datum/prototype/design/science/weapon/ballistic/ammo/stunshell
	design_name = "stun shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	materials_base = list(MAT_STEEL = 360, MAT_GLASS = 720)
	build_path = /obj/item/ammo_casing/a12g/stunshell

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mmp90
	design_name = "H90K magazine"
	desc = "A large capacity top mounted magazine (5.7x28mm armor-piercing)."
	id = "m57x28mmp90"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	materials_base = list(MAT_STEEL = 2250, MAT_PLASTIC = 1500, MAT_COPPER = 1000)
	build_path = /obj/item/ammo_magazine/a5_7mm/p90

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm
	abstract_type = /datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles
	design_name = "5.7 top-mounted magazine"
	desc = "A standard capacity sidearm magazine (5.7x28mm)."
	id = "ntles"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	materials_base = list(MAT_STEEL = 1500, MAT_COPPER = 750)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/ap
	design_name = "5.7 top-mounted magazine (AP)"
	desc = "A standard capacity sidearm magazine (5.7x28mm armor-piercing)."
	id = "ntlesap"
	materials_base = list(MAT_STEEL = 1500, MAT_COPPER = 1000)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/ap

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/hp
	design_name = "5.7 top-mounted magazine (HP)"
	desc = "A standard capacity sidearm magazine (5.7x28mm hollow point)."
	id = "ntleshp"
	materials_base = list(MAT_STEEL = 1500, MAT_COPPER = 750)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/hp

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/hunter
	design_name = "5.7 top-mounted magazine (Hunter)"
	desc = "A standard capacity sidearm magazine (5.7x28mm hunter)."
	id = "ntleshunter"
	materials_base = list(MAT_STEEL = 1500, MAT_COPPER = 500)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/hunter

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/highcap
	design_name = "5.7 highcap top-mounted magazine"
	desc = "A high capacity sidearm magazine (5.7x28mm)."
	id = "ntleshc"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	materials_base = list(MAT_STEEL = 2500, MAT_COPPER = 2000)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/highcap

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/highcap/ap
	design_name = "5.7 highcap top-mounted magazine (AP)"
	desc = "A high capacity sidearm magazine (5.7x28mm armor-piercing)."
	id = "ntleshcap"
	materials_base = list(MAT_STEEL = 2500, MAT_COPPER = 2500)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/highcap/ap

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/highcap/hp
	design_name = "5.7 highcap top-mounted magazine (HP)"
	desc = "A high capacity sidearm magazine (5.7x28mm hollow point)."
	id = "ntleshchp"
	materials_base = list(MAT_STEEL = 2500, MAT_COPPER = 2000)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/highcap/hp

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/ntles/highcap/hunter
	design_name = "5.7 highcap top-mounted magazine (Hunter)"
	desc = "A high capacity sidearm magazine (5.7x28mm hunter)."
	id = "ntleshchunter"
	materials_base = list(MAT_STEEL = 2500, MAT_COPPER = 1750)
	build_path = /obj/item/ammo_magazine/a5_7mm/nt_les/highcap/hunter

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven
	design_name = "5.7 sidearm magazine"
	desc = "A standard capacity sidearm magazine (5.7x28mm)."
	id = "fiveseven"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	materials_base = list(MAT_STEEL = 1250, MAT_COPPER = 750)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/ap
	design_name = "5.7 sidearm magazine (AP)"
	desc = "A standard capacity sidearm magazine (5.7x28mm armor-piercing)."
	id = "fivesevenap"
	materials_base = list(MAT_STEEL = 1250, MAT_COPPER = 1000)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/ap

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/hp
	design_name = "5.7 sidearm magazine (HP)"
	desc = "A standard capacity sidearm magazine (5.7x28mm hollow point)."
	id = "fivesevenhp"
	materials_base = list(MAT_STEEL = 1250, MAT_COPPER = 750)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/hp

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/hunter
	design_name = "5.7 sidearm magazine (Hunter)"
	desc = "A standard capacity sidearm magazine (5.7x28mm hunter)."
	id = "fivesevenhunter"
	materials_base = list(MAT_STEEL = 1250, MAT_COPPER = 250)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/hunter

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/highcap
	design_name = "5.7 sidearm high-cap magazine"
	desc = "A high capacity sidearm magazine (5.7x28mm)."
	id = "fivesevenhc"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	materials_base = list(MAT_STEEL = 2000, MAT_COPPER = 750)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/highcap

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/highcap/ap
	design_name = "5.7 sidearm high-cap magazine (AP)"
	desc = "A high capacity sidearm magazine (5.7x28mm armor-piercing)."
	id = "fivesevenhcap"
	materials_base = list(MAT_STEEL = 2500, MAT_COPPER = 1000)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/highcap/ap

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/highcap/hp
	design_name = "5.7 sidearm high-cap magazine (HP)"
	desc = "A high capacity sidearm magazine (5.7x28mm hollow point)."
	id = "fivesevenhchp"
	materials_base = list(MAT_STEEL = 2000, MAT_COPPER = 750)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/highcap/hp

/datum/prototype/design/science/weapon/ballistic/ammo/m57x28mm/fiveseven/highcap/hunter
	design_name = "5.7 sidearm high-cap magazine (Hunter)"
	desc = "A high capacity sidearm magazine (5.7x28mm hunter)."
	id = "fivesevenhchunter"
	materials_base = list(MAT_STEEL = 2000, MAT_COPPER = 500)
	build_path = /obj/item/ammo_magazine/a5_7mm/five_seven/highcap/hunter

/datum/prototype/design/science/weapon/phase
	abstract_type = /datum/prototype/design/science/weapon/phase

/datum/prototype/design/science/weapon/phase/generate_name(template)
	return "Phase weapon prototype ([..()])"

/datum/prototype/design/science/weapon/phase/phase_pistol
	id = "phasepistol"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials_base = list(MAT_STEEL = 4000)
	build_path = /obj/item/gun/projectile/energy/phasegun/pistol

/datum/prototype/design/science/weapon/phase/phase_carbine
	id = "phasecarbine"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_POWER = 2)
	materials_base = list(MAT_STEEL = 6000, MAT_GLASS = 1500)
	build_path = /obj/item/gun/projectile/energy/phasegun

/datum/prototype/design/science/weapon/phase/phase_rifle
	id = "phaserifle"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	materials_base = list(MAT_STEEL = 7000, MAT_GLASS = 2000, MAT_SILVER = 500)
	build_path = /obj/item/gun/projectile/energy/phasegun/rifle

/datum/prototype/design/science/weapon/phase/phase_cannon
	id = "phasecannon"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4, TECH_POWER = 4)
	materials_base = list(MAT_STEEL = 10000, MAT_GLASS = 2000, MAT_SILVER = 1000, MAT_DIAMOND = 750)
	build_path = /obj/item/gun/projectile/energy/phasegun/cannon

// Other weapons

/datum/prototype/design/science/weapon/rapidsyringe
	id = "rapidsyringe"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_ENGINEERING = 3, TECH_BIO = 2)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 1000)
	build_path = /obj/item/gun/launcher/syringe/rapid

/datum/prototype/design/science/weapon/dartgun
	desc = "A gun that fires small hollow chemical-payload darts."
	id = "dartgun_r"
	req_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_BIO = 4, TECH_MAGNET = 3, TECH_ILLEGAL = 1)
	materials_base = list(MAT_STEEL = 5000, MAT_GOLD = 5000, MAT_SILVER = 2500, MAT_GLASS = 750)
	build_path = /obj/item/gun/projectile/ballistic/dartgun/research

/datum/prototype/design/science/weapon/chemsprayer
	desc = "An advanced chem spraying device."
	id = "chemsprayer"
	req_tech = list(TECH_MATERIAL = 3, TECH_ENGINEERING = 3, TECH_BIO = 2)
	build_path = /obj/item/reagent_containers/spray/chemsprayer

/datum/prototype/design/science/weapon/fuelrod
	id = "fuelrod_gun"
	req_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_PHORON = 4, TECH_ILLEGAL = 5, TECH_MAGNET = 5)
	materials_base = list(MAT_STEEL = 10000, MAT_GLASS = 2000, MAT_GOLD = 500, MAT_SILVER = 500, MAT_URANIUM = 1000, MAT_PHORON = 3000, MAT_DIAMOND = 1000)
	build_path = /obj/item/gun/magnetic/fuelrod

// Ammo for those

/datum/prototype/design/science/weapon/ammo/dartgunmag_small
	id = "dartgun_mag_s"
	req_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2, TECH_BIO = 2, TECH_MAGNET = 1, TECH_ILLEGAL = 1)
	materials_base = list(MAT_STEEL = 300, MAT_GOLD = 100, MAT_SILVER = 100, MAT_GLASS = 300)
	build_path = /obj/item/ammo_magazine/chemdart/small

/datum/prototype/design/science/weapon/ammo/dartgun_ammo_small
	id = "dartgun_ammo_s"
	req_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2, TECH_BIO = 2, TECH_MAGNET = 1, TECH_ILLEGAL = 1)
	materials_base = list(MAT_STEEL = 50, MAT_GOLD = 30, MAT_SILVER = 30, MAT_GLASS = 50)
	build_path = /obj/item/ammo_casing/dart/chemdart/small

/datum/prototype/design/science/weapon/ammo/dartgunmag_med
	id = "dartgun_mag_m"
	req_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 2, TECH_BIO = 2, TECH_MAGNET = 1, TECH_ILLEGAL = 1)
	materials_base = list(MAT_STEEL = 500, MAT_GOLD = 150, MAT_SILVER = 150, MAT_DIAMOND = 200, MAT_GLASS = 400)
	build_path = /obj/item/ammo_magazine/chemdart

/datum/prototype/design/science/weapon/ammo/dartgun_ammo_med
	id = "dartgun_ammo_m"
	req_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 2, TECH_BIO = 2, TECH_MAGNET = 1, TECH_ILLEGAL = 1)
	materials_base = list(MAT_STEEL = 80, MAT_GOLD = 40, MAT_SILVER = 40, MAT_GLASS = 60)
	build_path = /obj/item/ammo_casing/dart/chemdart

/datum/prototype/design/science/weapon/melee
	subcategory = DESIGN_SUBCATEGORY_MELEE
	abstract_type = /datum/prototype/design/science/weapon/melee

/datum/prototype/design/science/weapon/melee/generate_name(template)
	return "Melee weapon prototype ([..()])"

/datum/prototype/design/science/weapon/melee/esword
	design_name = "Portable Energy Blade"
	id = "chargesword"
	req_tech = list(TECH_COMBAT = 6, TECH_MAGNET = 4, TECH_ENGINEERING = 5, TECH_ILLEGAL = 4, TECH_ARCANE = 1)
	materials_base = list(MAT_PLASTEEL = 3500, MAT_GLASS = 1000, MAT_LEAD = 2250, MAT_METALHYDROGEN = 500)
	build_path = /obj/item/melee/transforming/energy/sword/charge

/datum/prototype/design/science/weapon/melee/eaxe
	design_name = "Energy Axe"
	id = "chargeaxe"
	req_tech = list(TECH_COMBAT = 6, TECH_MAGNET = 5, TECH_ENGINEERING = 4, TECH_ILLEGAL = 4)
	materials_base = list(MAT_PLASTEEL = 3500, MAT_OSMIUM = 2000, MAT_LEAD = 2000, MAT_METALHYDROGEN = 500)
	build_path = /obj/item/melee/transforming/energy/axe/charge

/datum/prototype/design/science/weapon/grenade
	abstract_type = /datum/prototype/design/science/weapon/grenade

/datum/prototype/design/science/weapon/grenade/generate_name(template)
	return "Grenade casing prototype ([..()])"

/datum/prototype/design/science/weapon/grenade/large_grenade
	id = "large_Grenade"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	materials_base = list(MAT_STEEL = 3000)
	build_path = /obj/item/grenade/chem_grenade/large

/datum/prototype/design/science/weapon/energy/netgun
	design_name = "\'Retiarius\' capture gun"
	id = "netgun"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 5, TECH_MAGNET = 3)
	materials_base = list(MAT_STEEL = 6000, MAT_GLASS = 3000)
	build_path = /obj/item/gun/projectile/energy/netgun

/datum/prototype/design/science/weapon/energy/sickshot
	desc = "The 'Discombobulator' is a 4-shot energy revolver that causes nausea and confusion."
	id = "sickshot"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_MAGNET = 2)
	materials_base = list(MAT_STEEL = 3000, MAT_GLASS = 2000)
	build_path = /obj/item/gun/projectile/energy/sickshot

/datum/prototype/design/science/weapon/pummeler
	desc = "With the 'Pummeler', punt anyone you don't like out of the room!"
	id = "pummeler"
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_MAGNET = 5)
	materials_base = list(MAT_STEEL = 3000, MAT_GLASS = 3000, MAT_URANIUM = 1000)
	build_path = /obj/item/gun/projectile/energy/pummeler

/datum/prototype/design/science/weapon/particle
	abstract_type = /datum/prototype/design/science/weapon/particle

/datum/prototype/design/science/weapon/particle/generate_name(template)
	return "Anti-particle weapon prototype ([..()])"

/datum/prototype/design/science/weapon/particle/advparticle
	design_name = "Advanced anti-particle rifle"
	id = "advparticle"
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 5, TECH_POWER = 3, TECH_MAGNET = 3)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 1000, MAT_GOLD = 1000, MAT_URANIUM = 750)
	build_path = /obj/item/gun/projectile/energy/particle/advanced

/datum/prototype/design/science/weapon/particle/particlecannon
	design_name = "Anti-particle cannon"
	id = "particlecannon"
	req_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5, TECH_POWER = 4, TECH_MAGNET = 4)
	materials_base = list(MAT_STEEL = 10000, MAT_GLASS = 1500, MAT_GOLD = 2000, MAT_URANIUM = 1000, MAT_DIAMOND = 2000)
	build_path = /obj/item/gun/projectile/energy/particle/cannon

/datum/prototype/design/science/weapon/particle/pressureinterlock
	design_name = "APP pressure interlock"
	id = "pressureinterlock"
	req_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ENGINEERING = 2)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 250)
	build_path = /obj/item/pressurelock

/datum/prototype/design/science/weapon/cell_based
	abstract_type = /datum/prototype/design/science/weapon/cell_based

/datum/prototype/design/science/weapon/cell_based/generate_name(template)
	return "Cell-based weapon prototype ([..()])"

/datum/prototype/design/science/weapon/cell_based/prototype_nsfw
	design_name = "cell-loaded revolver"
	id = "nsfw_prototype"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 4, TECH_POWER = 4, TECH_COMBAT = 7)
	materials_base = list(MAT_STEEL = 10000, MAT_GLASS = 6000, MAT_PHORON = 8000, MAT_URANIUM = 4000)
	build_path = /obj/item/gun/projectile/ballistic/microbattery/combat/prototype

/datum/prototype/design/science/weapon/cell_based/prototype_nsfw_mag
	design_name = "combat cell magazine"
	id = "nsfw_mag_prototype"
	subcategory = DESIGN_SUBCATEGORY_AMMO
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 4, TECH_POWER = 4, TECH_COMBAT = 7)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 4000, MAT_PHORON = 4000)
	build_path = /obj/item/ammo_magazine/microbattery/combat/prototype

/datum/prototype/design/science/nsfw_cell
	category = DESIGN_CATEGORY_MUNITIONS
	subcategory = DESIGN_SUBCATEGORY_AMMO
	abstract_type = /datum/prototype/design/science/nsfw_cell

/datum/prototype/design/science/nsfw_cell/generate_name(template)
	category = DESIGN_CATEGORY_MUNITIONS
	subcategory = DESIGN_SUBCATEGORY_AMMO
	return "Microbattery prototype ([..()])"

/datum/prototype/design/science/nsfw_cell/stun
	design_name = "STUN"
	id = "nsfw_cell_stun"
	req_tech = list(TECH_MATERIAL = 4, TECH_MAGNET = 2, TECH_POWER = 3, TECH_COMBAT = 3)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000)
	build_path = /obj/item/ammo_casing/microbattery/combat/stun

/datum/prototype/design/science/nsfw_cell/lethal
	design_name = "LETHAL"
	id = "nsfw_cell_lethal"
	req_tech = list(TECH_MATERIAL = 4, TECH_MAGNET = 3, TECH_POWER = 3, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_PHORON = 3000)
	build_path = /obj/item/ammo_casing/microbattery/combat/lethal

/datum/prototype/design/science/nsfw_cell/net
	design_name = "NET"
	id = "nsfw_cell_net"
	req_tech = list(TECH_MATERIAL = 4, TECH_MAGNET = 3, TECH_POWER = 3, TECH_COMBAT = 4)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_URANIUM = 3000)
	build_path = /obj/item/ammo_casing/microbattery/combat/net

/datum/prototype/design/science/nsfw_cell/ion
	design_name = "ION"
	id = "nsfw_cell_ion"
	req_tech = list(TECH_MATERIAL = 5, TECH_MAGNET = 3, TECH_POWER = 5, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_SILVER = 3000)
	build_path = /obj/item/ammo_casing/microbattery/combat/ion

/datum/prototype/design/science/nsfw_cell/shotstun
	design_name = "SCATTERSTUN"
	id = "nsfw_cell_shotstun"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 3, TECH_POWER = 6, TECH_COMBAT = 6)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_SILVER = 2000, MAT_GOLD = 2000)
	build_path = /obj/item/ammo_casing/microbattery/combat/shotstun

/datum/prototype/design/science/nsfw_cell/xray
	design_name = "XRAY"
	id = "nsfw_cell_xray"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 4, TECH_POWER = 5, TECH_COMBAT = 7)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_SILVER = 1000, MAT_GOLD = 1000, MAT_URANIUM = 1000, MAT_PHORON = 1000)
	build_path = /obj/item/ammo_casing/microbattery/combat/xray

/datum/prototype/design/science/nsfw_cell/stripper
	design_name = "STRIPPER"
	id = "nsfw_cell_stripper"
	req_tech = list(TECH_MATERIAL = 7, TECH_BIO = 4, TECH_POWER = 4, TECH_COMBAT = 4, TECH_ILLEGAL = 5)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_URANIUM = 2000, MAT_PHORON = 2000, MAT_DIAMOND = 500)
	build_path = /obj/item/ammo_casing/microbattery/combat/stripper

/datum/prototype/design/science/modweapon
	category = DESIGN_CATEGORY_MUNITIONS
	abstract_type = /datum/prototype/design/science/modweapon

/datum/prototype/design/science/modweapon/generate_name(template)
	return "Modular weapon prototype ([..()])"

/datum/prototype/design/science/modweapon/basic
	design_name = "modular energy pistol"
	id = "modpistol"
	req_tech = list(TECH_MATERIAL = 4, TECH_MAGNET = 3, TECH_POWER = 3, TECH_COMBAT = 3)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_SILVER = 3000)
	build_path = /obj/item/gun/projectile/energy/modular/basic

/*

/datum/prototype/design/science/modweapon/adv
	design_name = "advanced modular energy pistol"
	id = "advmodpistol"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 6000, MAT_GLASS = 6000, MAT_SILVER = 3000, MAT_GOLD = 2000, MAT_URANIUM = 3000)
	build_path = /obj/item/gun/projectile/energy/modular/advanced

*/

/datum/prototype/design/science/modweapon/carbine
	design_name = "modular energy carbine"
	id = "modcarbine"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_URANIUM = 2000, MAT_GOLD = 4000, MAT_DIAMOND = 500)
	build_path = /obj/item/gun/projectile/energy/modular/carbine

/datum/prototype/design/science/modweapon/rifle
	design_name = "modular energy rifle"
	id = "modrifle"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 12000, MAT_GLASS = 12000, MAT_SILVER = 6000, MAT_GOLD = 6000, MAT_URANIUM = 4000, MAT_DIAMOND = 500)
	build_path = /obj/item/gun/projectile/energy/modular/rifle

/datum/prototype/design/science/modweapon/tririfle
	design_name = "tri-core modular energy rifle"
	id = "threemodrifle"
	req_tech = list(TECH_MATERIAL = 7, TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 12000, MAT_GLASS = 12000, MAT_SILVER = 6000, MAT_GOLD = 6000, MAT_URANIUM = 4000, MAT_DIAMOND = 1500)
	build_path = /obj/item/gun/projectile/energy/modular/rifle/tribeam

/*

/datum/prototype/design/science/modweapon/compact
	design_name = "compact modular energy pistol"
	id = "modcompact"
	req_tech = list(TECH_MATERIAL = 7, TECH_MAGNET = 6, TECH_POWER = 6, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 5000, MAT_GLASS = 5000, MAT_DIAMOND = 3000)
	build_path = /obj/item/gun/projectile/energy/modular/compact

/datum/prototype/design/science/modweapon/scatter
	design_name = "modular energy scattergun"
	id = "modscatter"
	req_tech = list(TECH_MATERIAL = 7, TECH_MAGNET = 6, TECH_POWER = 6, TECH_COMBAT = 5, TECH_ILLEGAL = 4)
	materials_base = list(MAT_STEEL = 12000, MAT_GLASS = 12000, MAT_SILVER = 6000, MAT_GOLD = 6000, MAT_URANIUM = 4000, MAT_DIAMOND = 2000)
	build_path = /obj/item/gun/projectile/energy/modular/rifle/scatter

/datum/prototype/design/science/modweapon/cannon
	design_name = "modular energy cannon"
	id = "modcannon"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 6, TECH_POWER = 6, TECH_COMBAT = 6, TECH_ENGINEERING = 6)
	materials_base = list(MAT_STEEL = 12000, MAT_GLASS = 12000, MAT_SILVER = 6000, MAT_GOLD = 6000, MAT_URANIUM = 4000, MAT_DIAMOND = 4000)
	build_path = /obj/item/gun/projectile/energy/modular/cannon

*/

/datum/prototype/design/science/modweapon/nuclear
	design_name = "modular AEG"
	id = "modAEG"
	req_tech = list(TECH_MATERIAL = 6, TECH_MAGNET = 6, TECH_POWER = 6, TECH_COMBAT = 6, TECH_ENGINEERING = 6, TECH_BLUESPACE = 4)
	materials_base = list(MAT_STEEL = 12000, MAT_GLASS = 12000, MAT_SILVER = 6000, MAT_LEAD = 20000, MAT_URANIUM = 20000, MAT_DIAMOND = 4000)
	build_path = /obj/item/gun/projectile/energy/modular/nuke

/datum/prototype/design/science/modweaponnodule
	category = DESIGN_CATEGORY_MUNITIONS
	subcategory = DESIGN_SUBCATEGORY_PARTS
	abstract_type = /datum/prototype/design/science/modweaponnodule

/datum/prototype/design/science/modweaponnodule/generate_name(template)
	return "Modular weapon module design ([..()])"

/datum/prototype/design/science/modweaponnodule/stunmedium
	design_name = "stun medium"
	id = "stunmedium"
	req_tech = list(TECH_MAGNET = 3, TECH_POWER = 3, TECH_COMBAT = 2)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_GOLD = 4000)
	build_path = /obj/item/modularlaser/lasermedium/stun

/datum/prototype/design/science/modweaponnodule/stunweak
	design_name = "weak stun medium"
	id = "stunweak"
	req_tech = list(TECH_MAGNET = 1, TECH_POWER = 2, TECH_COMBAT = 1)
	materials_base =	list(MAT_STEEL = 8000, MAT_GLASS = 8000)
	build_path = /obj/item/modularlaser/lasermedium/stun/weak

/*

/datum/prototype/design/science/modweaponnodule/netmedium
	design_name = "net projector medium"
	id = "netmedium"
	req_tech =  list(TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_GOLD = 4000, MAT_URANIUM = 2000)
	build_path = /obj/item/modularlaser/lasermedium/net

*/

/datum/prototype/design/science/modweaponnodule/electrode
	design_name = "electrode projector tube"
	id =	"electrodetube"
	req_tech =  list(TECH_MAGNET = 2, TECH_POWER = 3, TECH_COMBAT = 2)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000)
	build_path = /obj/item/modularlaser/lasermedium/electrode

/datum/prototype/design/science/modweaponnodule/laser
	design_name = "laser medium"
	id = "lasermedium"
	req_tech =  list(TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 2)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_URANIUM = 2000, MAT_SILVER = 4000)
	build_path = /obj/item/modularlaser/lasermedium/laser

/datum/prototype/design/science/modweaponnodule/weaklaser
	design_name = "low-power laser medium"
	id = "weaklaser"
	req_tech =  list(TECH_MAGNET = 3, TECH_POWER = 3, TECH_COMBAT = 2)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000)
	build_path = /obj/item/modularlaser/lasermedium/laser/weak

/*

/datum/prototype/design/science/modweaponnodule/sniper
	design_name = "laser sniper medium"
	id = "sniperlaser"
	req_tech =  list(TECH_MAGNET = 5, TECH_POWER = 6, TECH_COMBAT = 4)
	materials_base =	list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_URANIUM = 2000, MAT_DIAMOND = 10)
	build_path = /obj/item/modularlaser/lasermedium/laser/sniper

/datum/prototype/design/science/modweaponnodule/heavylaser
	design_name = "heavy laser medium"
	id = "heavylasermedium"
	req_tech =  list(TECH_MAGNET = 6, TECH_POWER = 6, TECH_COMBAT = 5, TECH_ILLEGAL = 2)
	materials_base =	list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_URANIUM = 2000, MAT_GOLD = 4000, MAT_DIAMOND = 500)
	build_path = /obj/item/modularlaser/lasermedium/laser/heavy

/datum/prototype/design/science/modweaponnodule/cannonmedium
	design_name = "cannon beam medium"
	id = "cannonmedium"
	req_tech = list(TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5, TECH_ILLEGAL = 5)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_URANIUM = 2000, MAT_GOLD = 4000, MAT_DIAMOND = 500)
	build_path = /obj/item/modularlaser/lasermedium/laser/cannon

*/

/datum/prototype/design/science/modweaponnodule/xraser
	design_name = "xraser medium"
	id = "xraser"
	req_tech = list(TECH_MAGNET = 5, TECH_POWER = 5, TECH_COMBAT = 5, TECH_ILLEGAL = 5)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_URANIUM = 4000, MAT_GOLD = 4000, MAT_DIAMOND = 500)
	build_path = /obj/item/modularlaser/lasermedium/laser/xray

/datum/prototype/design/science/modweaponnodule/dig
	design_name = "excavation beam medium"
	id = "digbeam"
	req_tech = list(TECH_MAGNET = 3, TECH_POWER = 2)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_PLASTEEL = 500)
	build_path = /obj/item/modularlaser/lasermedium/dig

/datum/prototype/design/science/modweaponnodule/lightning
	design_name = "lightning arc tube"
	id = "lightning"
	req_tech = list(TECH_MAGNET = 6, TECH_POWER = 7)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_SILVER = 4000, MAT_GOLD = 4000)
	build_path = /obj/item/modularlaser/lasermedium/lightning

/datum/prototype/design/science/modweaponnodule/hook
	design_name = "graviton grapple tube"
	id = "hook"
	req_tech = list(TECH_ARCANE = 4, TECH_POWER = 2)
	materials_base =list(MAT_STEEL = 8000, MAT_GLASS = 8000, MAT_MORPHIUM = 4000, MAT_VERDANTIUM = 4000)
	build_path = /obj/item/modularlaser/lasermedium/hook

/datum/prototype/design/science/modweaponnodule/phasemedium
	design_name = "phase projector tube"
	id = "phasemedium"
	req_tech = list(TECH_MAGNET = 3, TECH_POWER = 2)
	materials_base = list(MAT_STEEL = 8000, MAT_GLASS = 8000)
	build_path = /obj/item/modularlaser/lasermedium/phase

/datum/prototype/design/science/modweaponnodule/basiclens
	design_name = "basic lens"
	id = "basiclens"
	req_tech = list(TECH_MATERIAL = 3)
	materials_base = list(MAT_GLASS = 8000)
	build_path = /obj/item/modularlaser/lens/basic

/datum/prototype/design/science/modweaponnodule/advlens
	design_name = "advanced lens"
	id = "advlens"
	req_tech = list(TECH_MATERIAL = 6)
	materials_base = list(MAT_GLASS = 8000, MAT_SILVER = 3000)
	build_path = /obj/item/modularlaser/lens/advanced

/datum/prototype/design/science/modweaponnodule/superlens
	design_name = "superior lens"
	id = "superlens"
	req_tech =  list(TECH_MATERIAL = 9)
	materials_base = list(MAT_GLASS = 8000, MAT_SILVER = 3000, MAT_DURASTEEL = 2000)
	build_path = /obj/item/modularlaser/lens/super

/*

/datum/prototype/design/science/modweaponnodule/scatterlens
	design_name = "scatter lens"
	id = "scatterlens"
	req_tech = list(TECH_MATERIAL = 6)
	materials_base = list(MAT_GLASS = 8000, MAT_SILVER = 3000)
	build_path = /obj/item/modularlaser/lens/scatter

/datum/prototype/design/science/modweaponnodule/advscatterlens
	design_name = "advanced scatter lens"
	id = "advscatterlens"
	req_tech = list(TECH_MATERIAL = 9)
	materials_base = list(MAT_GLASS = 8000, MAT_SILVER = 3000, MAT_VERDANTIUM = 2000)
	build_path = /obj/item/modularlaser/lens/scatter/adv

*/

/datum/prototype/design/science/modweaponnodule/basiccap
	design_name = "basic capacitor"
	id = "basiccap"
	req_tech = list(TECH_POWER = 2)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000)
	build_path = /obj/item/modularlaser/capacitor/basic

/datum/prototype/design/science/modweaponnodule/ecocap
	design_name = "efficient capacitor"
	id = "ecocap"
	req_tech = list(TECH_POWER = 4)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500)
	build_path = /obj/item/modularlaser/capacitor/eco

/datum/prototype/design/science/modweaponnodule/supereco
	design_name = "economical capacitor"
	id = "superecocap"
	req_tech = list(TECH_POWER = 6)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500)
	build_path = /obj/item/modularlaser/capacitor/eco/super

/*

/datum/prototype/design/science/modweaponnodule/quickcap
	design_name = "high throughput capactior"
	id = "quickcap"
	req_tech = list(TECH_POWER = 8)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500)
	build_path = /obj/item/modularlaser/capacitor/speed

/datum/prototype/design/science/modweaponnodule/advqcap
	design_name = "very high throughput capactior"
	id = "advqcap"
	req_tech = list(TECH_POWER = 8)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500, MAT_VERDANTIUM = 300)
	build_path = /obj/item/modularlaser/capacitor/speed/advanced

*/

/datum/prototype/design/science/modweaponnodule/basicac
	design_name = "cooling system"
	id = "basicac"
	req_tech = list(TECH_ENGINEERING = 2)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000)
	build_path = /obj/item/modularlaser/cooling/basic

/datum/prototype/design/science/modweaponnodule/recoverac
	design_name = "regenerative cooling system"
	id = "recoverac"
	req_tech = list(TECH_ENGINEERING = 4)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500)
	build_path = /obj/item/modularlaser/cooling/efficient

/datum/prototype/design/science/modweaponnodule/fastac
	design_name = "high-power regenerative cooling system"
	id = "fastac"
	req_tech = list(TECH_ENGINEERING = 7)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500, MAT_VERDANTIUM = 300)
	build_path = /obj/item/modularlaser/cooling/efficient/super

/*

/datum/prototype/design/science/modweaponnodule/superac
	design_name = "supercharged cooling system"
	id = "superac"
	req_tech = list(TECH_ENGINEERING = 4)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500)
	build_path = /obj/item/modularlaser/cooling/speed

/datum/prototype/design/science/modweaponnodule/bestac
	design_name = "hypercharged cooling system"
	id = "hyperac"
	req_tech = list(TECH_ENGINEERING = 7)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500, MAT_VERDANTIUM = 300)
	build_path = /obj/item/modularlaser/cooling/speed/adv

*/

/datum/prototype/design/science/modweaponnodule/modcontrol
	design_name = "controller"
	id = "modcontrol"
	req_tech = list(TECH_DATA = 2)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000)
	build_path = /obj/item/modularlaser/controller/basic

/*

/datum/prototype/design/science/modweaponnodule/an94
	design_name = "AN-94 patterned fire controller"
	id = "an94"
	req_tech = list(TECH_DATA = 5, TECH_COMBAT = 3)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000)
	build_path = /obj/item/modularlaser/controller/twoburst

*/

/datum/prototype/design/science/modweaponnodule/threecontrol
	design_name = "burst FCU"
	id = "threecontrol"
	req_tech = list(TECH_DATA = 5, TECH_COMBAT = 3)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500)
	build_path = /obj/item/modularlaser/controller/threeburst

/*

/datum/prototype/design/science/modweaponnodule/fivecontrol
	design_name = "quintburst FCU"
	id = "fivecontrol"
	req_tech = list(TECH_DATA = 5, TECH_COMBAT = 4)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 1000, MAT_SILVER = 500, MAT_GOLD = 500)
	build_path = /obj/item/modularlaser/controller/fiveburst

*/

/datum/prototype/design/science/pin
	category = DESIGN_CATEGORY_MUNITIONS
	subcategory = DESIGN_SUBCATEGORY_PINS
	abstract_type = /datum/prototype/design/science/pin

/datum/prototype/design/science/pin/generate_name(template)
	return "Weapon firing pin ([..()])"

/datum/prototype/design/science/pin/test
	design_name = "Testing range"
	id = "test_range_pin"
	req_tech = list(TECH_MATERIAL = 3, TECH_POWER = 2, TECH_COMBAT = 2)
	materials_base = list(MAT_STEEL = 1000)
	build_path = /obj/item/firing_pin/test_range

/datum/prototype/design/science/pin/explorer
	design_name = "Exploration"
	id = "explorer_pin"
	req_tech = list(TECH_MATERIAL = 3, TECH_POWER = 2, TECH_COMBAT = 2)
	materials_base = list(MAT_STEEL = 1000, MAT_GLASS = 500)
	build_path = /obj/item/firing_pin/explorer
