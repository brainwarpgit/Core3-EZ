bestine_rumor08 = Creature:new {
	objectName = "",
	customName = "Par Doiae (a surveyor)",
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

	templates = {"object/mobile/dressed_bestine_rumor08.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "bestineRumor08ConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(bestine_rumor08, "bestine_rumor08")
