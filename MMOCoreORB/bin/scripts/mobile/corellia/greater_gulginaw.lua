greater_gulginaw = Creature:new {
	objectName = "@mob/creature_names:greater_gulginaw",
	socialGroup = "gulginaw",
	pvpFaction = "",
	faction = "",
	level = 21,
	chanceHit = 0.33,
	damageMin = 190,
	damageMax = 200,
	baseXp = 1803,
	baseHAM = 5000,
	baseHAMmax = 6100,
	armor = 0,
	resists = {15,30,-1,10,-1,-1,10,10,-1},
	meatType = "meat_avian",
	meatAmount = 97,
	hideType = "",
	hideAmount = 0,
	boneType = "bone_avian",
	boneAmount = 48,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 6,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/greater_gulginaw.iff"},
	lootGroups = {},
	weapons = {"creature_spit_small_yellow"},
	conversationTemplate = "",
	attacks = {
		{"dizzyattack","dizzyChance=50"},
		{"stunattack","stunChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(greater_gulginaw, "greater_gulginaw")