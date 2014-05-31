-- Generated by SWGEmu Spawn Tool v0.12
-- {"regionName", xCenter, yCenter, radius, tier, spawnConstant, "spawnGroup1", [...]}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a world spawn area and imperial spawn area in the same region, but
-- a dynamic rebel spawn area that is also a no build zone is possible.

UNDEFINEDAREA       = 0x0000
WORLDSPAWNAREA      = 0x0001
REBELSPAWNAREA      = 0x0002
IMPERIALSPAWNAREA   = 0x0004
NEUTRALSPAWNAREA    = 0x0008
STATICSPAWNAREA     = 0x0010
DYNAMICSPAWNAREA    = 0x0020
LAIRSPAWNAREA       = 0x0040
NOSPAWNAREA         = 0x0100
NOBUILDZONEAREA     = 0x1000

dathomir_regions = {
	{"a_restricted_area",0,0,{1,0},UNDEFINEDAREA,1},
        {"abandoned_camp",2871,-2531,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"an_outpost",0,0,{1,0},UNDEFINEDAREA,1},
	{"asou_dankal_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"asou_dankal_2",0,0,{1,0},UNDEFINEDAREA,1},
        {"bridge",-429,4177,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"burial_site",-5261,1293,{1,25},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"campsite",-2594,4948,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"canyon",0,0,{1,0},UNDEFINEDAREA,1},
        {"ceremonial_site",1083,-4484,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"crashed_spaceship",5684,1898,{1,150},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"dathomir_survey_outpost",0,0,{1,0},UNDEFINEDAREA,1},
        {"dathomir_tarpits",791,-4630,{1,300},STATICSPAWNAREA + NOBUILDZONEAREA,1},
	{"dathomir_trade_outpost",0,0,{1,0},UNDEFINEDAREA,1},
	{"desert",0,0,{1,0},UNDEFINEDAREA,1},
        {"destroyed_imperial_base",-6460,-6724,{1,75},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"destroyed_rebel_base",-4700,-4772,{1,75},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"dry_rock_mountains_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"dry_rock_mountains_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"eastern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
        {"fenced_in_buildings",51,-154,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"fire_and_rocks",-7121,2926,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"floating_stones",1478,3516,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"floating_rocks",6866,1177,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"floating_rocks_2",-825,-5045,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"forest_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_5",0,0,{1,0},UNDEFINEDAREA,1},
        {"glowing_hut",7187,3229,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"hard_gaping_spider_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_graul_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_graul_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_malklok_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_purbole_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_purbole_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_rancor_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_reptilian_flyer_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_reptilian_flyer_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_shear_mite_ne",0,0,{1,0},UNDEFINEDAREA,1},
        {"hut",4880,3276,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"hut_2",5551,-688,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"hut_3",-3250,-6589,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_contact",-6306,-531,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"imperial_prison",-6358,930,{1,400},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"imperial_tent",-4627,5395,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"large_floating_rocks",2989,-5145,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"lesser_sarlacc_1",-2080,3143,{1,250},STATICSPAWNAREA + NOBUILDZONEAREA,1},
	{"lesser_sarlacc_2",-2080,3143,{1,80},STATICSPAWNAREA + NOSPAWNAREA,1},
	{"lhon_kinad_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"lhon_kinad_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"lhon_kinad_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"lookout",-4564,-6548,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"medium_baz_nitch_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_baz_nitch_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_6",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_7",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain_8",0,0,{1,0},UNDEFINEDAREA,1},
        {"mysterious_statue",-4149,5927,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"mysterious_statue_2",5572,-1516,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"mysterious_statue-3",-4965,-3497,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"mysterious_shrine",3093,4887,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"mysterious_shrine_2",1655,-5765,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"night_stalker_home",-2929,-1024,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"nightsister_clan",0,0,{1,0},UNDEFINEDAREA,1},
        {"nightsister_forced_labor_camp",2545,-1597,{1,250},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"nightsister_guard_camp",-4183,-847,{1,75},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"nightsister_lands",0,0,{1,0},UNDEFINEDAREA,1},
        {"nightsister_beach_tower",924,6854,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"nightsister_stronghold",-4052,-161,{1,300},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"nightsister_vs_singing_mountain_battle",-2518,1534,{1,150},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"northern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"red_hills_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"red_hills_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_arod_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_arod_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_arod_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_dun_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_dun_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_sammir_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_sammir_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_sammir_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"rhoa_yenth",0,0,{1,0},UNDEFINEDAREA,1},
        {"rock",-498,-2890,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"science_outpost",0,0,{1,0},UNDEFINEDAREA,1},
        {"shrine",1123,-1025,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"singing_mountain",536,4200,{1,250},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"singing_mountain_1",521,4716,{1,260},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"singing_mountain_2",177,4038,{1,32},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"singing_mountain_fortress",156,4523,{1,220},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"skeleton",5294,1431,{1,20},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"skeleton_and_tree",-2658,7372,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"spellweaver_and_tree",-852,2787,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_building",7485,-916,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_hut",3492,-399,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"stone_tower",-5023,3210,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"southern_desert",0,0,{1,0},UNDEFINEDAREA,1},
	{"southern_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"susk_kinad_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"susk_kinad_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"takal_nax",0,0,{1,0},UNDEFINEDAREA,1},
	{"the_great_canyon",0,0,{1,0},UNDEFINEDAREA,1},
        {"torch",-2612,-4860,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"tower_and_stones",-441,-1152,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"trade_outpost",0,0,{1,0},UNDEFINEDAREA,1},
        {"two_huts",7203,5560,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"twilight_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"vass_meindras_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"vass_meindras_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"vass_meindras_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"vass_meindras_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"vass_meindras_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"vass_meindras_6",0,0,{1,0},UNDEFINEDAREA,1},
        {"wall",7439,-3018,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"western_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"world_spawner",0,0,{1,-1},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"dathomir_world_creatures"},
	{"sarlacc_spawner",-2075,3135,{1,1250},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"dathomir_sarlacc_mutant"},
	{"tarpits_spawner",645,-4890,{1,1250},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"dathomir_sarlacc_mutant"},
        {"worship_shrine",-6949,-3034,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"yumaou_risoath",0,0,{1,0},UNDEFINEDAREA,1},
}

dathomir_static_spawns = {
	{"arnecio_ulvaw_op",60,4.06465,0.624999,2.34456,30.9406,2835570, "neutral", ""},
	{"nirame_sakute",60,-2.1912,0.624999,-6.92293,24.0649,6955369, "neutral", ""},
	{"r3",60,-78.3142,18,-1629.93,144.919,0, "calm", "R3-O0"},
	{"r4",60,620.654,6,3085.98,191.123,0, "calm", "R4-W3"},
	{"r4",60,619.822,6,3097.36,339.758,0, "calm", "R4-L1"},
	{"r4",60,-134.195,18,-1599.14,45.5678,0, "calm", "R4-J5"},
	{"r5",60,627.744,6,3086.77,278.522,0, "calm", "R5-O6"},
	{"shaki_hamachil",60,-101.049,18,-1542.62,293.515,0, "calm", "Shaki Hamachil"},
	{"shibb_nisshil",60,-71.1537,18,-1639.84,66.4233,0, "", "Shibb Nisshil"},
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
