frenzied_marauder = Creature:new {
	objectName = "@mob/creature_names:frenzied_marauder",
	socialGroup = "endor_marauder",
	pvpFaction = "endor_marauder",
	faction = "endor_marauder",
	level = 50,
	chanceHit = 0.5,
	damageMin = 470,
	damageMax = 650,
	baseXp = 4916,
	baseHAM = 9200,
	baseHAMmax = 11200,
	armor = 1,
	resists = {40,40,5,-1,-1,-1,5,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_frenzied_marauder.iff"},
	lootGroups = {},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(frenzied_marauder, "frenzied_marauder")
