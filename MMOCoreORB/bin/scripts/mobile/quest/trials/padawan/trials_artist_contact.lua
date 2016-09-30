trials_artist_contact = Creature:new {
	objectName = "@mob/creature_names:commoner",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 10,
	chanceHit = 0.28,
	damageMin = 90,
	damageMax = 110,
	baseXp = 356,
	baseHAM = 810,
	baseHAMmax = 990,
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
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
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
	conversationTemplate = "trialsPadawanArtist02ConvoTemplate",
	attacks = {}
	
}

CreatureTemplates:addCreatureTemplate(trials_artist_contact, "trials_artist_contact")
