syren_jevan_monsul = Creature:new {
	objectName = "",
	customName = "Jevan Monsul",
	socialGroup = "imperial",
	faction = "imperial",
	mobType = MOB_NPC,
	level = 15,
	chanceHit = 0.31,
	damageMin = 160,
	damageMax = 170,
	baseXp = 831,
	baseHAM = 2400,
	baseHAMmax = 3000,
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
	creatureBitmask = NONE,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_imperial_major_m.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "imperialJevanMonsulConvoTemplate",
	attacks = merge(pistoleermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(syren_jevan_monsul, "syren_jevan_monsul")
