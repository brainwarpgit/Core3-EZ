bestine_capitol03 = Creature:new {
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED + INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_bestine_capitol03.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "bestineCapitol03ConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(bestine_capitol03, "bestine_capitol03")
