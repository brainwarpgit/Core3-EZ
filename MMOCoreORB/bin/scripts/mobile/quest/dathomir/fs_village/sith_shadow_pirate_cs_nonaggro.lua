sith_shadow_pirate_cs_nonaggro = Creature:new {
	objectName = "@mob/creature_names:shadow_pirate_nonaggro",
	socialGroup = "sith_shadow",
	faction = "sith_shadow_nonaggro",
	level = 90,
	chanceHit = 0.85,
	damageMin = 570,
	damageMax = 850,
	baseXp = 1864,
	baseHAM = 13300,
	baseHAMmax = 16300,
	armor = 1,
	resists = {65,65,50,75,75,70,70,65,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_sith_shadow_hum_f_01.iff",
		"object/mobile/dressed_sith_shadow_hum_f_02.iff",
		"object/mobile/dressed_sith_shadow_hum_f_03.iff",
		"object/mobile/dressed_sith_shadow_hum_m_01.iff",
		"object/mobile/dressed_sith_shadow_hum_m_02.iff",
		"object/mobile/dressed_sith_shadow_hum_m_03.iff",
		"object/mobile/dressed_sith_shadow_aqualish_f_01.iff",
		"object/mobile/dressed_sith_shadow_aqualish_f_02.iff",
		"object/mobile/dressed_sith_shadow_aqualish_m_01.iff",
		"object/mobile/dressed_sith_shadow_aqualish_m_02.iff",
		"object/mobile/dressed_sith_shadow_nikto_m_01.iff",
		"object/mobile/dressed_sith_shadow_nikto_m_02.iff",
		"object/mobile/dressed_sith_shadow_nikto_m_03.iff",
		"object/mobile/dressed_sith_shadow_rodian_f_01.iff",
		"object/mobile/dressed_sith_shadow_rodian_f_02.iff",
		"object/mobile/dressed_sith_shadow_rodian_m_01.iff",
		"object/mobile/dressed_sith_shadow_rodian_m_02.iff",
		"object/mobile/dressed_sith_shadow_trn_f_01.iff",
		"object/mobile/dressed_sith_shadow_trn_m_01.iff",
		"object/mobile/dressed_sith_shadow_trn_m_02.iff",
		"object/mobile/dressed_sith_shadow_trn_m_03.iff",
		"object/mobile/dressed_sith_shadow_zab_f_01.iff",
		"object/mobile/dressed_sith_shadow_zab_f_02.iff",
		"object/mobile/dressed_sith_shadow_zab_m_01.iff",
		"object/mobile/dressed_sith_shadow_zab_m_02.iff",
		"object/mobile/dressed_sith_shadow_zab_m_03.iff"
	},
	lootGroups = {
		{
			groups = {
				{ group = "cs_datapad", chance = 10000000 },
			},
			lootChance = 2000000
		}
	},
	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(sith_shadow_pirate_cs_nonaggro, "sith_shadow_pirate_cs_nonaggro")
