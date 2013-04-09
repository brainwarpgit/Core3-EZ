chitin_armor_leggings = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Chitin Armor Leggings",
	directObjectTemplate = "object/tangible/wearables/armor/chitin/armor_chitin_s01_leggings.iff",
	craftingValues = {
		{"armor_rating",1,1,0},
		{"kineticeffectiveness",10,40,10},
		{"armor_effectiveness",4,29,10},
		{"armor_integrity",15000, 25000,0},
		{"armor_health_encumbrance",39,23,0},
		{"armor_action_encumbrance",100,60,0},
		{"armor_mind_encumbrance",16,9,0},
	},
	skillMods = {

	},
	customizationStringNames = {"/private/index_color_0", "/private/index_color_1"},
	customizationValues = {
			{0, 1},
			{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}},
}

addLootItemTemplate("chitin_armor_leggings", chitin_armor_leggings)
