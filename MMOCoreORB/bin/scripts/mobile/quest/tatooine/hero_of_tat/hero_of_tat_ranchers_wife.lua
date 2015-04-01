hero_of_tat_ranchers_wife = Creature:new {
	objectName = "@mob/creature_names:quest_hero_of_tatooine_wife",
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
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_commoner_tatooine_aqualish_female_01.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_02.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_03.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_04.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_05.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_06.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_07.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_08.iff",
		"object/mobile/dressed_commoner_tatooine_bith_female_01.iff",
		"object/mobile/dressed_commoner_tatooine_bith_female_02.iff",
		"object/mobile/dressed_commoner_tatooine_bith_female_03.iff",
		"object/mobile/dressed_commoner_tatooine_bith_female_04.iff",
		"object/mobile/dressed_commoner_tatooine_bith_female_05.iff",
		"object/mobile/dressed_commoner_tatooine_bith_female_06.iff",
		"object/mobile/dressed_commoner_tatooine_rodian_female_01.iff",
		"object/mobile/dressed_commoner_tatooine_rodian_female_02.iff",
		"object/mobile/dressed_commoner_tatooine_rodian_female_03.iff",
		"object/mobile/dressed_commoner_tatooine_rodian_female_04.iff",
		"object/mobile/dressed_commoner_tatooine_trandoshan_female_01.iff",
		"object/mobile/dressed_commoner_tatooine_trandoshan_female_02.iff",
		"object/mobile/dressed_commoner_tatooine_trandoshan_female_03.iff",
		"object/mobile/dressed_commoner_tatooine_trandoshan_female_04.iff",
	},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "heroOfTatRanchersWifeConvoTemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(hero_of_tat_ranchers_wife, "hero_of_tat_ranchers_wife")
