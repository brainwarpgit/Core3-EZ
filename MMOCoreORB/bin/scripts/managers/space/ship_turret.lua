-- {shipChassisName, weaponIndex, minYaw, maxYaw, minPitch, maxPitch},

turretData = {
	--{"yt1300", 0, -180, 180, -90, 5},
	--{"yt1300", 1, -180, 180, -90, 5},
	--{"yt1300_tier1", 0, -180, 180, -90, 5},
	--{"yt1300_tier1", 1, -180, 180, -90, 5},
	--{"yt1300_tier2", 0, -180, 180, -90, 5},
	--{"yt1300_tier2", 1, -180, 180, -90, 5},
	--{"yt1300_tier3", 0, -180, 180, -90, 5},
	--{"yt1300_tier3", 1, -180, 180, -90, 5},
	--{"yt1300_tier4", 0, -180, 180, -90, 5},
	--{"yt1300_tier4", 1, -180, 180, -90, 5},
	--{"yt1300_tier5", 0, -180, 180, -90, 6},
	--{"yt1300_tier5", 1, -180, 180, -90, 6},
	--{"player_yt1300", 0, -180, 180, -90, 7},
	--{"player_yt1300", 1, -180, 180, -90, 7},
	--{"player_ywing", 1, -180, 180, -30, 10},
	--{"player_hutt_turret_ship", 1, -180, 180, -90, 7},
	--{"nebulon", 0, -90, 90, -25, 5},
	--{"nebulon", 1, -90, 90, -25, 5},
	--{"nebulon", 2, -90, 90, -25, 5},
	--{"nebulon", 3, -90, 90, -25, 5},
	--{"nebulon", 4, -90, 90, -25, 5},
	--{"nebulon", 5, -90, 90, -25, 5},
	--{"nebulon", 6, -90, 90, -25, 5},
	--{"nebulon", 7, -90, 90, -25, 5},
	--{"player_tieaggressor", 1, -120, 120, -90, 10},
	--{"tieaggressor", 1, -120, 120, -90, 10},
	--{"tieaggressor_tier1", 1, -120, 120, -90, 10},
	--{"tieaggressor_tier2", 1, -120, 120, -90, 10},
	--{"tieaggressor_tier3", 1, -120, 120, -90, 10},
	--{"tieaggressor_tier4", 1, -120, 120, -90, 10},
	--{"tieaggressor_tier5", 1, -120, 120, -90, 10},
	--{"corvette", 0, -180, 180, -90, 0},
	--{"corvette", 1, -180, 180, -90, 0},
	--{"corvette", 2, -180, 180, -90, 0},
	--{"corvette", 3, -180, 180, -90, 0},
	--{"corvette", 4, -180, 180, -90, 0},
	--{"corvette", 5, -180, 180, -90, 0},
	--{"corvette", 6, -135, 135, 0, 0},
	--{"corvette", 7, -135, 135, 0, 0},
	--{"player_decimator", 0, -180, 180, -90, 5},
	--{"player_decimator", 1, -180, 180, -90, 5},
	--{"decimator_tier1", 0, -180, 180, -90, 5},
	--{"decimator_tier1", 1, -180, 180, -90, 5},
	--{"decimator_tier2", 0, -180, 180, -90, 5},
	--{"decimator_tier2", 1, -180, 180, -90, 5},
	--{"decimator_tier3", 0, -180, 180, -90, 5},
	--{"decimator_tier3", 1, -180, 180, -90, 5},
	--{"decimator_tier4", 0, -180, 180, -90, 6},
	--{"decimator_tier4", 1, -180, 180, -90, 6},
	--{"decimator_tier5", 0, -180, 180, -90, 7},
	--{"decimator_tier5", 1, -180, 180, -90, 7},
	--{"player_ykl37r", 0, -180, 180, -90, 5},
	--{"player_ykl37r", 1, -180, 180, -90, 5},
	--{"ykl37r_tier1", 0, -180, 180, -90, 5},
	--{"ykl37r_tier1", 1, -180, 180, -90, 5},
	--{"ykl37r_tier2", 0, -180, 180, -90, 5},
	--{"ykl37r_tier2", 1, -180, 180, -90, 5},
	--{"ykl37r_tier3", 0, -180, 180, -90, 5},
	--{"ykl37r_tier3", 1, -180, 180, -90, 5},
	--{"ykl37r_tier4", 0, -180, 180, -90, 6},
	--{"ykl37r_tier4", 1, -180, 180, -90, 6},
	--{"ykl37r_tier5", 0, -180, 180, -90, 7},
	--{"ykl37r_tier5", 1, -180, 180, -90, 7},
	--{"lambdashuttle", 1, -45, 45, -45, 30},
	--{"lambdashuttle_tier1", 1, -45, 45, -45, 30},
	--{"lambdashuttle_tier2", 1, -45, 45, -45, 30},
	--{"lambdashuttle_tier3", 1, -45, 45, -45, 30},
	--{"lambdashuttle_tier4", 1, -45, 45, -45, 30},
	--{"lambdashuttle_tier5", 1, -45, 45, -45, 30},
	--{"merchant_cruiser_medium", 0, -180, 180, -30, 5},
	--{"merchant_cruiser_medium", 1, -180, 180, -30, 5},
	--{"merchant_cruiser_medium", 2, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier1", 0, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier1", 1, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier1", 2, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier2", 0, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier2", 1, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier2", 2, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier3", 0, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier3", 1, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier3", 2, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier4", 0, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier4", 1, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier4", 2, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier5", 0, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier5", 1, -180, 180, -30, 5},
	--{"merchant_cruiser_medium_tier5", 2, -180, 180, -30, 5},
	--{"imperial_gunboat", 0, -35, 55, -45, 45},
	--{"imperial_gunboat", 1, -55, 35, -45, 45},
	--{"imperial_gunboat", 2, -45, 45, -50, 30},
	{"imperial_gunboat", 3, 0, 180, -90, 0},
	{"imperial_gunboat", 4, 0, 180, -90, 0},
	--{"imperial_gunboat", 5, -115, 115, -90, 0},
	--{"imperial_gunboat_tier1", 0, -35, 55, -45, 45},
	--{"imperial_gunboat_tier1", 1, -55, 35, -45, 45},
	--{"imperial_gunboat_tier1", 2, -45, 45, -50, 30},
	{"imperial_gunboat_tier1", 3, 0, 180, -90, 0},
	{"imperial_gunboat_tier1", 4, 0, 180, -90, 0},
	--{"imperial_gunboat_tier1", 5, -115, 115, -90, 0},
	--{"imperial_gunboat_tier2", 0, -35, 55, -45, 45},
	--{"imperial_gunboat_tier2", 1, -55, 35, -45, 45},
	--{"imperial_gunboat_tier2", 2, -45, 45, -50, 30},
	{"imperial_gunboat_tier2", 3, 0, 180, -90, 0},
	{"imperial_gunboat_tier2", 4, 0, 180, -90, 0},
	--{"imperial_gunboat_tier2", 5, -115, 115, -90, 0},
	--{"imperial_gunboat_tier3", 0, -35, 55, -45, 45},
	--{"imperial_gunboat_tier3", 1, -55, 35, -45, 45},
	--{"imperial_gunboat_tier3", 2, -45, 45, -50, 30},
	{"imperial_gunboat_tier3", 3, 0, 180, -90, 0},
	{"imperial_gunboat_tier3", 4, 0, 180, -90, 0},
	--{"imperial_gunboat_tier3", 5, -115, 115, -90, 0},
	--{"imperial_gunboat_tier4", 0, -35, 55, -45, 45},
	--{"imperial_gunboat_tier4", 1, -55, 35, -45, 45},
	--{"imperial_gunboat_tier4", 2, -45, 45, -50, 30},
	{"imperial_gunboat_tier4", 3, 0, 180, -90, 0},
	{"imperial_gunboat_tier4", 4, 0, 180, -90, 0},
	--{"imperial_gunboat_tier4", 5, -115, 115, -90, 0},
	--{"imperial_gunboat_tier5", 0, -35, 55, -45, 45},
	--{"imperial_gunboat_tier5", 1, -55, 35, -45, 45},
	--{"imperial_gunboat_tier5", 2, -45, 45, -50, 30},
	{"imperial_gunboat_tier5", 3, -180, 0, -90, 0},
	{"imperial_gunboat_tier5", 4, 0, 180, -90, 0},
	--{"imperial_gunboat_tier5", 5, -115, 115, -90, 0},
	--{"rebel_gunboat", 0, -145, 145, -90, 5},
	{"rebel_gunboat", 1, -180, 180, -90, 0},
	{"rebel_gunboat", 2, -180, 180, -90, 0},
	--{"rebel_gunboat_tier1", 0, -145, 145, -90, 5},
	{"rebel_gunboat_tier1", 1, -180, 180, -90, 0},
	{"rebel_gunboat_tier1", 2, -180, 180, -90, 0},
	--{"rebel_gunboat_tier2", 0, -145, 145, -90, 5},
	{"rebel_gunboat_tier2", 1, -180, 180, -90, 0},
	{"rebel_gunboat_tier2", 2, -180, 180, -90, 0},
	--{"rebel_gunboat_tier3", 0, -145, 145, -90, 5},
	{"rebel_gunboat_tier3", 1, -180, 180, -90, 0},
	{"rebel_gunboat_tier3", 2, -180, 180, -90, 0},
	--{"rebel_gunboat_tier4", 0, -145, 145, -90, 5},
	{"rebel_gunboat_tier4", 1, -180, 180, -90, 0},
	{"rebel_gunboat_tier4", 2, -180, 180, -90, 0},
	--{"rebel_gunboat_tier5", 0, -145, 145, -90, 5},
	{"rebel_gunboat_tier5", 1, -180, 180, -90, 0},
	{"rebel_gunboat_tier5", 2, -180, 180, -90, 0},
	--{"star_destroyer", 0, -45, 45, -45, 15},
	--{"star_destroyer", 1, -45, 45, -45, 15},
	--{"star_destroyer", 2, -45, 45, -60, 30},
	--{"star_destroyer", 3, -45, 45, -60, 30},
	--{"star_destroyer", 4, -45, 45, -60, 30},
	--{"star_destroyer", 5, -45, 45, -60, 30},
	--{"star_destroyer", 6, -45, 45, -60, 30},
	--{"star_destroyer", 7, -45, 45, -60, 30},
	--{"star_destroyer", 8, -45, 45, -30, 10},
	--{"star_destroyer", 9, -45, 45, -30, 10},
	--{"star_destroyer", 10, -45, 45, -30, 10},
	--{"star_destroyer", 11, -45, 45, -30, 10},
	--{"star_destroyer", 12, -45, 45, -30, 10},
	--{"star_destroyer", 13, -45, 45, -30, 10},
	--{"star_destroyer", 14, -45, 45, -30, 10},
	--{"star_destroyer", 15, -45, 45, -30, 10},
	--{"star_destroyer", 16, -135, 30, -30, 20},
	--{"star_destroyer", 17, -30, 135, -30, 20},
	--{"star_destroyer", 18, -45, 45, -30, 20},
	--{"star_destroyer", 19, -45, 45, -30, 20},
	--{"star_destroyer", 20, -45, 45, -30, 20},
	--{"star_destroyer", 21, -45, 45, -30, 20},
	--{"star_destroyer", 22, -45, 45, -30, 20},
	--{"star_destroyer", 23, -45, 45, -30, 20},
	--{"star_destroyer", 24, -45, 45, -30, 20},
	--{"star_destroyer", 25, -45, 45, -30, 20},
	--{"star_destroyer", 26, -45, 45, -30, 20},
	--{"star_destroyer", 27, -45, 45, -30, 20},
	--{"star_destroyer", 28, -45, 45, -30, 20},
	--{"star_destroyer", 29, -45, 45, -30, 20},
	--{"star_destroyer", 30, -45, 45, -30, 20},
	--{"star_destroyer", 31, -45, 45, -30, 20},
	--{"star_destroyer", 32, -45, 45, -30, 20},
	--{"star_destroyer", 33, -45, 45, -30, 20},
	--{"star_destroyer", 34, -45, 45, -30, 20},
	--{"star_destroyer", 35, -45, 45, -30, 20},
	--{"star_destroyer", 36, -45, 45, -30, 20},
	--{"star_destroyer", 37, -45, 45, -30, 20},
	--{"star_destroyer", 38, -45, 45, -30, 20},
	--{"star_destroyer", 39, -45, 45, -30, 20},
	--{"star_destroyer", 40, -45, 45, -30, 20},
	--{"star_destroyer", 41, -90, 90, -45, 45},
	--{"star_destroyer", 42, -45, 45, -30, 20},
	--{"star_destroyer", 43, -45, 45, -30, 20},
	--{"star_destroyer", 44, -45, 45, -30, 20},
	--{"star_destroyer", 45, -45, 45, -30, 20},
	--{"star_destroyer", 46, -45, 45, -30, 20},
	--{"star_destroyer", 47, -90, 90, -45, 45},
	--{"star_destroyer", 48, -45, 45, -30, 20},
	--{"star_destroyer", 49, -45, 45, -30, 20},
	--{"star_destroyer", 50, -45, 45, -30, 20},
	--{"star_destroyer", 51, -180, 180, -90, 0},
	--{"star_destroyer", 52, -180, 180, -90, 0},
	--{"star_destroyer", 53, -180, 180, -90, 0},
	--{"star_destroyer", 54, -180, 180, -90, 0},
	--{"star_destroyer", 55, -180, 180, -90, 0},
	--{"star_destroyer", 56, -180, 180, -90, 0},
	--{"star_destroyer", 57, -120, 90, -75, 0},
	--{"star_destroyer", 58, -90, 120, -75, 0},
	--{"star_destroyer", 59, -135, 30, -75, 0},
	--{"star_destroyer", 60, -30, 135, -75, 0},
	--{"star_destroyer", 61, -90, 120, -120, 0},
	--{"star_destroyer", 62, -120, 90, -120, 0},
	--{"star_destroyer", 63, -120, 105, -135, 0},
	--{"star_destroyer", 64, -105, 120, -135, 0},
	--{"star_destroyer", 65, -45, 45, -75, 5},
	--{"star_destroyer", 66, -45, 45, -75, 5},
	--{"star_destroyer", 67, -105, 105, -90, 0},
	--{"star_destroyer", 68, -105, 105, -90, 0},
	--{"star_destroyer", 69, -30, 105, -90, 0},
	--{"star_destroyer", 70, -105, 30, -90, 0},
	--{"star_destroyer", 71, -75, 75, -45, 45},
	--{"star_destroyer", 72, -75, 75, -45, 45},
	--{"star_destroyer", 73, -75, 75, -45, 45},
	--{"star_destroyer", 74, -75, 75, -45, 45},
	--{"star_destroyer", 75, -225, 60, -90, 0},
	--{"star_destroyer", 76, -60, 225, -90, 0},
	--{"star_destroyer", 77, -135, 105, -45, 0},
	--{"star_destroyer", 78, -135, 105, -45, 0},
	--{"star_destroyer", 79, -180, 180, -90, 0},
	--{"star_destroyer", 80, -180, 180, -90, 0},
	--{"star_destroyer", 81, -180, 180, -90, 0},
	--{"star_destroyer", 82, -180, 180, -90, 0},
	--{"star_destroyer", 83, -180, 180, -90, 0},
	--{"star_destroyer", 84, -180, 180, -90, 0},
	--{"star_destroyer", 85, -180, 180, -90, 0},
	--{"star_destroyer", 86, -180, 180, -90, 0},
	--{"star_destroyer", 87, -45, 45, -75, 0},
	--{"star_destroyer", 88, -45, 45, -75, 0},
	--{"star_destroyer", 89, -45, 45, -75, 0},
	--{"star_destroyer", 90, -45, 45, -75, 0},
	--{"star_destroyer", 91, -45, 45, -75, 0},
	--{"star_destroyer", 92, -45, 45, -75, 0},
	--{"star_destroyer", 93, -90, 90, -90, 0},
	--{"star_destroyer", 94, -90, 90, -90, 0},
	--{"star_destroyer", 95, -75, 75, -45, 0},
	--{"star_destroyer", 96, -75, 75, -45, 0},
	--{"star_destroyer", 97, -105, 105, -105, 45},
	--{"star_destroyer", 98, -45, 45, -30, 20},
	--{"star_destroyer", 99, -105, 105, -135, 0},
	--{"spacestation_rebel", 0, -160, 145, -110, 0},
	--{"spacestation_rebel", 1, -145, 165, -110, 0},
	--{"spacestation_rebel", 2, -55, 165, -95, 0},
	--{"spacestation_rebel", 3, -165, 55, -95, 0},
	--{"spacestation_rebel", 4, -165, 165, -90, 0},
	--{"spacestation_rebel", 5, -75, 75, -90, 20},
	--{"spacestation_rebel", 6, -165, 165, -130, 25},
	--{"spacestation_rebel", 7, -90, 90, -90, 0},
	--{"spacestation_rebel", 8, -90, 90, -90, 0},
	--{"spacestation_rebel", 9, -165, 165, -135, 0},
	--{"spacestation_rebel", 10, -90, 90, -90, 0},
	--{"spacestation_rebel", 11, -90, 90, -90, 0},
	--{"spacestation_rebel", 12, -165, 165, -90, 25},
	--{"spacestation_rebel", 13, -160, 160, -105, 20},
	--{"spacestation_rebel", 14, -165, 165, -90, 0},
	--{"spacestation_rebel", 15, -180, 180, -90, 0},
	--{"spacestation_rebel", 16, -180, 180, -90, 0},
	--{"spacestation_rebel", 17, -135, 135, -105, 0},
	--{"spacestation_rebel", 18, -135, 155, -105, 15},
	--{"spacestation_rebel", 19, -180, 180, -90, 0},
	--{"spacestation_rebel", 20, -180, 180, -90, 0},
	--{"spacestation_rebel", 21, -180, 180, -90, 0},
	--{"spacestation_rebel", 22, -180, 180, -90, 0},
	--{"spacestation_imperial", 0, -90, 90, -80, 0},
	--{"spacestation_imperial", 1, -90, 90, -80, 0},
	--{"spacestation_imperial", 2, -105, 105, -90, 0},
	--{"spacestation_imperial", 3, -105, 105, -90, 0},
	--{"spacestation_imperial", 4, -90, 90, -90, 0},
	--{"spacestation_imperial", 5, -90, 90, -90, 0},
	--{"spacestation_imperial", 6, -90, 90, -90, 0},
	--{"spacestation_imperial", 7, -90, 90, -90, 0},
	--{"spacestation_imperial", 8, -90, 90, -80, 0},
	--{"spacestation_imperial", 9, -90, 90, -90, 0},
	--{"spacestation_imperial", 10, -90, 90, -90, 0},
	--{"spacestation_imperial", 11, -90, 90, -90, 0},
	--{"spacestation_imperial", 12, -90, 90, -90, 0},
	--{"spacestation_imperial", 13, -105, 105, -90, 0},
	--{"spacestation_imperial", 14, -105, 105, -90, 0},
	--{"spacestation_imperial", 15, -90, 90, -80, 0},
	--{"spacestation_imperial", 16, -90, 90, -80, 0},
	--{"spacestation_imperial", 17, -90, 90, -80, 0},
	--{"spacestation_imperial", 18, -90, 90, -80, 0},
	--{"spacestation_imperial", 19, -90, 90, -80, 0},
	--{"spacestation_imperial", 20, -90, 90, -80, 0},
	--{"spacestation_imperial", 21, -90, 90, -80, 0},
	--{"spacestation_imperial", 22, -90, 90, -80, 0},
	--{"spacestation_imperial", 23, -90, 90, -80, 0},
	--{"spacestation_imperial", 24, -90, 90, -100, -25},
	--{"spacestation_imperial", 25, -90, 90, -100, -25},
	--{"spacestation_imperial", 26, -90, 90, -100, -25},
	--{"spacestation_imperial", 27, -90, 90, -100, -25},
	--{"smuggler_warlord_ship_tier1", 0, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier1", 1, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier1", 2, -50, 50, -30, 90},
	--{"smuggler_warlord_ship_tier1", 3, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier2", 0, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier2", 1, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier2", 2, -50, 50, -30, 90},
	--{"smuggler_warlord_ship_tier2", 3, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier3", 0, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier3", 1, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier3", 2, -50, 50, -30, 90},
	--{"smuggler_warlord_ship_tier3", 3, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier4", 0, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier4", 1, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier4", 2, -50, 50, -30, 90},
	--{"smuggler_warlord_ship_tier4", 3, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier5", 0, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier5", 1, -180, 180, -90, 0},
	--{"smuggler_warlord_ship_tier5", 2, -50, 50, -30, 90},
	--{"smuggler_warlord_ship_tier5", 3, -180, 180, -90, 0},
}
