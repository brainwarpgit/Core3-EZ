korga_ancient = Creature:new {
	objectName = "@mob/creature_names:korga_ancient",
	socialGroup = "korga_tribe",
	pvpFaction = "korga_tribe",
	faction = "korga_tribe",
	level = 47,
	chanceHit = 0.48,
	damageMin = 385,
	damageMax = 480,
	baseXp = 4643,
	baseHAM = 9800,
	baseHAMmax = 12000,
	armor = 0,
	resists = {25,15,0,50,50,-1,0,0,-1},
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

	templates = {
			"object/mobile/dulok_male.iff",
			"object/mobile/dulok_female.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(korga_ancient, "korga_ancient")
