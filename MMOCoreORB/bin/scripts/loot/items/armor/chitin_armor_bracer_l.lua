chitin_armor_bracer_l = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Chitin Armor Left Bracer",
	directObjectTemplate = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bracer_l.iff",
	craftingValues = {
		{"armor_rating",1,1,0},
		{"kineticeffectiveness",10,40,0},
		{"armor_effectiveness",4,29,0},
		{"armor_integrity",15000, 25000,0},
		{"armor_health_encumbrance",13,8,0},
		{"armor_action_encumbrance",13,8,0},
		{"armor_mind_encumbrance",16,9,0},
	},
	skillMods = {

	},
	customizationStringNames = {"/private/index_color_0", "/private/index_color_1"},
	customizationValues = {
			{0, 1},
			{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	},

	junkDealerTypeNeeded = JUNKGENERIC,
	junkMinValue = 35,
	junkMaxValue = 70
}

addLootItemTemplate("chitin_armor_bracer_l", chitin_armor_bracer_l)
