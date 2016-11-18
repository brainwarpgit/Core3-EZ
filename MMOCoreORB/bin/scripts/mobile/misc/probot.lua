probot = Creature:new {
	objectName = "@droid_name:imperial_probot_base",
	socialGroup = "",
	faction = "",
	level = 9,
	chanceHit = 0.27,
	damageMin = 80,
	damageMax = 90,
	baseXp = 0,
	baseHAM = 700,
	baseHAMmax = 900,
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
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/probot.iff"},
	lootGroups = {},
	conversationTemplate = "",
	weapons = {"droid_probot_ranged"},
	defaultAttack = "attack"
}

CreatureTemplates:addCreatureTemplate(probot, "probot")
