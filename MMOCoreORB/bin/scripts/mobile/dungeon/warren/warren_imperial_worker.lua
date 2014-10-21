warren_imperial_worker = Creature:new {
	objectName = "@mob/creature_names:warren_imperial_worker",
	socialGroup = "warren_imperial_worker",
	pvpFaction = "",
	faction = "",
	level = 13,
	chanceHit = 0.3,
	damageMin = 140,
	damageMax = 150,
	baseXp = 514,
	baseHAM = 1500,
	baseHAMmax = 1900,
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
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/warren_imperial_worker_s01.iff",
		"object/mobile/warren_imperial_worker_s02.iff",
		"object/mobile/warren_imperial_worker_s03.iff",
		"object/mobile/warren_imperial_worker_s04.iff",
		"object/mobile/warren_imperial_worker_s05.iff",
		"object/mobile/warren_imperial_worker_s06.iff"},
	lootGroups = {},
	weapons = {"rebel_weapons_light"},
	conversationTemplate = "",
	attacks = merge(brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(warren_imperial_worker, "warren_imperial_worker")
