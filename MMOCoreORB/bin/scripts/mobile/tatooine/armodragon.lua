armodragon = Creature:new {
	objectName = "@mob/creature_names:dragonet_armodragon",
	socialGroup = "lizard",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 34,
	chanceHit = 0.41,
	damageMin = 315,
	damageMax = 340,
	baseXp = 3370,
	baseHAM = 8600,
	baseHAMmax = 10500,
	armor = 0,
	resists = {125,140,20,20,20,-1,20,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 125,
	hideType = "hide_bristley",
	hideAmount = 75,
	boneType = "bone_mammal",
	boneAmount = 68,
	milk = 0,
	tamingChance = 0.05,
	ferocity = 6,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/dune_lizard_hue.iff"},
	hues = { 8, 9, 10, 11, 12, 13, 14, 15 },
	controlDeviceTemplate = "object/intangible/pet/dune_lizard_hue.iff",
	scale = 1.3,
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "object/weapon/ranged/creature/creature_spit_small_toxicgreen.iff",
	secondaryWeapon = "object/weapon/ranged/creature/creature_spit_small_toxicgreen.iff",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"dizzyattack",""}, {"posturedownattack",""} },
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(armodragon, "armodragon")
