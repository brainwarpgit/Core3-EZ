sith_shadow_thug = Creature:new {
	objectName = "@mob/creature_names:shadow_thug",
	socialGroup = "sith_shadow",
	faction = "sith_shadow",
	level = 51,
	chanceHit = 0.47,
	damageMin = 395,
	damageMax = 500,
	baseXp = 5007,
	baseHAM = 9700,
	baseHAMmax = 11900,
	armor = 1,
	resists = {45,45,45,45,45,45,45,45,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + ENEMY + AGGRESSIVE,
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
		"object/mobile/dressed_sith_shadow_zab_m_03.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 4000000},
				{group = "tailor_components", chance = 1500000},
				{group = "loot_kit_parts", chance = 1500000},
				{group = "printer_parts", chance = 1000000},
				{group = "wearables_common", chance = 1000000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000},
			},
			{
				groups = {
					{group = "village_resources", chance =  10000000}
				},
				lootChance = 7500000
			},
		}
	},

	weapons = {"pirate_weapons_heavy"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,marksmanmaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(sith_shadow_thug, "sith_shadow_thug")
