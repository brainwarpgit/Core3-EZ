bounty_hunter_thug = Creature:new {
	objectName = "@mob/creature_names:bounty_hunter",
	socialGroup = "Mercenary",
	pvpFaction = "",
	faction = "",
	level = 24,
	chanceHit = 0.350000,
	damageMin = 220,
	damageMax = 230,
	baseXp = 2443,
	baseHAM = 6300,
	baseHAMmax = 7700,
	armor = 0,
	resists = {20,20,0,0,0,0,-1,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + AGGRESSIVE + ENEMY,
	optionsBitmask = 128,
	creatureBitmask = PACK + STALKER + KILLER,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_bountyhunter_trainer_03.iff",
			"object/mobile/dressed_bounty_hunter_zabrak_female_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3500000},
				{group = "grenades_looted", chance = 1000000},
				{group = "armor_looted", chance = 1500000},
				{group = "rifles", chance = 1500000},
				{group = "carbines", chance = 1500000},
				{group = "tailor_components", chance = 1000000},
				{group = "loot_kits", chance = 1000000}
			},
			lootChance = 2300000
		}				
	},
	weapons = {"pirate_weapons_heavy"},
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(bounty_hunter_thug, "bounty_hunter_thug")
