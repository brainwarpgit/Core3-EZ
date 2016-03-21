bestine_capitol04 = Creature:new {
	objectName = "",
	randomNameType = NAME_GENERIC,
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
	resists = {0,0,0,0,10,0,0,-1,-1},
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
	creatureBitmask = PACK,
	optionsBitmask = 264,
	diet = HERBIVORE,
	
	templates = {"object/mobile/dressed_bestine_capitol04.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "bestineCapitol04ConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(bestine_capitol04, "bestine_capitol04")
