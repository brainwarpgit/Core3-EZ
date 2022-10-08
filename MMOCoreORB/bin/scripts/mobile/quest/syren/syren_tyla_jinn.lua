syren_tyla_jinn = Creature:new {
	objectName = "",
	customName = "Tyla Jinn",
	socialGroup = "",
	faction = "",
	mobType = MOB_NPC,
	level = 15,
	chanceHit = 0.31,
	damageMin = 160,
	damageMax = 170,
	baseXp = 831,
	baseHAM = 2400,
	baseHAMmax = 3000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
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
	creatureBitmask = NONE,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_commoner_naboo_human_female_01.iff",
		"object/mobile/dressed_commoner_naboo_human_female_02.iff",
		"object/mobile/dressed_commoner_naboo_human_female_03.iff",
		"object/mobile/dressed_commoner_naboo_human_female_04.iff",
		"object/mobile/dressed_commoner_naboo_human_female_05.iff",
		"object/mobile/dressed_commoner_naboo_human_female_06.iff",
		"object/mobile/dressed_commoner_naboo_human_female_07.iff",
		"object/mobile/dressed_commoner_naboo_human_female_08.iff",
	},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "neutralTylaJinnConvoTemplate",
	attacks = merge(pistoleermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(syren_tyla_jinn, "syren_tyla_jinn")