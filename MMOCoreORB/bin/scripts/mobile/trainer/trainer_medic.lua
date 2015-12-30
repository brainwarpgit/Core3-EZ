trainer_medic = Creature:new {
	objectName = "@mob/creature_names:trainer_medic",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	faction = "",
	level = 100,
	chanceHit = 0.390000,
	damageMin = 290,
	damageMax = 300,
	baseXp = 2914,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {-1,-1,-1,-1,-1,-1,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_medic_trainer_01.iff",
		"object/mobile/dressed_medic_trainer_02.iff",
		"object/mobile/dressed_medic_trainer_03.iff"
	},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "trainer_medic_convotemplate",
	attacks = {}
}
CreatureTemplates:addCreatureTemplate(trainer_medic,"trainer_medic")
