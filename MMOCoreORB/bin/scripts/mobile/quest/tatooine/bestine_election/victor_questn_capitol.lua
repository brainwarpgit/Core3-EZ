victor_questn_capitol = Creature:new {
	objectName = "",
	customName = "TL-017",
	socialGroup = "imperial",
	faction = "imperial",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED + INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_victor_questn_capitol.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "victorQuestnCapitolConvoTemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(victor_questn_capitol, "victor_questn_capitol")
