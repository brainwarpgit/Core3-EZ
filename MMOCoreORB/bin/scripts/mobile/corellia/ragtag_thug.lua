ragtag_thug = Creature:new {
	objectName = "",
	customName = "a Ragtag thug",
	socialGroup = "ragtag",
	pvpFaction = "thug",
	faction = "thug",
	level = 8,
	chanceHit = 0.27,
	damageMin = 70,
	damageMax = 75,
	baseXp = 235,
	baseHAM = 405,
	baseHAMmax = 495,
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
	pvpBitmask = 0,
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
				"object/mobile/dressed_hooligan_rodian_female_01.iff",
				"object/mobile/dressed_criminal_thug_human_female_01.iff"
				},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 7000000},
				{group = "loot_kits", chance = 1500000},
				{group = "crystals_poor", chance = 500000},
				{group = "tailor_components", chance = 1000000}
			},
			lootChance = 3200000
		}
	},
	weapons = {"pirate_weapons_medium"},
	attacks = merge(brawlernovice,marksmannovice)
}

CreatureTemplates:addCreatureTemplate(ragtag_thug, "ragtag_thug")
