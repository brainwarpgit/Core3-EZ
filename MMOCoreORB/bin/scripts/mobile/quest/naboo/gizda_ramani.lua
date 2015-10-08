gizda_ramani = Creature:new {
	objectName = "",
	customName = "gizda_ramani",
	socialGroup = "rebel",
	faction = "rebel",
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
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_rebel_pilot_human_female_01.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "pooja_naberrie_mission_target_convotemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(gizda_ramani, "gizda_ramani")
