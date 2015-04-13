death_watch_miner = Creature:new {
	objectName = "@mob/creature_names:miner",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 5,
	chanceHit = 0.25,
	damageMin = 45,
	damageMax = 50,
	baseXp = 85,
	baseHAM = 135,
	baseHAMmax = 165,
	armor = 0,
	resists = {25,25,25,25,25,25,25,-1,-1},
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
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_mand_miner_bith.iff",
		"object/mobile/dressed_mand_miner_aqualish.iff",
		"object/mobile/dressed_mand_miner_hum_01.iff",
		"object/mobile/dressed_mand_miner_hum_02.iff",
		"object/mobile/dressed_mand_miner_hum_03.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = brawlernovice
}

CreatureTemplates:addCreatureTemplate(death_watch_miner, "death_watch_miner")
