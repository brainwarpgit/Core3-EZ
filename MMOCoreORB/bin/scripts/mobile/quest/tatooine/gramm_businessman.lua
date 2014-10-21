gramm_businessman = Creature:new {
	objectName = "",
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
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
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = 136,
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
	lootGroups = {},
	weapons = {},
	conversationTemplate = "gramm_rile_mission_target_convotemplate",
	attacks = brawlermaster
}

CreatureTemplates:addCreatureTemplate(gramm_businessman, "gramm_businessman")
