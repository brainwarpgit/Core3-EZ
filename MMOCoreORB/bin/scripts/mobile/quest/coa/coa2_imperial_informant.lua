coa2_imperial_informant = Creature:new {
	objectName = "",
	randomNameType = NAME_GENERIC,
	socialGroup = "imperial",
	faction = "imperial",
	level = 20,
	chanceHit = 0.33,
	damageMin = 190,
	damageMax = 200,
	baseXp = 1803,
	baseHAM = 5000,
	baseHAMmax = 6100,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 264,
	diet = HERBIVORE,

	templates = {	"object/mobile/dressed_commoner_fat_human_male_01.iff",
			"object/mobile/dressed_commoner_fat_human_male_02.iff",
			"object/mobile/dressed_commoner_naboo_human_male_01.iff",
			"object/mobile/dressed_commoner_naboo_human_male_02.iff",
			"object/mobile/dressed_commoner_naboo_human_male_03.iff",
			"object/mobile/dressed_commoner_naboo_human_male_04.iff",
			"object/mobile/dressed_commoner_naboo_human_male_05.iff",
			"object/mobile/dressed_commoner_naboo_human_male_06.iff",
			"object/mobile/dressed_commoner_naboo_human_male_07.iff",
			"object/mobile/dressed_commoner_naboo_human_male_08.iff",
			"object/mobile/dressed_commoner_old_human_male_01.iff",
			"object/mobile/dressed_commoner_old_human_male_02.iff",},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "imperialInformantConvoTemplate",
	attacks = merge(riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(coa2_imperial_informant, "coa2_imperial_informant")
