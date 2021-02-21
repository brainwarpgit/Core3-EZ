commoner_patrol = Creature:new {
	objectName = "@mob/creature_names:commoner",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "",
	faction = "",
	level = 4,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 62,
	baseHAM = 113,
	baseHAMmax = 138,
	armor = 0,
	resists = {15,15,15,15,15,15,15,-1,-1},
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
	creatureBitmask = HERD,
	optionsBitmask = AIENABLE,
	diet = HERBIVORE,

	templates = {"commoner"},
	lootGroups = {},
	weapons = {"ranged_weapons"},
	conversationTemplate = "",
	attacks = merge(brawlermid, marksmanmid)
}

CreatureTemplates:addCreatureTemplate(commoner_patrol, "commoner_patrol")