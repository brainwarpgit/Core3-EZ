chasmal_spider = Creature:new {
	objectName = "@mob/creature_names:gaping_spider_chasmal",
	socialGroup = "spider",
	pvpFaction = "",
	faction = "",
	level = 31,
	chanceHit = 0.38,
	damageMin = 290,
	damageMax = 300,
	baseXp = 3097,
	baseHAM = 8600,
	baseHAMmax = 10500,
	armor = 0,
	resists = {30,20,20,20,20,20,10,20,-1},
	meatType = "meat_insect",
	meatAmount = 8,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.05,
	ferocity = 5,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider_hue.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"strongpoison",""},
		{"stunattack","stunChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(chasmal_spider, "chasmal_spider")