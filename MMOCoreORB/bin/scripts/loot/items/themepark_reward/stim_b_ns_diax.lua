stim_b_ns_diax = {
	minimumLevel = 0,
	maximumLevel = 0,
	customObjectName = "Diax's Damage Stimpack B",
	directObjectTemplate = "object/tangible/medicine/crafted/medpack_damage_b.iff",
	gameObjectType = 8236,
	templateType = STIMPACK,
	useCount = 6,
	medicineUse = 37,
	effectiveness = 150,
	medicineClass = STIM_B,
	--TODO: WE NEED TO FIGURE OUT HOW TO DELINEATE THIS PARTICULAR STIM TO HEAL ALL 3 HAM VALUES

	numberExperimentalProperties = {1, 1, 2, 2, 1, 1},
	experimentalProperties = {"XX", "XX", "OQ", "PE", "OQ", "UT", "XX", "XX"},
	experimentalWeights = {1, 1, 2, 1, 2, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_effectiveness", "exp_charges", "null", "null"},
	experimentalSubGroupTitles = {"null", "null", "power", "charges", "skillmodmin", "hitpoints"},
	experimentalMin = {0, 0, 75, 15, 5, 1000},
	experimentalMax = {0, 0, 200, 30, 5, 1000},
	experimentalPrecision = {0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 1, 1, 4},

}

addLootItemTemplate("stim_b_ns_diax", stim_b_ns_diax)