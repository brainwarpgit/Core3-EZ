senior_specforce_lieutenant = Creature:new {
	objectName = "@mob/creature_names:senior_specforce_lieutenant",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "rebel",
	faction = "rebel",
	level = 24,
	chanceHit = 0.35,
	damageMin = 230,
	damageMax = 240,
	baseXp = 2543,
	baseHAM = 6800,
	baseHAMmax = 8300,
	armor = 0,
	resists = {15,15,0,0,0,-1,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_rebel_specforce_guerilla_human_male_01.iff",
		"object/mobile/dressed_rebel_specforce_guerilla_moncal_male_01.iff",
		"object/mobile/dressed_rebel_specforce_guerrilla_human_female_01.iff",
		"object/mobile/dressed_rebel_specforce_guerrilla_rodian_female_01.iff",
		"object/mobile/dressed_rebel_specforce_guerrilla_rodian_male_01.iff",
		"object/mobile/dressed_rebel_specforce_guerrilla_zabrak_female_01.iff",},
	lootGroups = {
		{
			groups = {
				{group = "rebel_officer_tier_1", chance = 10000000}
			}
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "imperial_carbine",
	secondaryWeapon = "imperial_pistol",
	reactionStf = "@npc_reaction/military",
	personalityStf = "@hireling/hireling_military",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = marksmanmaster,
	secondaryAttacks = marksmanmaster
}

CreatureTemplates:addCreatureTemplate(senior_specforce_lieutenant, "senior_specforce_lieutenant")
