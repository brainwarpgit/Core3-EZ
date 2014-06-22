-- Generated by SWGEmu Spawn Tool v0.12
-- {"regionName", xCenter, yCenter, radius, tier, spawnConstant, "spawnGroup1", [...]}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

UNDEFINEDAREA       = 0x0000
SPAWNAREA           = 0x0001
NOSPAWNAREA         = 0x0002
WORLDSPAWNAREA      = 0x0010
NOBUILDZONEAREA     = 0x0100

endor_regions = {
	{"an_outpost",0,0,{1,0},UNDEFINEDAREA,1},
        {"awning_with_pillars",278,3829,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"central_desert",0,0,{1,0},UNDEFINEDAREA,1},
	{"central_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"central_peak",0,0,{1,0},UNDEFINEDAREA,1},
	{"death_watch_bunker",-4655,4330,{1,256},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"desert_one",0,0,{1,0},UNDEFINEDAREA,1},
	{"desert_two",0,0,{1,0},UNDEFINEDAREA,1},
	{"dulok_village_1",6066,-2472,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"dulok_village_2",-1206,2963,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"eastern_desert",0,0,{1,0},UNDEFINEDAREA,1},
	{"eastern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
        {"elevated_hut",-1770,-4090,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"endor_neutral_outpost",0,0,{1,0},UNDEFINEDAREA,1},
	{"endor_smuggler_outpost",0,0,{1,0},UNDEFINEDAREA,1},
        {"ewok_hut",3879,4211,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"ewok_lake_village_1",1453,-3256,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"ewok_lake_village_2",-590,-5054,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"ewok_village_tree_1",83,42,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"ewok_village_tree_2",4540,-2420,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"fersal_hills",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_five",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_four",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_one",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_six",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_three",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_two",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_bordok_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_bordok_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_desert_marauder_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_gorax_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_mantigrue_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_mantigrue_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_remmer_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_remmer_se",0,0,{1,0},UNDEFINEDAREA,1},
        {"hot_springs",2372,2182,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"hut",-1800,6023,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"huts_and_campfire",-1538,-6013,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_ruins",2318,5860,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"jiberah_plains_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"jiberah_plains_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"jiberah_plains_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"jiberah_plains_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"jiberah_plains_5",0,0,{1,0},UNDEFINEDAREA,1},
        {"jinda_ritualists_cave",-1727,121,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"korga_cave",2163,3617,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"marauder_mountain_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"marauder_mountain_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"marauder_mountain_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"marauders_stronghold",-4648,-2273,{1,200},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"medium_blurrg_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_bolma_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_bolma_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_lantern_bird_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"mertune_forest_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"mertune_forest_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"mon_teithtim_forest_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"mon_teithtim_forest_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_four",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_one",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_three",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_two",0,0,{1,0},UNDEFINEDAREA,1},
	{"noragg_place_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"northeast_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"northern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"northern_peak",0,0,{1,0},UNDEFINEDAREA,1},
	{"northwest_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"nub_shanda",0,0,{1,0},UNDEFINEDAREA,1},
	{"oniantae_hills_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"oniantae_hills_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"oniantae_hills_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"orphaned_marauder_cave",-7021,653,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"peak_four",0,0,{1,0},UNDEFINEDAREA,1},
	{"peak_one",0,0,{1,0},UNDEFINEDAREA,1},
	{"peak_three",0,0,{1,0},UNDEFINEDAREA,1},
	{"peak_two",0,0,{1,0},UNDEFINEDAREA,1},
	{"plains_four",0,0,{1,0},UNDEFINEDAREA,1},
	{"plains_one",0,0,{1,0},UNDEFINEDAREA,1},
	{"plains_three",0,0,{1,0},UNDEFINEDAREA,1},
	{"plains_two",0,0,{1,0},UNDEFINEDAREA,1},
        {"pole_with_boxes",-3653,6125,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"salma_desert_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"salma_desert_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"salma_desert_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"salma_desert_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"salma_desert_5",0,0,{1,0},UNDEFINEDAREA,1},
        {"skeleton_hut",267,-1444,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"southeast_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"southeast_peak",0,0,{1,0},UNDEFINEDAREA,1},
	{"southwest_peak",0,0,{1,0},UNDEFINEDAREA,1},
        {"stone_village",3924,5787,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"three_huts",2047,4316,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"tree_stand",-1876,-1474,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"western_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,1,"endor_world"},
	{"yawari_cliffs_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_10",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_11",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_12",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_13",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_14",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_15",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_16",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_17",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_18",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_6",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_7",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_8",0,0,{1,0},UNDEFINEDAREA,1},
	{"yawari_cliffs_9",0,0,{1,0},UNDEFINEDAREA,1},
}

endor_static_spawns = {
	{"kilnstrider",60,-3.44448,0.624999,-6.82681,331.362,9925367, "npc_imperial", "", ""},
	{"r3",60,3250.85,24,-3464.83,263.893,0, "calm", "R3-E5", ""},
	{"r3",60,-950.705,73,1542.69,331.775,0, "calm", "R3-R1", ""},
	{"r5",60,3249.85,24,-3464.83,180.771,0, "calm", "R5-J0", ""},
}

endor_badges = {
	{"badge_dulok_villlage",5921,-2514,30,88},
	{"badge_ewok_tree_villlage",4661,-2425,30,86},
	{"badge_imp_outpost",-4628,-2273,30,89},
	{"badge_lake_villlage",1454,-3272,30,87},
}
