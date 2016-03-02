tutorial_scared_soldier = Creature:new {
	objectName = "@newbie_tutorial/system_messages:imp_name",
	socialGroup = "imperial",
	faction = "imperial",
	level = 18,
	chanceHit = 0.32,
	damageMin = 170,
	damageMax = 180,
	baseXp = 1426,
	baseHAM = 4100,
	baseHAMmax = 5000,
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
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_imperial_officer_m.iff"},
	lootGroups = {},
	weapons = {"imperial_weapons_medium"},
	attacks = merge(marksmannovice,brawlernovice),
	conversationTemplate = "tutorialScaredSoldierConvoTemplate",
}

CreatureTemplates:addCreatureTemplate(tutorial_scared_soldier, "tutorial_scared_soldier")