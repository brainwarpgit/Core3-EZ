JUNKNOTSELLABLE = 0
JUNKGENERIC = 1
JUNKCLOTHESANDJEWELLERY = 2
JUNKWEAPONS = 4
JUNKARMOUR = 8
JUNKTUSKEN = 16
JUNKJEDI = 32
JUNKJAWA = 64

JUNKCONVGENERIC = 1
JUNKCONVARMS = 2
JUNKCONVFINARY = 3
JUNKCONVDENDERRORI = 4
JUNKCONVDENDERTHEED = 5
JUNKCONVLILABORVO = 6
JUNKCONVMALIKVISTAL = 7
JUNKCONVNADOWATTOS = 8
JUNKCONVNATHANTAIKE = 9
JUNKCONVOLLOBOJABBAS = 10
JUNKCONVQUICHDANTOOINE = 11
JUNKCONVREGGINYM = 12
JUNKCONVSHEANILAKE = 13
JUNKCONVSNEGVALARIAN = 14
JUNKCONVJAWAGENERIC = 15
JUNKCONVJAWAFINARY = 16
JUNKCONVJAWAARMS = 17
JUNKCONVJAWATUSKEN = 18

-- Generated by SWGEmu Spawn Tool v0.12
-- {"regionName", xCenter, yCenter, radius, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.


UNDEFINEDAREA       = 0x0000
SPAWNAREA           = 0x0001
NOSPAWNAREA         = 0x0002
WORLDSPAWNAREA      = 0x0010
NOBUILDZONEAREA     = 0x0100


tatooine_regions = {
	{"alkhara_camp",-1260,5463,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"anchorhead",0,0,{1,0},UNDEFINEDAREA},
	{"anchorhead_easy_newbie",0,-5350,{1,700},SPAWNAREA,{"tatooine_easy"},96},
	{"anchorhead_medium_newbie",0,0,{3,700,1200},SPAWNAREA,{"tatooine_medium"},160},
	{"ancient_skeleton",-4650,-4362,{1,300},NOSPAWNAREA + NOBUILDZONEAREA},
	{"arch_mesa",0,0,{1,0},UNDEFINEDAREA},
	{"arches",-845,2703,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ben_kenobis_house",-4511,-2270,{1,250},NOSPAWNAREA + NOBUILDZONEAREA},
	{"benzin_plateau_1",0,0,{1,0},UNDEFINEDAREA},
	{"benzin_plateau_2",0,0,{1,0},UNDEFINEDAREA},
	{"benzin_plateau_3",0,0,{1,0},UNDEFINEDAREA},
	{"benzin_plateau_4",0,0,{1,0},UNDEFINEDAREA},
	{"bestine",0,0,{1,0},UNDEFINEDAREA},
	{"bestine_easy_newbie",-1200,-3695,{1,1750},SPAWNAREA,{"tatooine_easy"},256},
	{"bestine_medium_newbie",0,0,{3,1750,2500},SPAWNAREA,{"tatooine_medium"},384},
	{"bowling_rocks",0,0,{1,0},UNDEFINEDAREA},
	{"bridge_and_ruins",-3980,-3048,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"broken_building_with_ruins",0,0,{1,0},UNDEFINEDAREA},
	{"broken_machinery",-4697,5457,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"broken_ruins",0,0,{1,0},UNDEFINEDAREA},
	{"broken_wall",7094,7123,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"broken_walls",3272,-3671,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"broken_walls_1",6478,-2225,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"broken_water_tanks",-4324,-5020,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"building_ruins",2974,6460,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"buried_building",-2036,2595,{1,40},NOSPAWNAREA + NOBUILDZONEAREA},
	{"buried_tower",-2112,2617,{1,40},NOSPAWNAREA + NOBUILDZONEAREA},
	{"buried_walls_and_tents",-2302,2928,{1,110},NOSPAWNAREA + NOBUILDZONEAREA},
	{"burning_bone_altar",0,0,{1,0},UNDEFINEDAREA},
        {"camp",-5472,-3883,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"camp_on_tower",0,0,{1,0},UNDEFINEDAREA},
	{"camp_with_two_tents",-3325,-3714,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
        {"containers",-2687,-4663,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"canyon_maze",0,0,{1,0},UNDEFINEDAREA},
	{"cave_central",0,0,{1,0},UNDEFINEDAREA},
	{"cave_southwest",0,0,{1,0},UNDEFINEDAREA},
	{"cave_west",0,0,{1,0},UNDEFINEDAREA},
	{"central_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"crashed_lifepod",-6174,5886,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"darklighter_estate",-644,-6758,{1,300},NOSPAWNAREA + NOBUILDZONEAREA},
	{"darklighter_estate_1",0,0,{1,0},UNDEFINEDAREA},
	{"debris",-2127,675,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"desert",0,0,{1,0},UNDEFINEDAREA},
	{"destroyed_aircraft_hanger",0,0,{1,0},UNDEFINEDAREA},
        {"destroyed_camp",-4939,-5548,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"destroyed_platform",0,0,{1,0},UNDEFINEDAREA},
	{"destroyed_wall",0,0,{1,0},UNDEFINEDAREA},
	{"e_dune_sea_1",0,0,{1,0},UNDEFINEDAREA},
	{"e_dune_sea_2",0,0,{1,0},UNDEFINEDAREA},
	{"e_dune_sea_3",0,0,{1,0},UNDEFINEDAREA},
	{"e_dune_sea_4",0,0,{1,0},UNDEFINEDAREA},
	{"eastern_dune_sea",0,0,{1,0},UNDEFINEDAREA},
	{"eastern_oasis",6263,-377,{1,125},NOSPAWNAREA + NOBUILDZONEAREA},
	{"eastern_oasis_1",0,0,{1,0},UNDEFINEDAREA},
	{"eastern_peaks",0,0,{1,0},UNDEFINEDAREA},
	{"easy_bugland_ne",0,0,{1,0},UNDEFINEDAREA},
	{"easy_criminals_se",0,0,{1,0},UNDEFINEDAREA},
	{"easy_desert_demons_sw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_militia_se",0,0,{1,0},UNDEFINEDAREA},
	{"easy_pirate_sw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_swoopers_nw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villages_2_sw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villages_ne",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villages_nw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villages_se",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villages_sw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villiages_2_sw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villiages_ne",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villiages_nw",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villiages_se",0,0,{1,0},UNDEFINEDAREA},
	{"easy_villiages_sw",0,0,{1,0},UNDEFINEDAREA},
	{"elegent_tent",0,0,{1,0},UNDEFINEDAREA},
	{"escape_pod",-3926,-4428,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
	{"field_of_pillars",-266,3724,{1,500},NOSPAWNAREA},
	{"fort_tusken",-3980,6260,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
	{"fort_tusken_1",0,0,{1,0},UNDEFINEDAREA},
	{"four_stone_blocks",3488,4124,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"gas_harvest_bank",2203,-4476,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"grand_arena",0,0,{1,0},UNDEFINEDAREA},
	{"grand_arena_flats_1",0,0,{1,0},UNDEFINEDAREA},
	{"grand_arena_flats_2",0,0,{1,0},UNDEFINEDAREA},
	{"grave_and_weeping_tree",-6195,5108,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"gravestones",4124,-4766,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"hard_alkhara_ne",0,0,{1,0},UNDEFINEDAREA},
	{"hard_bugland_ne",0,0,{1,0},UNDEFINEDAREA},
	{"hard_criminals_se",0,0,{1,0},UNDEFINEDAREA},
	{"hard_dune_sea",0,0,{1,0},UNDEFINEDAREA},
	{"hard_jabba_thug_sw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_jawa_nw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_krayt_ne",0,0,{1,0},UNDEFINEDAREA},
	{"hard_tusken_nw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_valarian_se",0,0,{1,0},UNDEFINEDAREA},
	{"hidden_x_wing",0,0,{1,0},UNDEFINEDAREA},
	{"hovel_in_the_hill",0,0,{1,0},UNDEFINEDAREA},
	{"huge_cliff_fortress",0,0,{1,0},UNDEFINEDAREA},
	{"hung_skeleton",0,0,{1,0},UNDEFINEDAREA},
	{"hunter_camp",-6889,1508,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"imperial_oasis",0,0,{1,0},UNDEFINEDAREA},
	{"imperial_oasis_1",0,0,{1,0},UNDEFINEDAREA},
	{"jabba_lowbie_zone",0,0,{1,0},UNDEFINEDAREA},
	{"jabba_palace",-6100,-6300,{1,750},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jawa_engineer_camp",5940,-3828,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jawa_mountain_fortress",0,0,{1,0},UNDEFINEDAREA},
	{"jawa_mountain_fortress_1",0,0,{1,0},UNDEFINEDAREA},
	{"jawa_sandcrawler",5774,3995,{1,75},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jawa_traders",-6112,1875,{1,150},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jedi_shrine",5633,6013,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jedi_shrine_1",6265,110,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jedi_shrine_2",5956,-5687,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"jundland_waste_1",0,0,{1,0},UNDEFINEDAREA},
	{"jundland_waste_2",0,0,{1,0},UNDEFINEDAREA},
	{"jundland_wastes",0,0,{1,0},UNDEFINEDAREA},
	{"jundland_wastes_1",0,0,{1,0},UNDEFINEDAREA},
	{"jundland_wastes_2",0,0,{1,0},UNDEFINEDAREA},
	{"junk_heap",0,0,{1,0},UNDEFINEDAREA},
	{"krayt_buried_alive",0,0,{1,0},UNDEFINEDAREA},
	{"krayt_graveyard",7508,4535,{1,500},NOSPAWNAREA + NOBUILDZONEAREA},
	{"krayt_graveyard_1",6717,4290,{1,500},NOSPAWNAREA + NOBUILDZONEAREA},
	{"krayt_remains",-5801,5408,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"krayt_skeleton",-4646,-1913,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"krayt_skeleton_1",-6206,5054,{1,40},NOSPAWNAREA + NOBUILDZONEAREA},
	{"krayt_skeleton_on_hill",-6744,3568,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"large_rock_with_camp",-818,-964,{1,150},NOSPAWNAREA + NOBUILDZONEAREA},
	{"lars_homestead",-2578,-5500,{1,250},NOSPAWNAREA + NOBUILDZONEAREA},
	{"life_pod_and_debris",-854,-1226,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"listening_post",0,0,{1,0},UNDEFINEDAREA},
	{"long_bone_spine",0,0,{1,0},UNDEFINEDAREA},
	{"long_destroyed_wall",2996,-475,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"lowland_basin",0,0,{1,0},UNDEFINEDAREA},
	{"lowland_basin_1",0,0,{1,0},UNDEFINEDAREA},
	{"makeshift_camp",-4464,5782,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
        {"maze",-3034,-5118,{1,64},NOSPAWNAREA + NOBUILDZONEAREA},
	{"medium_criminals_se",0,0,{1,0},UNDEFINEDAREA},
	{"medium_giant_worrt_nw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_jabba_thug_2_sw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_jabba_thug_sw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_jawa_nw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_kitonaks_nw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_kitonaks_se",0,0,{1,0},UNDEFINEDAREA},
	{"medium_rodians_nw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_scyks_se",0,0,{1,0},UNDEFINEDAREA},
	{"medium_scyks_sw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_slavers_ne",0,0,{1,0},UNDEFINEDAREA},
	{"medium_slavers_se",0,0,{1,0},UNDEFINEDAREA},
	{"medium_slavers_sw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_squill_sw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_swoopers_nw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_swoopers_se",0,0,{1,0},UNDEFINEDAREA},
	{"medium_tusken_sw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_valarian_ne",0,0,{1,0},UNDEFINEDAREA},
	{"medium_weequay_ne",0,0,{1,0},UNDEFINEDAREA},
	{"mesric_plateau_1",0,0,{1,0},UNDEFINEDAREA},
	{"mesric_plateau_2",0,0,{1,0},UNDEFINEDAREA},
	{"mesric_plateau_3",0,0,{1,0},UNDEFINEDAREA},
	{"mesric_plateau_4",0,0,{1,0},UNDEFINEDAREA},
	{"mesric_plateau_5",0,0,{1,0},UNDEFINEDAREA},
	{"metal_wreckage",-1484,991,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_eisley",0,0,{1,0},UNDEFINEDAREA},
	{"mos_eisley_easy_newbie",3400,-4775,{1,1750},SPAWNAREA,{"tatooine_easy"},256},
	{"mos_eisley_medium_newbie",0,0,{3,1750,2500},SPAWNAREA,{"tatooine_medium"},384},
	{"mos_entha",0,0,{1,0},UNDEFINEDAREA},
	{"mos_entha_easy_newbie",1490,3165,{1,1750},SPAWNAREA,{"tatooine_easy"},256},
	{"mos_entha_medium_newbie",0,0,{3,1750,2500},SPAWNAREA,{"tatooine_medium"},384},
	{"mos_espa",0,0,{1,0},UNDEFINEDAREA},
	{"mos_espa_circuit_track_1",1943,4792,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_2",1546,4959,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_3",1316,5434,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_4",688,5439,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_5",156,5326,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_6",-414,5090,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_7",-664,4832,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_8",-769,4340,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_9",-710,3993,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_10",81,4092,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_11",594,4284,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_12",917,3841,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_13",1333,4457,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_14",1630,4326,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_circuit_track_15",2132,4346,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mos_espa_easy_newbie",-2950,2222,{1,1750},SPAWNAREA,{"tatooine_easy"},256},
	{"mos_espa_medium_newbie",0,0,{3,1750,2500},SPAWNAREA,{"tatooine_medium"},384},
	{"mos_taike",0,0,{1,0},UNDEFINEDAREA},
	{"mos_taike_easy_newbie",3835,2350,{1,900},SPAWNAREA,{"tatooine_easy"},128},
	{"mos_taike_medium_newbie",0,0,{3,900,1500},SPAWNAREA,{"tatooine_medium"},196},
	{"mos_teike",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_high_range_1",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_high_range_2",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_high_range_3",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_high_range_4",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_high_range_5",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_high_range_6",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_highlands_1",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_highlands_2",0,0,{1,0},UNDEFINEDAREA},
	{"mospic_highlands_3",0,0,{1,0},UNDEFINEDAREA},
	{"mushroom_mesa",0,0,{1,0},UNDEFINEDAREA},
	{"northeastern_desert",0,0,{1,0},UNDEFINEDAREA},
	{"northeastern_oasis",0,0,{1,0},UNDEFINEDAREA},
	{"northern_wasteland",0,0,{1,0},UNDEFINEDAREA},
	{"northwestern_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"oasis_northeast",6663,5455,{1,60},NOSPAWNAREA + NOBUILDZONEAREA},
	{"oasis_south",-5327,2699,{1,500},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ore_harvesters",-5794,-559,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
        {"outpost_ruins",-800,-4450,{1,100},NOSPAWNAREA + NOBUILDZONEAREA},
	{"photo_bio_camp",0,0,{1,0},UNDEFINEDAREA},
	{"pile_o_rocks",-845,-1075,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"pillars_connected_at_top",-5741,-1943,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"pirate_camp",-4930,1260,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"plateau",0,0,{1,0},UNDEFINEDAREA},
	{"radar_dish",-5468,2135,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ranch_house",5004,-4700,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
	{"rancher_camp",-3172,3637,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ribcage_and_skeleton",3389,-6587,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"rock_pillars",971,5485,{1,230},NOSPAWNAREA + NOBUILDZONEAREA},
	{"rock_pillars_with_flag",-6449,2611,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"rocks_with_fire",-6113,3966,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins",-5551,-2428,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_and_bh_camp",7045,7049,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_and_camp",-4880,2948,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_and_skeleton",-5724,6481,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_of_old_building",-4776,-3015,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ruins_on_a_wall",-1631,-5588,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
        {"sandcrawler",3776,-5193,{1,75},NOSPAWNAREA + NOBUILDZONEAREA},
	{"sand_crawler_debris",5665,-5770,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"sand_swept_tanks",-6715,-5675,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"sarlacc_pit",-6176,-3353,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
	{"ship_debris",95,-5773,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"single_desert_household_with_courtyard",0,0,{1,0},UNDEFINEDAREA},
	{"single_grand_archway",0,0,{1,0},UNDEFINEDAREA},
	{"single_platform",0,0,{1,0},UNDEFINEDAREA},
	{"single_platform_messed_up_walls",0,0,{1,0},UNDEFINEDAREA},
	{"single_platform_with_messed_up_pillars",0,0,{1,0},UNDEFINEDAREA},
	{"single_platform_with_one_tall_archway",0,0,{1,0},UNDEFINEDAREA},
	{"single_platform_with_two_arches_on_top",3651,-3380,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"skeleton",-2830,6061,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"skeleton_on_pole",-4824,6530,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"skeletons",-6275,6017,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"small_camp",0,0,{1,0},UNDEFINEDAREA},
	{"small_camp_1",0,0,{1,0},UNDEFINEDAREA},
	{"small_grave_marker",1224,6030,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"small_stone_hutt",0,0,{1,0},UNDEFINEDAREA},
	{"southeastern_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"southern_oasis",0,0,{1,0},UNDEFINEDAREA},
	{"southern_reach",0,0,{1,0},UNDEFINEDAREA},
	{"southern_reach_1",0,0,{1,0},UNDEFINEDAREA},
	{"southwestern_desert",0,0,{1,0},UNDEFINEDAREA},
	{"square_frame",6526,5521,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"standing_stones",-5231,5236,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_block",6395,200,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
        {"stone_blocks",-5109,-3349,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_blocks_1",2322,3265,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_druid_circle",-3670,-1655,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_frame_and_debris",5460,2138,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_monument",-2666,-408,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_teepee",0,0,{1,0},UNDEFINEDAREA},
	{"storage_tent",-2601,-2286,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"strange_arches_lined_up",358,6565,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"strange_brick",0,0,{1,0},UNDEFINEDAREA},
	{"streetlamp",-4659,6355,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"three_short_archways_lined_up_in_a_row",1855,1464,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"three_small_buildings",-172,1926,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"trifecta_of_stones",-3734,-6813,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
        {"tusken_bunker",-1486,-195,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
        {"tusken_king",-5318,-4444,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"tusken_march",0,0,{1,0},UNDEFINEDAREA},
	{"two_desert_housings",3557,-2502,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"two_fortresses",0,0,{1,0},UNDEFINEDAREA},
	{"two_grand_archways",0,0,{1,0},UNDEFINEDAREA},
	{"two_metal_poles",-5832,3424,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"two_stone_blocks",1880,-3028,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"underground_fire",-3268,2689,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"valley_of_the_wind",0,0,{1,0},UNDEFINEDAREA},
	{"village_ruins",5695,1877,{1,200},NOSPAWNAREA + NOBUILDZONEAREA},
	{"w_dune_sea_1",0,0,{1,0},UNDEFINEDAREA},
	{"w_dune_sea_2",0,0,{1,0},UNDEFINEDAREA},
	{"w_dune_sea_3",0,0,{1,0},UNDEFINEDAREA},
	{"wayfar",0,0,{1,0},UNDEFINEDAREA},
	{"wayfar_easy_newbie",-5195,-6535,{1,600},SPAWNAREA,{"tatooine_easy"},64},
	{"wayfar_medium_newbie",0,0,{3,600,1000},SPAWNAREA,{"tatooine_medium"},128},
	{"west_dune_sea_3",0,0,{1,0},UNDEFINEDAREA},
	{"western_dune_sea_1",0,0,{1,0},UNDEFINEDAREA},
	{"western_dune_sea_2",0,0,{1,0},UNDEFINEDAREA},
	{"western_dune_sea_3",0,0,{1,0},UNDEFINEDAREA},
	{"western_oasis",0,0,{1,0},UNDEFINEDAREA},
	{"wind_harvest_complex",-7170,-2405,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"wind_harvest_unit",-2910,-6249,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,{"tatooine_world","global"},2048},
}

tatooine_static_spawns = {
	{"beissa",60,8.11982,2,34.2394,295.264,1177487, "neutral", "","stationary"},
	{"boba_fett",60,-1,3,31,322.95,1177487, "neutral", "","stationary"},
	{"bruce_mcbrain",60,7.71724,0.2,130.294,292.061,1177466, "calm", "Bruce McBrain","stationary"},
	{"businessman",60,-143.907,65,-5335.05,0,0, "conversation", "","stationary"},
	{"death_watch_herald_imperial",60,-1157.74,12,-3525.5,200.331,0, "npc_imperial", "Commander D`krn","stationary"},
	{"dim_u_preacher",300,7.19977,-0.255725,-7.74042,180.007,1153516, "conversation", "","stationary"},
	{"droopy_mccool",60,-13,2,37,26.5642,1177487, "themepark_music_3", "","stationary"},
	-- moved to theme play for jabba themepark
	--{"eight_lom",60,6.56792,0.299999,128.257,353.004,1177466, "calm", "8-LOM","stationary"},
	{"ev_9d9",60,24.47,0.2,87.86,312.305,1177479, "neutral", "EV-9D9","stationary"},
	{"gamorrean_guard",60,11.1833,1.80934,103.036,121.745,1177468, "calm", "Ortugg","stationary"},
	{"gamorrean_guard",60,-22.0577,6.69338,73.78,35.9446,1177489, "calm", "Rogua","stationary"},
	{"gamorrean_guard",60,-17.4914,6.6,84.7047,277.682,1177490, "calm", "Gartogg","stationary"},
	{"gamorrean_guard",60,9.77692,5.2153,95.8079,86.4305,1177468, "calm", "Torrug","stationary"},
	{"gamorrean_guard",60,-30.78,0.199997,82.64,89.2333,1177476, "calm", "Urgott","stationary"},
	{"gamorrean_guard",60,-3.72202,0.199998,82.5809,88.7463,1177480, "calm", "Artogg","stationary"},
	{"gamorrean_guard",60,-28.049,3,60.9459,97.3633,1177474, "calm", "Ogtur","stationary"},
	{"gamorrean_guard",60,-34.5003,3,53.421,264.308,1177481, "", "Rautog","stationary"},
	{"gamorrean_guard",60,-25,3.6,34,183.544,1177487, "calm", "Agtor","stationary"},
	{"gamorrean_guard",60,6,2,26,172.831,1177487, "calm", "Torgau","stationary"},
	{"gamorrean_guard",60,29.8974,-7.05656,52.4332,350.296,1177473, "calm", "Ugtaur","stationary"},
	{"gamorrean_guard",60,-3.66057,2,38.0037,192.562,1177487, "calm", "Gurgot","stationary"},
	{"gamorrean_guard",60,10,5.8,71,333.45,1177470, "calm", "Grogur","stationary"},
	{"giko",60,7.19977,-0.255725,-8.84042,0,1153516, "conversation", "Giko","stationary"},
	{"jabba_rancor",60,3.93472,-10.9823,45.0053,101.285,1177503, "neutral", "","stationary"},
	{"jabba_the_hutt",60,-16.65,2.81087,45,106.884,1177487, "neutral", "","stationary"},
	{"junk_jawa",0,-6228.01, 23.63, 1868.02,10,0, "", "Jawa Trader","stationary",JUNKCLOTHESANDJEWELLERY+JUNKARMOUR,JUNKCONVJAWAFINARY},
	{"junk_jawa",0,-6223.90, 23.70, 1887.03,10,0, "", "Jawa Trader","stationary",JUNKGENERIC,JUNKCONVJAWAGENERIC},
	{"junk_jawa",0, -6204.08, 23.63, 1846.91,10,0, "", "Jawa Trader","stationary",JUNKWEAPONS,JUNKCONVJAWAARMS},
	{"junk_jawa",0, -6113.37, 23.97, 1870.82,10,0, "", "Jawa Trader","stationary",JUNKTUSKEN,JUNKCONVJAWATUSKEN},
	{"junk_dealer",0,3699.2,5,-4822,92,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,129.9,52,-5400.9,-87,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,-5131.9,75,-6585,96,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,-1392,185,-3847.9,8,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,-2750.9,5,2057,132,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,1308.1,7,3085.2,1,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,3905.3,33, 2362.9,-90,0, "", "","stationary",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_nado",60,4.4,-0.5,1.3,-133,1255997, "", "Nado","stationary",JUNKGENERIC,JUNKCONVNADOWATTOS},
	{"junk_sneg",60,-1.63376,7.01,7.35289,203.569,1076943, "calm", "Sneg the Hand","stationary",JUNKWEAPONS,JUNKCONVSNEGVALARIAN},
	{"junk_nathan",60,3817.7,16.2,2340.5,0,0, "calm", "Nathan Blyskipper (a Junk Dealer)","stationary",JUNKJAWA,JUNKCONVNATHANTAIKE},
	{"le_repair_droid",60,23.67,0.2,76.43,130.65,1177479, "calm", "","stationary"},
	{"malakili",60,19,-11,42,23.355,1177502, "neutral", "Malakili","stationary"},
	{"max_rebo",60,-11,2,36,8.12929,1177487, "themepark_music_3", "","stationary"},
	{"record_keeper_planet_tatooine",300,3385.18,4.68287,-4792.87,298.466,0, "calm", "Lt Ogo (a Planet record keeper)","stationary"},
	{"noble",60,1455.33,7,3335.99,114.201,0, "calm", "","stationary"},
	{"junk_ollobo",60,-6.35875,0.199999,134.272,9.69838,1177466, "calm", "Ollobo","stationary",JUNKWEAPONS,JUNKCONVOLLOBOJABBAS},
	{"oola",60,-10,2,43,329.443,1177487, "themepark_oola", "","stationary"},
	{"pilot",60,-143.907,65,-5334.05,180.005,0, "conversation", "","stationary"},
	{"protocol_droid_3po_red",60,10.71,0.2,84.27,216.411,1177479, "calm", "","stationary"},
	{"r2",60,19.73,0.2,90.51,273.654,1177479, "calm", "R2-E7","stationary"},
	{"ra7_bug_droid",60,13.33,0.2,88.72,111.64,1177479, "calm", "","stationary"},
	{"rancher",60,6.09977,-0.255725,-7.74042,135.004,1153516, "conversation", "","stationary"},
	{"rodian_clan_captain",300,5.07127,2.6,6.65958,0,1105851, "conversation", "","stationary"},
	{"rodian_clan_warchief",300,25.1612,2.6,16.6257,360.011,1153601, "conversation", "","stationary"},
	{"salacious_crumb",60,-16.29,2.81087,42.54,86.0692,1177487, "neutral", "","stationary"},
	{"smuggler",300,-17.046,2.6,17.2264,0,1153601, "conversation", "","stationary"},
	{"sy_snootles",60,-9,2,37,350.547,1177487, "themepark_music_3", "","stationary"},
	{"trainer_imagedesigner",0,-20.9956,2.12878,73.874,90,1105854, "", "","stationary"},
}
