jumis = Creature:new {
	objectName = "@mob/creature_names:commoner",
	randomNameType = NAME_GENERIC_TAG,
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
	pvpBitmask = NONE,
	creatureBitmask = HERD,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {	"object/mobile/dressed_commoner_naboo_bothan_female_01.iff",
					"object/mobile/dressed_commoner_naboo_bothan_female_02.iff",
					"object/mobile/dressed_commoner_naboo_bothan_male_01.iff",
					"object/mobile/dressed_commoner_naboo_bothan_male_02.iff",
					"object/mobile/dressed_commoner_naboo_human_female_01.iff",
					"object/mobile/dressed_commoner_naboo_human_female_02.iff",
					"object/mobile/dressed_commoner_naboo_human_female_03.iff",
					"object/mobile/dressed_commoner_naboo_human_female_04.iff",
					"object/mobile/dressed_commoner_naboo_human_female_05.iff",
					"object/mobile/dressed_commoner_naboo_human_female_06.iff",
					"object/mobile/dressed_commoner_naboo_human_female_07.iff",
					"object/mobile/dressed_commoner_naboo_human_female_08.iff",
					"object/mobile/dressed_commoner_naboo_human_male_01.iff",
					"object/mobile/dressed_commoner_naboo_human_male_02.iff",
					"object/mobile/dressed_commoner_naboo_human_male_03.iff",
					"object/mobile/dressed_commoner_naboo_human_male_04.iff",
					"object/mobile/dressed_commoner_naboo_human_male_05.iff",
					"object/mobile/dressed_commoner_naboo_human_male_06.iff",
					"object/mobile/dressed_commoner_naboo_human_male_07.iff",
					"object/mobile/dressed_commoner_naboo_human_male_08.iff",
					"object/mobile/dressed_commoner_naboo_moncal_female_01.iff",
					"object/mobile/dressed_commoner_naboo_moncal_female_02.iff",
					"object/mobile/dressed_commoner_naboo_moncal_male_01.iff",
					"object/mobile/dressed_commoner_naboo_moncal_male_02.iff",
					"object/mobile/dressed_commoner_naboo_twilek_female_01.iff",
					"object/mobile/dressed_commoner_naboo_twilek_female_02.iff",
					"object/mobile/dressed_commoner_naboo_twilek_male_01.iff",
					"object/mobile/dressed_commoner_naboo_twilek_male_02.iff",
					"object/mobile/dressed_commoner_naboo_zabrak_female_01.iff",
					"object/mobile/dressed_commoner_naboo_zabrak_female_02.iff",
					"object/mobile/dressed_commoner_naboo_zabrak_male_01.iff",
					"object/mobile/dressed_commoner_naboo_zabrak_male_02.iff"
					},
				
	lootGroups = {},
	weapons = {},
	conversationTemplate = "pooja_naberrie_mission_target_convotemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(jumis, "jumis")
