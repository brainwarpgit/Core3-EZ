cll8_binary_load_lifter_crafted_advanced = Creature:new {
	objectName = "@mob/creature_names:cll8_binary_load_lifter",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
	level = 4,
	chanceHit = 0.24,
	damageMin = 10,
	damageMax = 10,
	baseXp = 0,
	baseHAM = 1000,
	baseHAMmax = 1000,
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
	pvpBitmask = NONE,
	creatureBitmask = HERD,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/creature/npc/droid/crafted/cll_8_binary_load_lifter_advanced.iff"
	},		
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
}

CreatureTemplates:addCreatureTemplate(cll8_binary_load_lifter_crafted_advanced, "cll8_binary_load_lifter_crafted_advanced")