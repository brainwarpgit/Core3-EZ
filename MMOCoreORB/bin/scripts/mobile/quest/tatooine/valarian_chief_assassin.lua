valarian_chief_assassin = Creature:new {
	objectName = "",
	socialGroup = "valarian",
	faction = "valarian",
	level = 16,
	chanceHit = 0.31,
	damageMin = 160,
	damageMax = 170,
	baseXp = 1102,
	baseHAM = 2900,
	baseHAMmax = 3500,
	armor = 0,
	resists = {5,5,5,5,5,5,5,-1,-1},
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
	optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_tatooine_valarian_assassin.iff"},
	lootGroups = {},
	weapons = {"pirate_weapons_medium"},
	conversationTemplate = "theme_park_valarian_mission_target_convotemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(valarian_chief_assassin, "valarian_chief_assassin")