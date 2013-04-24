brigand_assassin = Creature:new {
	objectName = "@mob/creature_names:assassin",
	socialGroup = "brigand",
	pvpFaction = "",
	faction = "",
	level = 17,
	chanceHit = 0.32,
	damageMin = 180,
	damageMax = 190,
	baseXp = 1257,
	baseHAM = 3500,
	baseHAMmax = 4300,
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
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = 
		{
			"object/mobile/dressed_brigade_infiltrator_human_female_01.iff",
			"object/mobile/dressed_brigade_infiltrator_human_male_01.iff",
			"object/mobile/dressed_brigade_technician_human_female_01.iff",
			"object/mobile/dressed_brigade_technician_human_male_01.iff",
		},
	lootGroups = {},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(brigand_assassin, "brigand_assassin")