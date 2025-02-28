/*
	Note: This file is meant for actual weapons (guns, swords, etc), and not the stupid 'every obj is a weapon, except when it's not' thing.
*/

//******
//*Guns*
//******

//This contains a lot of copypasta but I'm told it's better then a lot of New()s appending the var.

/obj/item/gun/projectile/energy/crossbow
	description_info = "This is an energy weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire."
	description_antag = "This is a stealthy weapon which fires poisoned bolts at your target.  When it hits someone, they will suffer a stun effect, in \
	addition to toxins.  The energy crossbow recharges itself slowly, and can be concealed in your pocket or bag."

/obj/item/gun/projectile/energy/gun
	description_info = "This is an energy weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  Most energy weapons can fire through windows harmlessly.  To switch between stun and lethal, click the weapon \
	in your hand.  To recharge this weapon, use a weapon recharger."

/obj/item/gun/projectile/energy/gun/taser
	description_info = "This is an energy weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  Most energy weapons can fire through windows harmlessly. To recharge this weapon, use a weapon recharger."

/obj/item/gun/projectile/energy/gun/stunrevolver
	description_info = "This is an energy weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  Most energy weapons can fire through windows harmlessly. To recharge this weapon, use a weapon recharger."

/obj/item/gun/projectile/energy/gun/nuclear
	description_info = "This is an energy weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  Most energy weapons can fire through windows harmlessly.  To switch between stun and lethal, click the weapon \
	in your hand.  Unlike most weapons, this weapon recharges itself."

/obj/item/gun/projectile/energy/captain
	description_info = "This is an energy weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  Most energy weapons can fire through windows harmlessly. Unlike most weapons, this weapon recharges itself."

/obj/item/gun/projectile/energy/chameleon
	description_info = null //The chameleon gun adopts the description_info of the weapon it is impersonating as, to make meta-ing harder.
	description_antag = "This gun is actually a hologram projector that can alter its appearance to mimick other weapons.  To change the appearance, use \
	the appropriate verb in the chameleon items tab. Any beams or projectiles fired from this gun are actually holograms and useless for actual combat. \
	Projecting these holograms over distance uses a little bit of charge."

/obj/item/gun/projectile/energy/chameleon/change(picked in gun_choices) //Making the gun change its help text to match the weapon's help text.
	..(picked)
	var/obj/O = gun_choices[picked]
	description_info = initial(O.description_info)

/obj/item/gun/projectile/ballistic/shotgun/pump
	description_info = "This is a ballistic weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  After firing, you will need to pump the gun, by clicking on the gun in your hand.  To reload, load more shotgun \
	shells into the gun."

/obj/item/gun/projectile/ballistic/heavysniper
	description_info = "This is a ballistic weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', \
	then click where you want to fire.  The gun's chamber can be opened or closed by using it in your hand.  To reload, open the chamber, add a new bullet \
	then close it.  To use the scope, use the appropriate verb in the object tab."

//*******
//*Melee*
//*******

/obj/item/melee/baton
	description_info = "The baton needs to be turned on to apply the stunning effect.  Use it in your hand to toggle it on or off.  If your intent is \
	set to 'harm', you will inflict damage when using it, regardless if it is on or not.  Each stun reduces the baton's charge, which can be replenished by \
	putting it inside a weapon recharger."

/obj/item/melee/transforming/energy/sword
	description_antag = "The energy sword is a very strong melee weapon, capable of severing limbs easily, if they are targeted.  It can also has a chance \
	to block projectiles and melee attacks while it is on and being held.  The sword can be toggled on or off by using it in your hand.  While it is off, \
	it can be concealed in your pocket or bag."

/obj/item/melee/cultblade
	description_antag = "This sword is a powerful weapon, capable of severing limbs easily, if they are targeted.  Nonbelievers are unable to use this weapon."
