afarathu_savage = Creature:new {
	objectName = "@mob/creature_names:afarathu_cult_savage",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "afarathu",
	faction = "afarathu",
	level = 7,
	chanceHit = 0.26,
	damageMin = 70,
	damageMax = 75,
	baseXp = 187,
	baseHAM = 180,
	baseHAMmax = 220,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"selonian_male",
				"selonian_female"},
	lootGroups = {
		{
			groups = {
				{group = "afarathu_tier_1", chance = 10000000}
			}
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_carbine",
	secondaryWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = marksmannovice,
	secondaryAttacks = {}
}

CreatureTemplates:addCreatureTemplate(afarathu_savage, "afarathu_savage")
