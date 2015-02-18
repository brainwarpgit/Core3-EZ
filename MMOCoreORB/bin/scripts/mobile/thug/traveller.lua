traveller = Creature:new {
	objectName = "",
	customName = "a Traveller",
	socialGroup = "wilder",
	faction = "",
	level = 4,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 85,
	baseHAM = 113,
	baseHAMmax = 138,
	armor = 0,
	resists = {20,20,10,25,35,10,10,10,0},
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
	creatureBitmask = PACK + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = { "object/mobile/dressed_commoner_old_human_female_01.iff",
			"object/mobile/dressed_commoner_old_human_female_02.iff", 
			"object/mobile/dressed_commoner_old_human_male_01.iff",
			"object/mobile/dressed_commoner_old_human_male_02.iff",
			"object/mobile/dressed_commoner_old_twilek_female_01.iff",
			"object/mobile/dressed_commoner_old_twilek_female_02.iff",
			"object/mobile/dressed_commoner_old_twilek_male_01.iff",
			"object/mobile/dressed_commoner_old_twilek_male_02.iff",
			"object/mobile/dressed_commoner_old_zabrak_female_01.iff",
			"object/mobile/dressed_commoner_old_zabrak_female_02.iff",
			"object/mobile/dressed_commoner_old_zabrak_male_01.iff",
			"object/mobile/dressed_commoner_old_zabrak_male_02.iff",
			"object/mobile/dressed_commoner_artisan_bith_male_01.iff",
			"object/mobile/dressed_commoner_artisan_sullustan_male_01.iff",
			"object/mobile/dressed_commoner_artisan_trandoshan_male_01.iff",
			"object/mobile/dressed_commoner_fat_human_female_01.iff",
			"object/mobile/dressed_commoner_fat_human_female_02.iff",
			"object/mobile/dressed_commoner_fat_human_male_01.iff",
			"object/mobile/dressed_commoner_fat_human_male_02.iff",
			"object/mobile/dressed_commoner_fat_twilek_female_01.iff",
			"object/mobile/dressed_commoner_fat_twilek_female_02.iff",
			"object/mobile/dressed_commoner_fat_twilek_male_01.iff",
			"object/mobile/dressed_commoner_fat_twilek_male_02.iff",
			"object/mobile/dressed_commoner_fat_zabrak_female_01.iff",
			"object/mobile/dressed_commoner_fat_zabrak_female_02.iff",
			"object/mobile/dressed_commoner_fat_zabrak_male_01.iff",
			"object/mobile/dressed_commoner_fat_zabrak_male_02.iff", },
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
	weapons = {"rebel_weapons_medium"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/townperson",
	attacks = merge(marksmannovice,brawlernovice)
}

CreatureTemplates:addCreatureTemplate(traveller, "traveller")
