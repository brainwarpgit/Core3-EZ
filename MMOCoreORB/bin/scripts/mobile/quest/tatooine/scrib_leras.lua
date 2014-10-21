scrib_leras = Creature:new {
	objectName = "",
	customName = "Scrib Leras",
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
	faction = "townsperson",
	level = 4,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 62,
	baseHAM = 113,
	baseHAMmax = 138,
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
	pvpBitmask = ATTACKABLE,
	creatureBitmask = STALKER,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_hutt_medic2_twilek_male_01.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "theme_park_jabba_mission_target_convotemplate",
	attacks = brawlermaster
}

CreatureTemplates:addCreatureTemplate(scrib_leras, "scrib_leras")
