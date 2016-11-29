scholar_szingo = Creature:new {
	objectName = "@mob/creature_names:scholar_szingo",
	socialGroup = "endor_marauder",
	faction = "endor_marauder",
	level = 100,
	chanceHit = 0.33,
	damageMin = 210,
	damageMax = 220,
	baseXp = 1609,
	baseHAM = 5900,
	baseHAMmax = 7200,
	armor = 0,
	resists = {0,0,-1,40,40,-1,-1,-1,-1},
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

	templates = {"object/mobile/dressed_scholar_szingo.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "theme_park_marauder_szingo_terak_mission_giver_convotemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(scholar_szingo, "scholar_szingo")