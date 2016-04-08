sean_questp_market = Creature:new {
	objectName = "",
	customName = "Orqiti Aneofo",
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 0,
	resists = {20,20,40,0,0,-1,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED + INVULNERABLE + CONVERSABLE + INTERESTING,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_sean_questp_market.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "seanQuestpMarketConvoTemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(sean_questp_market, "sean_questp_market")
