-- Planet Region Definitions
--
-- {"regionName", x, y, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- For circle and ring, x and y are the center point
-- For rectangles, x and y are the bottom left corner. x2 and y2 (see below) are the upper right corner
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {CIRCLE, radius}
--   - Rectangle: {RECTANGLE, x2, y2}
--   - Ring: {RING, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.planet.regions")

lok_regions = {
	-- No Build Zones
	{"eastedge_lok_nobuild", 7640, -7640, {RECTANGLE, 8000, 7640}, NOBUILDZONEAREA},
	{"northedge_lok_nobuild", -8000, 7640, {RECTANGLE, 8000, 8000}, NOBUILDZONEAREA},
	{"southedge_lok_nobuild", -8000, -8000, {RECTANGLE, 7999, -7640}, NOBUILDZONEAREA},
	{"westedge_lok_nobuild", -8000, -7641, {RECTANGLE, -7641, 7640}, NOBUILDZONEAREA},

	-- Named Regions, POIs and Decor
	{"building_ruins", -226, -448, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"building_ruins_2", -2204, -4558, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"buried_at_st", -6037, 2405, {CIRCLE, 45}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"debris_1", -2591, 6187, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"debris_2", -3503, 990, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"debris_3", -3637, -2018, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"destroyed_walls", 4486, -2834, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"four_pillars_and_flagpole", -320, -3223, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"generator", 3883, -5512, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"house_ruins", 5844, 1675, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"outpost", -6162, 6206, {CIRCLE, 30}, NOSPAWNAREA},
	{"rebel_outpost", 476, 4027, {CIRCLE, 75}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"statue_and_boxes", -1051, 3560, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_tower", 3457, -375, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"tent_and_garden", -6030, -286, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_1", 946, 4634, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_2", 1065, 3156, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_3", 3828, -532, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_4", 3337, -2425, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_5", 3364, -3819, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_6", 2962, -4546, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_7", 3080, -4671, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_8", 3009, -4798, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_9", 2893, -4782, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_10", 2744, -4458, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_11", 509, -2924, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_12", -497, -624, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_13", 427, 705, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_14", 838, 2738, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_15", -19, 4059, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_16", -26, 4558, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_marathon_track_17", 275, 5073, {CIRCLE, 30}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"@lok_region_names:volcano", 2960, -4688, {CIRCLE, 531}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_sdungeon_canyon_corsairs", -3829, -3885, {CIRCLE, 167}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"lok_bloodrazor_pirate_ship", 3623, 2172, {CIRCLE, 167}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"lok_evil_droid_engineer_cave", 3321, -4910, {CIRCLE, 241}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"@lok_region_names:kedarin_highlands", 1884, -2364, {CIRCLE, 1500}, NAMEDREGION},
	{"@lok_region_names:mount_chaolt", 2944, -4640, {CIRCLE, 544}, NAMEDREGION},
	{"@lok_region_names:nym_protectorate", -3104, 3168, {RECTANGLE, 4224, 6720}, NAMEDREGION},
	{"@lok_region_names:badlands_1", -3680, -4096, {CIRCLE, 1850}, NAMEDREGION},
	{"@lok_region_names:badlands_2", -6080, -6496, {RECTANGLE, -4544, -2432}, NAMEDREGION},
	{"@lok_region_names:sulphur_hills_1", -6208, -320, {RECTANGLE, -4288, 2176}, NAMEDREGION},
	{"@lok_region_names:sulphur_hills_2", -3408, 1904, {CIRCLE, 850}, NAMEDREGION},
	{"@lok_region_names:corsair_lane", 4768, -3840, {RECTANGLE, 5984, -544}, NAMEDREGION},
	{"lok_landmark_near_ottos_base", -2090, -2642, {CIRCLE, 119}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"@lok_region_names:mosseru_hills_1", 2272, 2048, {CIRCLE, 1120}, NAMEDREGION},
	{"@lok_region_names:mosseru_hills_2", 2304, 288, {CIRCLE, 736}, NAMEDREGION},
	{"@lok_region_names:plains_of_dust_1", -1600, -5888, {RECTANGLE, 5952, -3904}, NAMEDREGION},
	{"@lok_region_names:plains_of_dust_2", -1440, -6496, {RECTANGLE, 2176, -5856}, NAMEDREGION},
	{"@lok_region_names:plains_of_dust_3", 5584, -5584, {CIRCLE, 816}, NAMEDREGION},
	{"@lok_region_names:grendin_waste_1", -2336, 768, {RECTANGLE, 448, 2944}, NAMEDREGION},
	{"@lok_region_names:grendin_waste_2", -2272, -224, {RECTANGLE, 0, 800}, NAMEDREGION},
	{"@lok_region_names:westerly", -6336, 2912, {RECTANGLE, -3136, 5440}, NAMEDREGION},
	{"lok_kimogila_town", -81, 2709, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"lok_new_cave_01", -3010, -672, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"lok_new_cave_02", -6467, 3885, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"lok_new_bunker", 902, -4193, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_rebel_commanders_base", -4784, 3552, {CIRCLE, 300}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_coa2_imperial_base", -2570, -858, {CIRCLE, 40}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_volcano_nobuild", 2928, -4632, {CIRCLE, 666}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_force_shrine_01", -3641, -6031, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_force_shrine_02", -5807, 1977, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_force_shrine_03", -2124, 5959, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_force_shrine_04", 5455, 3806, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_force_shrine_05", 4979, -5674, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_great_maze_nobuild_1", 3825, -540, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"01_Stone_debris_nobuild", -6000, 6000, {CIRCLE, 512}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"02_Metal_Debris_nobuild", -6071, 5315, {CIRCLE, 150}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"03_Stone_block_nobuild", -6436, 4858, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"04_marker_nobuild", -6907, 4506, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"05_Burning_Stones_nobuild", -6292, 4083, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"06_Old_Outpost_nobuild", -6209, 3383, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"07_Tent_Skulls_nobuild", -5000, 4500, {CIRCLE, 40}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"08_Burning_Rocks_nobuild", -4239, 2717, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"09_Stone_Mast_nobuild", -6356, 1122, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"10_graves_nobuild", -3814, 5319, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"11_graveyard_nobuild", -5692, 267, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"12_imperial_outpost_nobuild", -4490, 7408, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"13_hutnstuff_nobuild", -3465, 920, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"14_skeletons_nobuild", -2721, 4172, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"15_broken_bridge_nobuild", -2767, 2470, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"16_escape_pod_nobuild", 6057, 5149, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"17_water_feature_nobuild", 6409, 5020, {CIRCLE, 75}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"18_huts_nobuild", 2948, 3951, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"19_moisture_farm_nobuild", 2381, 2721, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"20_moisture_farm_nobuild", 6203, 913, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"21_debris_nobuild", 3897, 593, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"22_docks_nobuild", 2227, 1895, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"23_tents_nobuild", 1996, 4957, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"24_debris_nobuild", 3509, 5471, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"25_Imp_camp_nobuild", 5036, 4328, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"26_green_fire_nobuild", 5066, 410, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"27_arches_nobuild", 5056, -5136, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"28_stone_blocks_nobuild", 1816, -2243, {CIRCLE, 125}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"29_monument_nobuild", 284, -5593, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"30_palms_bones_nobuild", 4960, -2096, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"31_ruins_nobuild", 2722, -3287, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"32_gurk_king_nobuild", 717, -3391, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"33_vaporator_nobuild", 576, -2160, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"34_stone_buildings_nobuild", 3261, -1447, {CIRCLE, 38}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"35_broken_wall_nobuild", 3329, -2416, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"36_broken_wall_nobuild", 5073, -4113, {CIRCLE, 125}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"37_palms_arches_nobuild", 5531, -6005, {CIRCLE, 38}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"38_slum_house_nobuild", 1558, -6420, {CIRCLE, 75}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"39_frame_graves_nobuild", 219, -5975, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"40_monument_nobuild", 6186, -5556, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"41_atst_debris_nobuild", 6513, -2015, {CIRCLE, 40}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"42_broken_wall_nobuild", 2705, -5377, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"43_pyramids_nobuild", 3648, -4112, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"44_ruins_nobuild", 1473, -4467, {CIRCLE, 38}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"45_stone_block_nobuild", 1865, -3013, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"46_ruins_nobuild", 1990, -957, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"47_stone_frame_nobuild", 1993, -1293, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"48_ancient_skeleton_nobuild", 4568, -1168, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"49_building_nobuild", 5881, -1133, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"50_ruins_nobuild", -240, -479, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"51_awning_debris_nobuild", -3888, -4494, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"52_power_station_nobuild", -2889, -238, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"53_stone_buildings_nobuild", -4868, -1041, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"54_abandoned_homes_nobuild", 6116, -3171, {CIRCLE, 38}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"55_ruins_nobuild", -672, -2144, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"56_evil_tree_nobuild", -788, -4976, {CIRCLE, 25}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"57_arches_nobuild", -3318, -5635, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"58_broken_wall_nobuild", -4432, -5743, {CIRCLE, 100}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"59_pillars_nobuild", -5185, -4816, {CIRCLE, 75}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"60_gurk_hut_nobuild", -3764, -3468, {CIRCLE, 50}, NOSPAWNAREA + NOBUILDZONEAREA},

	-- City
	{"@lok_region_names:lok_nyms_stronghold", 436, 5120, {CIRCLE, 429}, CITY + NOSPAWNAREA},
	{"lok_nyms_stronghold_1", 285, 5117, {CIRCLE, 5}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_nyms_stronghold_2", 450, 5141, {CIRCLE, 5}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_nyms_stronghold_3", 546, 5081, {CIRCLE, 5}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_nyms_stronghold_4", 523, 4967, {CIRCLE, 5}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"lok_nyms_stronghold_nobuild_1", 436, 5120, {CIRCLE, 1000}, NOBUILDZONEAREA},
	{"@lok_region_names:lok_imperial_outpost", -1920, -3084, {CIRCLE, 201}, CITY + NOSPAWNAREA},
	{"lok_imperial_outpost_nobuild_1", -1920, -3084, {CIRCLE, 402}, NOBUILDZONEAREA},

	-- Spawn Areas
	{"@lok_region_names:central_north_medium", -3992, 990, {RECTANGLE, 2010, 3980}, SPAWNAREA, {"lok_central_north_medium"}, 448},
	{"@lok_region_names:central_south_Kimogilas_hard", 4185, 72, {CIRCLE, 165}, SPAWNAREA, {"lok_central_south_kimogilas_hard"}, 256},
	{"@lok_region_names:central_south_medium", -3992, -2000, {RECTANGLE, 2025, 990}, SPAWNAREA, {"lok_central_south_medium"}, 256},
	{"@lok_region_names:eastern_medium", 2008, -1990, {RECTANGLE, 8000, 3999}, SPAWNAREA, {"lok_eastern_medium"}, 256},
	{"@lok_region_names:easy_gurnaset_nw", -4602, -1602, {CIRCLE, 90}, SPAWNAREA, {"lok_easy_gurnaset_nw"}, 256},




	-- lok_east_sulphur_flats
	-- lok_eastern_mountains
	-- lok_hard_canyon_corsair_se
	-- lok_hard_canyon_corsair_sw
	-- lok_hard_kimogilla_nw
	-- lok_hard_kimogilla_sw
	-- lok_hard_kusak_ne
	-- lok_hard_langlatch_ne
	-- lok_hard_langlatch_se



	{"@lok_region_names:mountains_1", -8000, 5120, {RECTANGLE, 8000, 8000}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:mountains_2", -8000, -8000, {RECTANGLE, -6016, 8000}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:mountains_3", -8000, -8000, {RECTANGLE, 8000, -5696}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:mountains_4", 5352.44, -8000, {RECTANGLE, 7944.44, 8000}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:mountains_5", 5984, 448, {CIRCLE, 1216}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:river_1", -2144, 6016, {CIRCLE, 1760}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:river_2", -5120, 1792, {CIRCLE, 2464}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:river_3", 64, 288, {CIRCLE, 1920}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:river_4", 528, -6000, {CIRCLE, 1900}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:river_5", 4272, 4080, {CIRCLE, 1040}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:hills_1", -1072, 4592, {CIRCLE, 2497}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:hills_2", 5296, 4272, {CIRCLE, 2096}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:hills_3", 3936, 128, {CIRCLE, 1088}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:hills_4", -3984, -4496, {CIRCLE, 2416}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:hills_5", 5056, -5152, {CIRCLE, 1568}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_1", -5280, 4544, {CIRCLE, 2144}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_2", 2192, 4720, {CIRCLE, 1488}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_3", -192, 416, {CIRCLE, 2184}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_4", -4800, -1088, {CIRCLE, 1376}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_5", -944, -2256, {CIRCLE, 2000}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_6", 5184, -2176, {CIRCLE, 1599}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_7", -7999, -7999, {RECTANGLE, 7999, 7999}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_8", 1936, -2320, {CIRCLE, 1980}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_9", 2208, 2272, {CIRCLE, 1280}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_10", 2272, 352, {CIRCLE, 800}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_11", -5312, 928, {CIRCLE, 1568}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_12", -3232, 1984, {CIRCLE, 928}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:wasteland_13", -2416, -1008, {CIRCLE, 1008}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:hard_nym_se", 354, 5046, {CIRCLE, 296}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:medium_vesp_sw", 3703, 2274, {CIRCLE, 85}, SPAWNAREA, {"lok_world"}, 256},

	{"@lok_region_names:southwestern_hard", -7925, -7820, {RECTANGLE, -3990, -1985}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:western_medium", -7925, -1985, {RECTANGLE, -3985, 3990}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:northwestern_medium", -7925, 3991, {RECTANGLE, -1990, 7920}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:northern_easy", -1991, 3992, {RECTANGLE, 2000, 7920}, SPAWNAREA, {"lok_world"}, 256},
	{"@lok_region_names:northeastern_easy", 2008, 3990, {RECTANGLE, 7990, 7920}, SPAWNAREA, {"lok_world"}, 256},


	{"@lok_region_names:southern_hard", -3992, -7825, {RECTANGLE, 2040, -1990}, SPAWNAREA, {"lok_world"}, 256},

	{"@lok_region_names:southeastern_hard", 2041, -7820, {RECTANGLE, 8000, -1985}, SPAWNAREA, {"lok_world"}, 256},


	{"@lok_region_names:world_spawner", 0, 0, {RECTANGLE, 0, 0}, WORLDSPAWNAREA + SPAWNAREA, {"lok_world", "global_hard"}, 2048}
}
