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
-- {"regionName", xCenter, yCenter, radius, tier, spawnConstant, "spawnGroup1", [...]}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.


UNDEFINEDAREA       = 0x0000
SPAWNAREA           = 0x0001
NOSPAWNAREA         = 0x0002
WORLDSPAWNAREA      = 0x0010
NOBUILDZONEAREA     = 0x0100

talus_regions = {
        {"aakuan_champions_cave",5928,4656,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"aakuan_tent",-3685,-550,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"ageyn_foothills",0,0,{1,0},UNDEFINEDAREA,1},
	{"an_imperial_outpost",0,0,{1,0},UNDEFINEDAREA,1},
        {"animal_skull",2118,1272,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"arch_and_torches",1467,-2672,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"at_st_wreckage",-3200,4757,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"aqualish_fishing_spot",5345,4543,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"azaki_plains_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"azaki_plains_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"azaki_plains_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"backbone",-5730,2857,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"bones",-1242,1496,{1,20},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"bones_2",-4715,1130,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"boulder",-861,1019,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"bridge",-150,325,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"bridge_and_debris",5475,1080,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"bridge_struts",-3988,979,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_at_at",-2436,-2210,{1,100},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_bridge",-4051,3660,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_droid",-2600,100,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_machinery",-4354,1540,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_probe_droid",-4803,5165,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_strut",-1635,-325,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_walls",1117,1489,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"building_ruins",5188,-1735,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"burning_rocks",4310,2560,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"bushes",-4455,4060,{1,20},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"camp",-5875,-180,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"camp_2",2337,2937,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"campsite",-2715,-2265,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"central_plains",0,0,{1,0},UNDEFINEDAREA,1},
        {"chunker_bunker",1374,1470,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"circle_of_rocks",-5673,5289,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"circle_of_rocks_2",-5100,4720,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"corsec_vs_flail_battle",3030,6100,{1,200},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"dath_tree",-60,980,{1,15},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"dath_tree_2",-701,156,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"dearic",0,0,{1,0},UNDEFINEDAREA,1},
	{"dearic_easy_newbie",432,-3008,{1,2048},SPAWNAREA,1,"talus_easy"},
	{"dearic_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
        {"debris",1709,784,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"debris_2",-1735,-2890,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"debris_3",-1010,-5090,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"debris_4",-6318,1253,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"derik_hur_highlands_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"derik_hur_highlands_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"derik_hur_highlands_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"detainment_center",4984,-6027,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"diseased_debris",-5140,3700,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"diseased_ruins",-5114,3211,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"downed_shuttle",-2400,2035,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"eastern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"eastern_plains",0,0,{1,0},UNDEFINEDAREA,1},
        {"escape_pod",-4983,5753,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"flag",-3460,1550,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"flag_and_ruins",-3800,-6500,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_5",0,0,{1,0},UNDEFINEDAREA,1},
        {"fountain",3888,3390,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"fountain_2",-3155,-925,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"grasslands",0,0,{1,0},UNDEFINEDAREA,1},
	{"grasslands_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"grasslands_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"grasslands_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"grasslands_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"grasslands_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_aakuan_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_dalyrake_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_dalyrake_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_grand_wrix_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_grand_wrix_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_guf_drolg_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_guf_drolg_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_selonian_sw",0,0,{1,0},UNDEFINEDAREA,1},
        {"hunters_tent",1118,-1765,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"hut_and_graves",-2245,900,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_house",6000,-1200,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_house_2",1721,1623,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_tower",3209,1264,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_vs_rebel_battle",-2448,3764,{1,200},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"krayt_skull",-1117,3753,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"lake_bondoma",0,0,{1,0},UNDEFINEDAREA,1},
        {"large_broken_tower",-5515,1065,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"lookout_tower",-4377,2667,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"lost_aqualish_cave",-4355,-1426,{1,200},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"lost_village_of_durbin",4200,1000,{1,200},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"machinery",-1469,1228,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"machinery_2",-4018,4623,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"makeshift_tent",86,1579,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"marker",2472,786,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"medium_devil_gulginaw_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_sludge_panther_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_wolf_kima_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_wolf_kima_nw",0,0,{1,0},UNDEFINEDAREA,1},
        {"metal_objects",-564,1269,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_6",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_7",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountains_8",0,0,{1,0},UNDEFINEDAREA,1},
	{"mudflats_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"mudflats_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"nashal",0,0,{1,0},UNDEFINEDAREA,1},
	{"nashal_easy_newbie",4352,5209,{1,2048},SPAWNAREA,1,"talus_easy"},
	{"nashal_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
	{"narshal_river_race_track_1",3787,4764,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_2",3485,4556,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_3",3042,4565,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_4",2248,5169,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_5",1839,4966,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_6",1583,5062,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_7",1499,4802,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_8",1485,4366,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_9",2248,3905,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_10",1886,3211,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_11",2448,2457,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_12",2841,2923,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_13",3670,3475,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_14",4129,3652,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_15",4511,4054,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"narshal_river_race_track_16",4529,4831,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"north_crimson_flats_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"north_crimson_flats_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"north_crimson_flats_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"northeast_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"northern_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"northern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"northwest_forest",0,0,{1,0},UNDEFINEDAREA,1},
        {"old_comms_mast",-1650,3381,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"pillar",616,1102,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"pillar_red_haze",-5100,1272,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"pillars",4972,3848,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"pillars_2",-4975,-590,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"pile_of_rocks",-2790,910,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"prairie",0,0,{1,0},UNDEFINEDAREA,1},
	{"prairie_1",0,0,{1,0},UNDEFINEDAREA,1},
        {"quarantined_building",3900,-2850,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"rebel_camp",3101,-4046,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"rebel_installation",2377,-4993,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"red_fire",-1830,1437,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ribcage",-4470,67,{1,45},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"river",0,0,{1,0},UNDEFINEDAREA,1},
        {"rocks",-6000,5952,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruins",-1396,2114,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruins_2",-1600,-540,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruins_3",-3489,3698,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruins_4",-3333,5175,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruins_5",-4758,3933,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"science_equipment",-3650,6333,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"shadowbrak_ridge",0,0,{1,0},UNDEFINEDAREA,1},
        {"skeleton_and_rocks",-3169,5734,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"skeleton_and_ruins",-3393,2500,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"skulls_and_fire",-5100,2357,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"skyspear_forest",0,0,{1,0},UNDEFINEDAREA,1},
        {"smugglers_shipment",-3444,6186,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"south_crimson_flats_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"south_crimson_flats_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"south_crimson_flats_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"southern_coast",0,0,{1,0},UNDEFINEDAREA,1},
	{"southwest_forest",0,0,{1,0},UNDEFINEDAREA,1},
        {"spring",-3231,4203,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"static_tall_tree",3642,500,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"statue",-3247,3427,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"statue_head",-5040,115,{1,45},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_arch",-5225,4600,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_arrangement",169,3407,{1,50},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_arrangement_2",-3700,4390,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_blocks",-733,2033,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"swamp",0,0,{1,0},UNDEFINEDAREA,1},
        {"table",5415,2655,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"talus_imperial_outpost",0,0,{1,0},UNDEFINEDAREA,1},
	{"talus_imperial_outpost_easy_newbie",-2186,2300,{1,1024},SPAWNAREA,1,"talus_easy"},
	{"tendin_vale",0,0,{1,0},UNDEFINEDAREA,1},
        {"three_pillars",-5697,4010,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"three_spikes",-3920,4125,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"three_stones",-1362,1060,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"three_stone_pyramid",-5400,4300,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"tie_bomber_debris",4846,-4720,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"tie_bomber_wing",-5283,5053,{1,75},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"tree_stump",-3245,4321,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"tree_with_skulls",-5477,5810,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"two_stones",-3710,2891,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"wall",2810,5583,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"walled_island",2454,2483,{1,30},NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"weapons_depot",-4935,-3112,{1,150},NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"western_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"western_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,1,"talus_world"},
	{"yitsarin_river_canyon_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_6",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_7",0,0,{1,0},UNDEFINEDAREA,1},
	{"yitsarin_river_canyon_8",0,0,{1,0},UNDEFINEDAREA,1},
}

talus_static_spawns = {
	{"agriculturalist",60,12.85,-0.894992,1.20077,360.011,3175391, "conversation", "", ""},
	{"agriculturalist",60,4119.69,2,5300.03,180.005,0, "conversation", "", ""},
	{"agriculturalist",60,4477.16,2,5155.72,0,0, "conversation", "", ""},
	{"agriculturalist",60,4446.01,2,5422.27,0,0, "conversation", "", ""},
	{"agriculturalist",60,4446.01,2,5423.27,180.005,0, "conversation", "", ""},
	{"artisan",60,4073.98,2,5272.83,0,0, "conversation", "", ""},
	{"artisan",60,2.49489,-0.894992,-5.58394,0,4265375, "conversation", "", ""},
	{"artisan",60,21.4737,-0.894997,-14.904,360.011,4265376, "conversation", "", ""},
	{"artisan",60,4376.54,2,5050.29,0,0, "conversation", "", ""},
	{"bodyguard",300,-10.227,1.00006,-2.52106,360.011,3175594, "conversation", "", ""},
	{"bodyguard",300,21.4737,-0.894997,-13.904,180.01,4265376, "conversation", "", ""},
	{"bodyguard",300,4554.99,2,5424.67,180.005,0, "conversation", "", ""},
	{"bothan_diplomat",60,9.32783,0.3,-0.595898,180.007,6255467, "conversation", "", ""},
	{"bothan_diplomat",60,4119.69,2,5299.03,0,0, "conversation", "", ""},
	{"bothan_diplomat",60,4107.57,2,5309.03,0,0, "conversation", "", ""},
	{"bothan_diplomat",60,25.8451,1.28309,-1.92994,180.018,4265423, "conversation", "", ""},
	{"bothan_diplomat",60,4379.3,1.75007,5185.72,7.1663,0, "conversation", "", ""},
	{"bothan_diplomat",60,4535.24,2,5068.78,0,0, "conversation", "", ""},
	{"bothan_information_broker",60,-2.33557,1.75,-12.7738,180.008,3175434, "conversation", "", ""},
	{"bothan_information_broker",60,11.3604,-0.894992,5.58351,180.01,4265375, "conversation", "", ""},
	{"bothan_information_broker",60,-17.2353,1.6,-13.9646,180.007,4265427, "conversation", "", ""},
	{"bounty_hunter",60,34.3579,0.105,2.70668,135.004,3175390, "conversation", "", ""},
	{"bounty_hunter",60,35.6665,0.105,2.3343,180.006,4265374, "conversation", "", ""},
	{"bounty_hunter",60,4437.59,2,5253.67,180.005,0, "conversation", "", ""},
	{"brawler",60,-2.33557,1.75,-13.8738,360.011,3175434, "conversation", "", ""},
	{"brawler",60,-10.227,1.00005,-1.42106,180.007,3175594, "conversation", "", ""},
	{"brawler",60,5.81535,0.639421,60.0653,0,4265359, "conversation", "", ""},
	{"businessman",60,-32.0259,1.63942,62.9678,180.006,3175361, "conversation", "", ""},
	{"businessman",60,35.4579,0.105,2.70668,180.005,3175390, "conversation", "", ""},
	{"businessman",60,8.22783,0.3,-0.595898,135.005,6255467, "conversation", "", ""},
	{"businessman",60,4161.59,2,5292.72,0,0, "conversation", "", ""},
	{"businessman",60,25.8451,1.28309,-3.02994,360.011,4265423, "conversation", "", ""},
	{"chassis_broker",60,-56.7086,0.974563,8.24108,43.5461,3175366, "neutral", "", ""},
	{"comm_operator",300,5.81535,0.639421,61.0653,180.005,4265359, "conversation", "", ""},
	{"commoner",60,0.904988,0.639421,56.083,180.007,3175356, "conversation", "", ""},
	{"commoner",60,25.6926,1.28309,6.24509,0,3175593, "conversation", "", ""},
	{"commoner",60,4256.4,2,5284.54,180.005,0, "conversation", "", ""},
	{"commoner",60,-17.2353,1.6,-15.0646,0,4265427, "conversation", "", ""},
	{"commoner",60,4397.73,2,5291.48,180.005,0, "conversation", "", ""},
	{"commoner_technician",60,4189.74,2,5155.9,180.005,0, "conversation", "", ""},
	{"commoner_technician",60,2.49489,-0.894992,-4.58394,179.992,4265375, "conversation", "", ""},
	{"contractor",60,-3.69,1.13306,-6,11.0003,3175382, "calm", "", ""},
	{"contractor",60,-3.69,1.13306,-6,11.0003,4265392, "calm", "", ""},
	{"entertainer",60,4073.98,2,5273.83,180.005,0, "conversation", "", ""},
	{"entertainer",60,4256.4,2,5283.54,0,0, "conversation", "", ""},
	{"entertainer",60,4292.68,9.9,5407.93,0,0, "conversation", "", ""},
	{"entertainer",60,-17.2742,1,-4.08488,360.011,4265424, "conversation", "", ""},
	{"entertainer",60,4394.07,2,5397.99,180.005,0, "conversation", "", ""},
	{"explorer",60,-62.3565,2.63942,41.5022,135.004,3175364, "conversation", "", ""},
	{"explorer",60,-2.83063,2.6,9.88899,180.005,3175570, "conversation", "", ""},
	{"explorer",60,4305.6,9.9,5364.33,0,0, "conversation", "", ""},
	{"explorer",60,25.7677,1.28309,8.41503,360.011,4265423, "conversation", "", ""},
	{"explorer",60,-16.989,1.6,10.4506,0,4265424, "conversation", "", ""},
	{"farmer",60,-32.0259,1.63942,61.8678,360.011,3175361, "conversation", "", ""},
	{"farmer",60,-1.32019,0.639422,60.6488,180.001,3175356, "conversation", "", ""},
	{"farmer",60,43.6156,0.104999,0.752079,0,3175389, "conversation", "", ""},
	{"farmer",60,-1.18159,2.25,6.74,180.013,3175434, "conversation", "", ""},
	{"farmer",60,-1.7,1,-2.5,37,4265422, "npc_sitting_chair", "", ""},
	{"farmer",60,4394.07,2,5396.99,0,0, "conversation", "", ""},
	{"fringer",300,9.32783,0.3,-1.6959,360.011,6255467, "conversation", "", ""},
	{"gambler",60,-0.186001,0.639421,56.083,135.241,3175356, "conversation", "", ""},
	{"gambler",60,-1.32019,0.639422,59.6488,0,3175356, "conversation", "", ""},
	{"gambler",60,4379.3,1.62434,5186.72,180.005,0, "conversation", "", ""},
	{"gambler",60,4516.71,2,5494.23,0,0, "conversation", "", ""},
	{"hunter",300,16.326,1.28309,10.047,180.01,4265423, "conversation", "", ""},
	{"hunter",300,4501.35,2,5438.72,0,0, "conversation", "", ""},
	{"imperial_recruiter",1,-2192,0,2269,-50,0, "", "", ""},
	{"info_broker",60,11.3604,-0.894992,4.58351,360.011,4265375, "conversation", "", ""},
	{"info_broker",60,4535.24,2,5069.78,180.005,0, "conversation", "", ""},
	{"info_broker",60,4558.42,2,5302.88,0,0, "conversation", "", ""},
	{"junk_dealer",0,183.6,6,-3065.1,87,0, "", "", "",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,4541.9,2,5278.5,-64,0, "", "", "",JUNKGENERIC,JUNKCONVGENERIC},	
	{"medic",60,-44.5373,0.105009,-20.8963,0,3175403, "conversation", "", ""},
	{"medic",60,4161.59,2,5293.72,180.005,0, "conversation", "", ""},
	{"medic",60,25.7677,1.28309,9.41503,180.008,4265423, "conversation", "", ""},
	{"medic",60,4437.59,2,5252.67,0,0, "conversation", "", ""},
	{"medic",60,4554.99,2,5423.67,0,0, "conversation", "", ""},
	{"mercenary",60,46.4105,0.639418,46.1009,180.003,3175359, "conversation", "", ""},
	{"mercenary",60,4039.56,2,5264.96,180.005,0, "conversation", "", ""},
	{"mercenary",60,15.226,1.28309,10.047,135.013,4265423, "conversation", "", ""},
	{"miner",60,3.29,1.13306,-9.58,249.007,3175386, "calm", "", ""},
	{"miner",60,21.574,1.28309,-2.39703,0,3175593, "conversation", "", ""},
	{"miner",60,21.574,1.28309,-1.29703,180.005,3175593, "conversation", "", ""},
	{"miner",60,4039.56,2,5263.96,0,0, "conversation", "", ""},
	{"miner",60,4323.72,2,5292.6,0,0, "conversation", "", ""},
	{"miner",60,-53.4306,2.63942,44.8995,360.011,4265367, "conversation", "", ""},
	{"miner",60,1.8,-4.8,0,180,4265616, "conversation", "", ""},
	{"miner",60,4501.35,2,5439.72,180.005,0, "conversation", "", ""},
	{"miner",60,3.29,1.13306,-9.58,249.007,4265396, "calm", "", ""},
	{"noble",60,-61.2565,2.63942,40.4022,0,3175364, "conversation", "", ""},
	{"noble",60,4249.5,2,5167.3,30,0, "conversation", "", ""},
	{"noble",60,4477.16,2,5156.72,180.005,0, "conversation", "", ""},
	{"pilot",60,-44.5373,0.104709,-19.7963,180.005,3175403, "conversation", "", ""},
	{"pilot",60,20.474,1.28309,-1.29703,135.003,3175593, "conversation", "", ""},
	{"pilot",60,-16.989,1.6,11.4506,179.996,4265424, "conversation", "", ""},
	{"pilot",60,4547.7,2,5094.7,86,0, "conversation", "", ""},
	{"r2",60,207.078,6,-2800.53,272.222,0, "calm", "R2-R2", ""},
	{"r2",60,504.449,6,-3026.94,180.006,0, "calm", "R2-Y2", ""},
	{"r3",60,459.915,6,-3089.68,182.021,0, "calm", "R3-U6", ""},
	{"r3",60,457.915,6,-3090.68,270.018,0, "calm", "R3-W1", ""},
	{"r3",60,664.839,6,-3061.96,180.006,0, "calm", "R3-T0", ""},
	{"r4",60,4267.23,2,5151.46,66.4568,0, "calm", "R4-M7", ""},
	{"r4",60,4531.97,2,5111.71,209.78,0, "calm", "R4-T7", ""},
	{"r5",60,411.254,6,-2862.25,208.889,0, "calm", "R5-D8", ""},
	{"r5",60,407.095,6,-3036.31,310.529,0, "calm", "R5-R2", ""},
	{"rancher",60,4107.57,2,5310.03,180.005,0, "conversation", "", ""},
	{"rancher",60,4332.89,2,5052.68,180.005,0, "conversation", "", ""},
	{"rancher",60,-5.66994,0.639423,55.6418,179.998,4265359, "conversation", "", ""},
	{"rancher",60,4550,2,5095.2,260,0, "conversation", "", ""},
	{"rancher",60,4513.66,2,5125.31,0,0, "conversation", "", ""},
	{"scientist",60,25.6926,1.28309,7.24509,180.001,3175593, "conversation", "", ""},
	{"scientist",60,4189.74,2,5154.9,0,0, "conversation", "", ""},
	{"scientist",60,4279.23,2,5156.4,0,0, "conversation", "", ""},
	{"scientist",60,1.6,-5.5,-4.8,0,4265616, "conversation", "", ""},
	{"scientist",60,4516.71,2,5495.23,180.005,0, "conversation", "", ""},
	{"scoundrel",300,0.904988,0.639421,54.983,360.011,3175356, "conversation", "", ""},
	{"scoundrel",300,12.85,-0.894992,2.30077,180.005,3175391, "conversation", "", ""},
	{"scoundrel",300,-17.2742,1.00015,-2.98488,180,4265424, "conversation", "", ""},
	{"scoundrel",300,4397.73,2,5290.48,0,0, "conversation", "", ""},
	{"slicer",60,18.5617,-0.894992,17.5882,360.011,3175393, "conversation", "", ""},
	{"slicer",60,4166,2,5102.7,305,0, "conversation", "", ""},
	{"smuggler",300,43.6156,0.104999,1.85208,180.005,3175389, "conversation", "", ""},
	{"smuggler",300,35.6665,0.105,1.2343,360.011,4265374, "conversation", "", ""},
	{"smuggler",300,4305.6,9.9,5365.33,180.005,0, "conversation", "", ""},
	{"smuggler",300,4332.89,2,5051.68,0,0, "conversation", "", ""},
	{"smuggler",300,46.424,0.639418,45.4992,0,4265362, "conversation", "", ""},
	{"vendor",60,-61.2565,2.63942,41.5022,180.005,3175364, "conversation", "", ""},
	{"vendor",60,18.5617,-0.894992,18.6882,180.006,3175393, "conversation", "", ""},
	{"vendor",60,4279.23,2,5157.4,180.005,0, "conversation", "", ""},
	{"vendor",60,-18.3353,1.6,-13.9646,135.009,4265427, "conversation", "", ""},
}

talus_badges = {
	{"badge_aqualish_cave",-4425,-1414,30,93},
	{"badge_creature_village",4300,1020,30,90},
	{"badge_imp_base",-2185,2383,30,91},
	{"badge_imp_vs_reb_battle",-2595,3724,30,92},
}
