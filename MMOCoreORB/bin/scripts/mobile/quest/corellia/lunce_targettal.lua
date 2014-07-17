lunce_targettal = Creature:new {
	objectName = "",
	socialGroup = "corsec",
	pvpFaction = "corsec",
	faction = "corsec",
	level = 16,
	chanceHit = 0.31,
	damageMin = 170,
	damageMax = 180,
	baseXp = 960,
	baseHAM = 2900,
	baseHAMmax = 3500,
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
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_corsec_officer_human_male_01.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "jadam_questrel_mission_target_convotemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(lunce_targettal, "lunce_targettal")