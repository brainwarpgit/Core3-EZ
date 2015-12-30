nurla_businessman = Creature:new {
	objectName = "@mob/creature_names:businessman",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 4,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 62,
	baseHAM = 113,
	baseHAMmax = 138,
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
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {	"object/mobile/dressed_commoner_fat_zabrak_male_01.iff",
		"object/mobile/dressed_commoner_tatooine_ishitib_male_01.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_07.iff",
		"object/mobile/dressed_commoner_naboo_twilek_female_01.iff",
		"object/mobile/dressed_commoner_old_zabrak_male_01.iff",
		"object/mobile/dressed_commoner_tatooine_sullustan_male_03.iff",
		"object/mobile/dressed_commoner_naboo_human_male_08.iff",
		"object/mobile/dressed_commoner_tatooine_nikto_male_03.iff",
		"object/mobile/dressed_commoner_old_human_female_02.iff",
		"object/mobile/dressed_commoner_tatooine_nikto_male_07.iff",
		"object/mobile/dressed_commoner_tatooine_bith_male_05.iff",
		"object/mobile/dressed_commoner_tatooine_ishitib_male_01.iff",
		"object/mobile/dressed_commoner_naboo_human_male_03.iff",
		"object/mobile/dressed_commoner_tatooine_bith_male_02.iff",
		"object/mobile/dressed_commoner_tatooine_trandoshan_male_02.iff",
		"object/mobile/dressed_commoner_naboo_human_female_07.iff",
		"object/mobile/dressed_commoner_tatooine_bith_male_01.iff",
		"object/mobile/dressed_commoner_tatooine_trandoshan_female_04.iff",
		"object/mobile/dressed_diplomat_human_female_01.iff",
		"object/mobile/dressed_diplomat_human_female_02.iff",
		"object/mobile/dressed_diplomat_human_female_03.iff",
		"object/mobile/dressed_diplomat_human_male_01.iff",
		"object/mobile/dressed_diplomat_human_male_02.iff",
		"object/mobile/dressed_diplomat_human_male_03.iff",
		"object/mobile/dressed_diplomat_trando_female_01.iff",
		"object/mobile/dressed_diplomat_trando_male_01.iff",
		"object/mobile/dressed_diplomat_zabrak_female_01.iff",
		"object/mobile/dressed_diplomat_zabrak_female_02.iff",
		"object/mobile/dressed_diplomat_zabrak_male_01.iff",
		"object/mobile/dressed_diplomat_zabrak_male_02.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "task_loot_nurla_slinthiss_datadisc", chance = 10000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = brawlermaster
}

CreatureTemplates:addCreatureTemplate(nurla_businessman, "nurla_businessman")
