deranged_mantigrue = Creature:new {
	objectName = "@mob/creature_names:deranged_mantigrue",
	socialGroup = "mantigrue",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 45,
	chanceHit = 0.44,
	damageMin = 370,
	damageMax = 450,
	baseXp = 4279,
	baseHAM = 8800,
	baseHAMmax = 10800,
	armor = 0,
	resists = {150,145,170,-1,170,170,170,170,-1},
	meatType = "meat_carnivore",
	meatAmount = 80,
	hideType = "hide_wooly",
	hideAmount = 50,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/condor_dragon_hue.iff"},
	hues = { 0, 1, 2, 3, 4, 5, 6, 7 },
	scale = 1.1,
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"blindattack",""}, {"stunattack",""} },
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(deranged_mantigrue, "deranged_mantigrue")
