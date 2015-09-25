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

dathomir_regions = {
	{"a_restricted_area",0,0,{1,0},UNDEFINEDAREA},
	{"abandoned_camp",2871,-2531,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"an_outpost",0,0,{1,0},UNDEFINEDAREA},
	{"asou_dankal_1",0,0,{1,0},UNDEFINEDAREA},
	{"asou_dankal_2",0,0,{1,0},UNDEFINEDAREA},
	{"bridge",-429,4177,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"burial_site",-5261,1293,{1,25},NOSPAWNAREA + NOBUILDZONEAREA},
	{"campsite",-2594,4948,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"canyon",0,0,{1,0},UNDEFINEDAREA},
	{"ceremonial_site",1083,-4484,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"coa_imperial_outpost",-6298,-524,{1,60},NOSPAWNAREA + NOBUILDZONEAREA},
	{"coa_rebel_outpost",-42,77,{1,60},NOSPAWNAREA + NOBUILDZONEAREA},
	{"crashed_spaceship",5684,1898,{1,150},NOSPAWNAREA + NOBUILDZONEAREA},
	{"dathomir_survey_outpost",0,0,{1,0},UNDEFINEDAREA},
	{"dathomir_tarpits",791,-4630,{1,300},NOBUILDZONEAREA},
	{"dathomir_trade_outpost",0,0,{1,0},UNDEFINEDAREA},
	{"desert",0,0,{1,0},UNDEFINEDAREA},
	{"destroyed_imperial_base",-6460,-6724,{1,75},NOSPAWNAREA + NOBUILDZONEAREA},
	{"destroyed_rebel_base",-4700,-4772,{1,75},NOSPAWNAREA + NOBUILDZONEAREA},
	{"dry_rock_mountains_se",0,0,{1,0},UNDEFINEDAREA},
	{"dry_rock_mountains_sw",0,0,{1,0},UNDEFINEDAREA},
	{"eastern_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"fenced_in_buildings",51,-154,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"fire_and_rocks",-7121,2926,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"floating_stones",1478,3516,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"floating_rocks",6866,1177,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"floating_rocks_2",-825,-5045,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"forest_1",0,0,{1,0},UNDEFINEDAREA},
	{"forest_2",0,0,{1,0},UNDEFINEDAREA},
	{"forest_3",0,0,{1,0},UNDEFINEDAREA},
	{"forest_4",0,0,{1,0},UNDEFINEDAREA},
	{"forest_5",0,0,{1,0},UNDEFINEDAREA},
	{"glowing_hut",7187,3229,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"hard_gaping_spider_se",0,0,{1,0},UNDEFINEDAREA},
	{"hard_graul_se",0,0,{1,0},UNDEFINEDAREA},
	{"hard_graul_sw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_malklok_se",0,0,{1,0},UNDEFINEDAREA},
	{"hard_purbole_nw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_purbole_sw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_rancor_nw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_reptilian_flyer_ne",0,0,{1,0},UNDEFINEDAREA},
	{"hard_reptilian_flyer_sw",0,0,{1,0},UNDEFINEDAREA},
	{"hard_shear_mite_ne",0,0,{1,0},UNDEFINEDAREA},
	{"hut",4880,3276,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"hut_2",5551,-688,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"hut_3",-3250,-6589,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"imperial_prison",-6358,930,{1,400},NOSPAWNAREA + NOBUILDZONEAREA},
	{"imperial_tent",-4627,5395,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"large_floating_rocks",2989,-5145,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"lesser_sarlacc_1",-2080,3143,{1,250},NOBUILDZONEAREA},
	{"lesser_sarlacc_2",-2080,3143,{1,80},NOSPAWNAREA},
	{"lhon_kinad_1",0,0,{1,0},UNDEFINEDAREA},
	{"lhon_kinad_2",0,0,{1,0},UNDEFINEDAREA},
	{"lhon_kinad_3",0,0,{1,0},UNDEFINEDAREA},
	{"life_day_home",-2578,-5519,{1,100},NOSPAWNAREA + NOBUILDZONEAREA},
	{"lookout",-4564,-6548,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"medium_baz_nitch_nw",0,0,{1,0},UNDEFINEDAREA},
	{"medium_baz_nitch_se",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_1",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_2",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_3",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_4",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_5",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_6",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_7",0,0,{1,0},UNDEFINEDAREA},
	{"mountain_8",0,0,{1,0},UNDEFINEDAREA},
	{"mysterious_statue",-4149,5927,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mysterious_statue_2",5572,-1516,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mysterious_statue_3",-4965,-3497,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mysterious_shrine",3093,4887,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"mysterious_shrine_2",1655,-5765,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"night_stalker_home",-2929,-1024,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"nightsister_clan",0,0,{1,0},UNDEFINEDAREA},
	{"nightsister_forced_labor_camp",2545,-1597,{1,250},NOSPAWNAREA + NOBUILDZONEAREA},
	{"nightsister_guard_camp",-4183,-847,{1,75},NOSPAWNAREA + NOBUILDZONEAREA},
	{"nightsister_lands",0,0,{1,0},UNDEFINEDAREA},
	{"nightsister_beach_tower",924,6854,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"nightsister_stronghold",-4052,-161,{1,300},NOSPAWNAREA + NOBUILDZONEAREA},
	{"nightsister_vs_singing_mountain_battle",-2518,1534,{1,150},NOSPAWNAREA + NOBUILDZONEAREA},
	{"northern_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"red_hills_ne",0,0,{1,0},UNDEFINEDAREA},
	{"red_hills_nw",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_arod_1",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_arod_2",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_arod_3",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_dun_1",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_dun_2",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_sammir_1",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_sammir_2",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_sammir_3",0,0,{1,0},UNDEFINEDAREA},
	{"rhoa_yenth",0,0,{1,0},UNDEFINEDAREA},
	{"rock",-498,-2890,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"science_outpost",0,0,{1,0},UNDEFINEDAREA},
	{"shrine",1123,-1025,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"singing_mountain",536,4200,{1,250},NOSPAWNAREA + NOBUILDZONEAREA},
	{"singing_mountain_1",521,4716,{1,260},NOSPAWNAREA + NOBUILDZONEAREA},
	{"singing_mountain_2",177,4038,{1,32},NOSPAWNAREA + NOBUILDZONEAREA},
	{"singing_mountain_fortress",156,4523,{1,220},NOSPAWNAREA + NOBUILDZONEAREA},
	{"skeleton",5294,1431,{1,20},NOSPAWNAREA + NOBUILDZONEAREA},
	{"skeleton_and_tree",-2658,7372,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"spellweaver_and_tree",-852,2787,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_building",7485,-916,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_hut",3492,-399,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"stone_tower",-5023,3210,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"southern_desert",0,0,{1,0},UNDEFINEDAREA},
	{"southern_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"susk_kinad_1",0,0,{1,0},UNDEFINEDAREA},
	{"susk_kinad_2",0,0,{1,0},UNDEFINEDAREA},
	{"takal_nax",0,0,{1,0},UNDEFINEDAREA},
	{"the_great_canyon",0,0,{1,0},UNDEFINEDAREA},
	{"torch",-2612,-4860,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"tower_and_stones",-441,-1152,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"trade_outpost",0,0,{1,0},UNDEFINEDAREA},
	{"two_huts",7203,5560,{1,50},NOSPAWNAREA + NOBUILDZONEAREA},
	{"twilight_forest",0,0,{1,0},UNDEFINEDAREA},
	{"vass_meindras_1",0,0,{1,0},UNDEFINEDAREA},
	{"vass_meindras_2",0,0,{1,0},UNDEFINEDAREA},
	{"vass_meindras_3",0,0,{1,0},UNDEFINEDAREA},
	{"vass_meindras_4",0,0,{1,0},UNDEFINEDAREA},
	{"vass_meindras_5",0,0,{1,0},UNDEFINEDAREA},
	{"vass_meindras_6",0,0,{1,0},UNDEFINEDAREA},
	{"wall",7439,-3018,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"western_mountains",0,0,{1,0},UNDEFINEDAREA},
	{"world_spawner",0,0,{1,-1},SPAWNAREA + WORLDSPAWNAREA,{"dathomir_world","global_hard"},2048},
	--{"sarlacc_spawner",-2075,3135,{1,1250},SPAWNAREA,{"dathomir_sarlacc_mutant"},256},
	--{"tarpits_spawner",645,-4890,{1,1250},SPAWNAREA,{"dathomir_sarlacc_mutant"},256},
	{"worship_shrine",-6949,-3034,{1,30},NOSPAWNAREA + NOBUILDZONEAREA},
	{"yumaou_risoath",0,0,{1,0},UNDEFINEDAREA},
}

dathomir_static_spawns = {
	{"r3",60,-78.3142,18,-1629.93,144.919,0, "calm", "R3-O0", "stationary"},
	{"r4",60,620.654,6,3085.98,191.123,0, "calm", "R4-W3", "stationary"},
	{"r4",60,619.822,6,3097.36,339.758,0, "calm", "R4-L1", "stationary"},
	{"r4",60,-134.195,18,-1599.14,45.5678,0, "calm", "R4-J5", "stationary"},
	{"r5",60,627.744,6,3086.77,278.522,0, "calm", "R5-O6", "stationary"},

}

dathomir_badges = {
	{"badge_crashed_ship",5676,1901,30,82},
	{"badge_escape_pod",-4427,586,30,27},
	{"badge_imperial_prison",-6141,973,30,83},
	{"badge_misty_falls_1",3558,1554,30,28},
	{"badge_misty_falls_2",3021,1289,30,29},
	{"badge_sarlacc",-2101,3165,30,26},
	{"badge_tarpit",652,-4888,30,25},
}
