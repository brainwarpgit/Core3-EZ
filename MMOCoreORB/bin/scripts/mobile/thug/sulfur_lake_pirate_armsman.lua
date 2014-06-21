sulfur_lake_pirate_armsman = Creature:new {
	objectName = "@mob/creature_names:slp_armsman",
	socialGroup = "Pirate",
	pvpFaction = "",
	faction = "",
	level = 26,
	chanceHit = 0.36,
	damageMin = 250,
	damageMax = 260,
	baseXp = 2730,
	baseHAM = 7700,
	baseHAMmax = 9400,
	armor = 0,
	resists = {0,0,0,35,25,-1,50,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {},
	lootGroups = {
      	{
			groups = {
				{group = "junk", chance = 4000000},
				{group = "wearables_common", chance = 3000000},
				{group = "loot_kit_parts", chance = 2000000},
				{group = "tailor_components", chance = 1000000},
			},
			lootChance = 3000000
		}
	},
	weapons = {"ranged_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(sulfur_lake_pirate_armsman, "sulfur_lake_pirate_armsman")