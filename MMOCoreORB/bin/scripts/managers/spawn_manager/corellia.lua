JUNKNOTSELLABLE = 0
JUNKGENERIC = 1
JUNKCLOTHESANDJEWELLERY = 2
JUNKWEAPONS = 4
JUNKARMOUR = 8
JUNKTUSKEN = 16
JUNKJEDI = 32
JUNKJAWA = 64
JUNKGUNGAN = 128
JUNKCORSEC = 256

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

corellia_regions = {
        {"abandoned_campsite",6050,6400,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"abandoned_settlement",-5170,6227,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"afarathu_cave",-2626,2968,{1,150},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"agrilat_swamp",0,0,{1,0},UNDEFINEDAREA,1},
	{"agrilat_swamp_1",0,0,{1,0},UNDEFINEDAREA,1},
        {"archway",4853,-2663,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"archway_2",4827,-2637,{1,75},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"beach1",0,0,{1,0},UNDEFINEDAREA,1},
	{"beach2",0,0,{1,0},UNDEFINEDAREA,1},
	{"beach3",0,0,{1,0},UNDEFINEDAREA,1},
	{"beach4",0,0,{1,0},UNDEFINEDAREA,1},
        {"beach_awnings",-6152,-3390,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"bela_vistal",0,0,{1,0},UNDEFINEDAREA,1},
	{"bela_vistal_easy_newbie",6750,-5740,{1,2048},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_starter_creatures"},
	{"bela_vistal_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
	{"bindreg_hills_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"bindreg_hills_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"bindreg_hills_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"blocks",-375,6075,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"blocks_2",2520,5970,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"blocks_3",2387,670,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_bridge",-4275,3650,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"broken_ore_extractor",170,1720,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"buried_arches",2922,1600,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"central_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"corellia_mountain_fortress",0,0,{1,0},UNDEFINEDAREA,1},
	{"corellia_pvp",0,0,{1,0},UNDEFINEDAREA,1},
	{"corellia_rebel_riverside_fort",0,0,{1,0},UNDEFINEDAREA,1},
	{"coronet_easy_newbie",-230,-4460,{1,2560},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_starter_creatures"},
	{"coronet",0,0,{1,0},UNDEFINEDAREA,1},
	{"coronet_medium_newbie",58,-4392,{1,512},LAIRSPAWNAREA,1,"coro_newbie"},
        {"crystal_arch_hall",-6831,2200,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"daoba_guerfel",0,0,{1,0},UNDEFINEDAREA,1},
	{"denendre_valley_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"denendre_valley_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"denendre_valley_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"denendre_valley_4",0,0,{1,0},UNDEFINEDAREA,1},
        {"destroyed_outpost",1877,-236,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"doaba_guefel_easy_newbie",3210,5360,{1,2560},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_starter_creatures"},
	{"doaba_guefel_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
	{"doaba_guerfel",0,0,{1,0},UNDEFINEDAREA,1},
        {"drall_patriots_cave",937,4106,{1,150},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"dregans_pike",0,0,{1,0},UNDEFINEDAREA,1},
	{"east_sea_coast",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest1",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest2",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest3",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest4",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest5",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"forest_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"garden_monument",4254,-163,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"gated_area",1699,-2171,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"geyser",4875,6685,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"golden_beaches_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_6",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_7",0,0,{1,0},UNDEFINEDAREA,1},
	{"golden_beaches_8",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland1",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland2",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland3",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland4",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland5",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland6",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland7",0,0,{1,0},UNDEFINEDAREA,1},
	{"grassland8",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_crimson_sand_panther_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_greater_gulginaw_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_gronda_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_gronda_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_gronda_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_gulginaw_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"hard_gulginaw_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"kor_vella",0,0,{1,0},UNDEFINEDAREA,1},
	{"kor_vella_easy_newbie",-3390,3024,{1,2560},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_starter_creatures"},
	{"kor_vella_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
	{"lake1",0,0,{1,0},UNDEFINEDAREA,1},
	{"lake2",0,0,{1,0},UNDEFINEDAREA,1},
	{"lake3",0,0,{1,0},UNDEFINEDAREA,1},
        {"large_broken_tower",4990,2890,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"listening_post",-1450,1990,{1,35},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"loch_khaxus",0,0,{1,0},UNDEFINEDAREA,1},
        {"long_wall",2550,4740,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"lord_nyax_cult",1359,-326,{1,150},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"malal_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_dire_cat_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_dire_cat_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_murra_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_murra_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_plumed_rasp_ne",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_sand_panther_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_slice_hound_nw",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_slice_hound_se",0,0,{1,0},UNDEFINEDAREA,1},
	{"medium_slice_hound_sw",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain1",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain2",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain3",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain4",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain5",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain6",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain7",0,0,{1,0},UNDEFINEDAREA,1},
	{"mountain8",0,0,{1,0},UNDEFINEDAREA,1},
        {"monument",740,2510,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"monument_2",-7165,135,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"mysterious_shrine",-2385,6390,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"mysterious_shrine_2",6300,6685,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"north_central_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"northeast_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"northwest_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"northwest_mountain_peak",0,0,{1,0},UNDEFINEDAREA,1},
	{"northwest_mountains",0,0,{1,0},UNDEFINEDAREA,1},
	{"northwest_plains",0,0,{1,0},UNDEFINEDAREA,1},
        {"power_generator",-3611,-375,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"power_plant",643,-435,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"rebel_hideout",-6530,5967,{1,300},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"rebel_outpost",4112,-1267,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"rhalers_bastion",0,0,{1,0},UNDEFINEDAREA,1},
	{"rier_let",0,0,{1,0},UNDEFINEDAREA,1},
	{"rier_vem",0,0,{1,0},UNDEFINEDAREA,1},
	{"riverlands_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"riverlands_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"riverlands_3",0,0,{1,0},UNDEFINEDAREA,1},
	{"riverlands_4",0,0,{1,0},UNDEFINEDAREA,1},
	{"riverlands_5",0,0,{1,0},UNDEFINEDAREA,1},
	{"riverlands_6",0,0,{1,0},UNDEFINEDAREA,1},
	{"rogue_corsec_base",5210,1590,{1,300},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruined_guard_tower",-5900,4670,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
        {"ruined_military_installation",-5330,220,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"southeast_mountain_peak",0,0,{1,0},UNDEFINEDAREA,1},
	{"southeast_mountain_range",0,0,{1,0},UNDEFINEDAREA,1},
	{"southeast_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"southwest_forest",0,0,{1,0},UNDEFINEDAREA,1},
        {"steam_geyser",4520,4329,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"stronghold",4664,-5781,{1,220},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"suntir_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"swamp1",0,0,{1,0},UNDEFINEDAREA,1},
	{"thaos_mountains_1",0,0,{1,0},UNDEFINEDAREA,1},
	{"thaos_mountains_2",0,0,{1,0},UNDEFINEDAREA,1},
	{"thaos_mountains_3",0,0,{1,0},UNDEFINEDAREA,1},
        {"three_walls",1906,-3602,{1,30},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"tyrena",0,0,{1,0},UNDEFINEDAREA,1},
	{"tyrena_easy_newbie",-5236,-2553,{1,2560},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_starter_creatures"},
	{"tyrena_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
	{"vreni_island",0,0,{1,0},UNDEFINEDAREA,1},
	{"vreni_island_easy_newbie",-5405,-6230,{1,2560},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_starter_creatures"},
	{"vreni_island_medium_newbie",0,0,{1,0},UNDEFINEDAREA,1},
        {"wind_farm",6270,4395,{1,50},STATICSPAWNAREA + NOSPAWNAREA + NOBUILDZONEAREA,1},
	{"western_mountain_forest",0,0,{1,0},UNDEFINEDAREA,1},
	{"western_plains",0,0,{1,0},UNDEFINEDAREA,1},
	{"world_spawner",0,0,{1,-1},LAIRSPAWNAREA + WORLDSPAWNAREA,1,"corellia_world_creatures"},
}

corellia_static_spawns = {
	{"acun_solari",60,19.8219,-0.894996,-19.5533,0,2625356, "calm", "Acun Solari"},
	{"adar",60,-5448.03,21,-2674.92,253.163,0, "calm", "Adar Tallon"},
	{"artisan",60,17.2826,1.28309,-11.8404,179.994,1855549, "conversation", ""},
	{"artisan",60,21.5803,14.26,-7.84205,180.006,1855541, "conversation", ""},
	{"artisan",60,2.65839,2.6,4.15034,180.003,2365434, "conversation", ""},
	{"artisan",60,-5537.5,21,-2614.06,180.005,0, "conversation", ""},
	{"artisan",60,-5596.05,21,-2761.83,180.005,0, "conversation", ""},
	{"artisan",60,-8.04223,-0.894908,-17.7225,360.011,2625360, "conversation", ""},
	{"artisan",60,-0.629707,2.6,3.43132,180.013,4395401, "conversation", ""},
	{"artisan",60,-1.72179,0.6,-4.05766,360.011,4395396, "conversation", ""},
	{"artisan",60,-20.4229,2.12878,65.9439,180.013,4395404, "conversation", ""},
	{"bartender",60,8.6,-0.9,0.6,90,2625355, "neutral", ""},
	{"bartender",60,-4.00542,-0.894992,-2.41,166.23,3075429, "neutral", ""},
	{"bartender",60,8.54,-0.894992,0.14,87.0026,3375355, "neutral", ""},
	{"bodyguard",60,-9.42234,1.75,-18.7259,180.005,1855484, "conversation", ""},
	{"bodyguard",60,3.61201,-0.894992,-8.73417,135.006,8105496, "conversation", ""},
	{"bodyguard",60,2.80432,-0.894991,10.6543,180.012,8105496, "conversation", ""},
	{"bodyguard",60,24.3471,1.28309,10.0336,180.007,1855549, "conversation", ""},
	{"bodyguard",60,1.29504,1.75,-19.8672,180.011,1935477, "conversation", ""},
	{"bodyguard",60,-5537.5,21,-2615.06,0,0, "conversation", ""},
	{"bodyguard",60,-23.3263,1.59523,3.86229,0.250236,1935824, "conversation", ""},
	{"bodyguard",60,-62.089,2.63942,41.8477,179.999,1935695, "conversation", ""},
	{"bodyguard",60,31.7104,0.639212,63.2998,354.769,1935688, "conversation", ""},
	{"bodyguard",60,-20.4229,2.12878,64.9439,0,4395404, "conversation", ""},
	{"bothan_diplomat",60,5.22842,0.3,2.91677,0,1855463, "conversation", ""},
	{"bothan_diplomat",60,56.669,-0.521137,33.7689,180.017,1855678, "conversation", ""},
	{"bothan_diplomat",60,-5146.7,21,-2548.18,0,0, "conversation", ""},
	{"bothan_diplomat",60,15.7701,1.28309,-9.57401,360.011,1935823, "conversation", ""},
	{"bothan_diplomat",60,-5009.39,28.1,-2497.19,0,0, "conversation", ""},
	{"bothan_diplomat",60,-42.098,0.105009,-23.0786,180.012,3075441, "conversation", ""},
	{"bothan_diplomat",60,36.7068,0.639417,40.446,180.001,9665359, "conversation", ""},
	{"bothan_information_broker",60,5.22842,0.3,4.01677,180.005,1855463, "conversation", ""},
	{"bothan_information_broker",60,5.43518,2.27819,-27.0615,344.925,1855463, "conversation", ""},
	{"bothan_information_broker",60,22.2962,0.688613,43.2884,180.006,2365397, "conversation", ""},
	{"bothan_information_broker",60,-14.2562,2.4869,23.6983,5.24379,2365434, "conversation", ""},
	{"bothan_information_broker",60,-5398.52,21,-2676.03,0,0, "conversation", ""},
	{"bothan_information_broker",60,3202.28,290,4989.06,180.005,0, "conversation", ""},
	{"bothan_information_broker",60,-3.23192,0.184067,-5.20004,360.011,4345354, "conversation", ""},
	{"bothan_information_broker",60,-1.72179,0.6,-2.95766,180.016,4395396, "conversation", ""},
	{"bothan_information_broker",60,-23.9134,0.6,-4.15254,360.011,4395397, "conversation", ""},
	{"bothan_information_broker",60,-5.46842,-0.894996,21.9012,180.003,3375361, "conversation", ""},
	{"bounty_hunter",60,17.1745,1.28309,-13.1361,0,3075367, "conversation", ""},
	{"bounty_hunter",60,-42.098,0.105009,-24.1786,0,3075441, "conversation", ""},
	{"bounty_hunter",60,21.6023,-0.894996,-18.5913,360.011,3375356, "conversation", ""},
	--{"brantlee_spondoon",60,-24.7,1.3,-0.5,124,1855463, "calm", ""},
	{"brawler",60,16.2045,2.25,19.3968,135.003,1855477, "conversation", ""},
	{"brawler",60,-1.72746,7.9,-32.175,0,1855463, "conversation", ""},
	{"brawler",60,-5000.34,28.1,-2521.71,45.0013,0, "conversation", ""},
	{"brawler",60,24.4668,0.26,4.56238,180.004,1935831, "conversation", ""},
	{"brawler",60,-4.68154,0.639424,60.9856,180.005,9665356, "conversation", ""},
	{"businessman",60,-7.91375,-0.894992,-4.88587,179.995,8105496, "conversation", ""},
	{"businessman",60,37.1168,1.29422,-3.41488,180.005,1855470, "conversation", ""},
	{"businessman",60,-6.12488,2.6,13.0431,0,2365397, "conversation", ""},
	{"businessman",60,17.3056,1.28309,-7.47174,0,1935527, "conversation", ""},
	{"businessman",60,23.1824,1.28309,8.37019,0,1935527, "conversation", ""},
	{"businessman",60,-6.56842,-0.894996,21.9012,135.001,3375361, "conversation", ""},
	{"chassis_broker",60,-56.6393,0.974563,8.33815,26.9298,1935697, "neutral", ""},
	{"chassis_broker",60,-56.6993,0.974563,8.57384,27.5028,9665366, "neutral", ""},
	{"coa2_rebel_coordinator",60,94.8749,28,-4519.08,121.279,0, "calm", ""},
	{"coa2_rebel_coordinator",60,-5218.4,21,-2602.17,331.695,0, "calm", ""},
	{"coa3_information_rebel",60,14.1936,1.13306,-8.97227,335.228,1935453, "calm", ""},
	{"coa3_tactical_rebel",60,9.53575,1.13306,0.330446,310.824,1935441, "calm", ""},
	{"comm_operator",60,-5467.56,21,-2792.59,0,0, "conversation", ""},
	{"comm_operator",60,-42.3991,0.105009,-24.3411,360.011,3375367, "conversation", ""},
	{"commoner",60,-202.143,28,-4504.32,203.539,0, "calm", "CorSec Agent"},
	{"commoner",60,-24,1.6,-4,160,1855554, "calm", "Pex (an elite storyteller vendor)"},
	{"commoner",60,2.56172,0.6,-2.64185,135,2365392, "conversation", ""},
	{"commoner",60,-51.7918,28,-4662.65,360.011,0, "calm", "Hunter Javeezo"},
	{"commoner",60,-24,1.6,-4,124.701,3005676, "calm", "An Event Promoter"},
	{"commoner",60,-15.1386,2.25,17.5614,270.01,1935472, "conversation", ""},
	{"commoner",60,-17.1386,2.25,17.5614,90.0005,1935472, "conversation", ""},
	{"commoner",60,-16.9721,1,-4.12621,360.011,1935528, "conversation", ""},
	{"commoner",60,-24,1.6,-4,354.16,1935532, "calm", "Pex (an elite storyteller vendor)"},
	{"commoner",60,-26.4983,-0.519991,10.8543,179.992,2625365, "conversation", ""},
	{"commoner",60,-5192.9,21,-2545.55,46.5164,0, "calm", "Excited Journalist"},
	{"commoner",60,-12.4312,1.6,-16.4443,270.002,1935827, "conversation", ""},
	{"commoner",60,-14.4312,1.6,-16.4443,89.9986,1935827, "conversation", ""},
	{"commoner",60,-24,1.6,-4,337.557,1935828, "calm", "Pex (an elite storyteller vendor)"},
	{"commoner",60,-5146.7,21,-2547.18,180.005,0, "conversation", ""},
	{"commoner",60,15.2091,0.639422,56.8933,284.328,1935687, "calm", "Amarent Loren"},
	{"commoner",60,-24,1.6,-4,246.374,3075372, "calm", "An Event Promoter"},
	{"commoner",60,5.6169,-0.894992,20.9629,256.55,3075433, "calm", "Zakarisz Ghent"},
	{"commoner",60,25.4426,0.655075,43.6577,180.006,4395401, "conversation", ""},
	{"commoner",60,-42.3991,0.105009,-23.2411,180.016,3375367, "conversation", ""},
	{"corellia_herald_01",60,-5418.26,20.9986,-2792.36,59.9118,0, "calm", "Lock Vlash"},
	{"corellia_times_investigator",60,7.44572,1.00001,-8.00652,0,1855548, "conversation", ""},
	{"corellia_times_investigator",60,21.5803,14.26,-8.84205,360.011,1855541, "conversation", ""},
	{"corellia_times_investigator",60,-5568.35,21,-2664.99,0,0, "conversation", ""},
	{"corellia_times_investigator",60,-5491.88,30.0036,-2809.63,0,0, "conversation", ""},
	{"corellia_times_investigator",60,31.6347,0.63915,64.1249,174.754,1935688, "conversation", ""},
	{"corellia_times_investigator",60,-4.31306,0.999956,6.26959,180,3075366, "conversation", ""}, 
	{"corsec_agent",60,-10.5223,1.75,-18.7259,134.999,1855484, "conversation", ""},
	{"corsec_agent",60,-0.332123,0.3,-2.90219,134.998,1855463, "conversation", ""},
	{"corsec_agent",60,7.44572,1.00001,-6.90652,179.997,1855548, "conversation", ""},
	{"corsec_agent",60,-8.04223,-0.894941,-16.6225,180.002,2625360, "conversation", ""},
	{"corsec_agent",60,57.1873,-0.521137,36.2187,180.007,1935690, "conversation", ""},
	{"corsec_cadet",60,17.3045,2.25,19.3968,180.006,1855477, "conversation", ""},
	{"corsec_cadet",60,37.163,0.639417,40.7061,180.01,1855678, "conversation", ""},
	{"corsec_chief",60,15.7701,1.28309,-8.57401,180.007,1935823, "conversation", ""},
	{"corsec_chief",60,-5000.34,28.1,-2520.6,135.004,0, "conversation", ""},
	{"corsec_chief",60,3154.04,300,5173.07,180.005,0, "conversation", ""},
	{"corsec_commissioner",60,22.2962,0.788717,42.1976,5.2426,2365397, "conversation", ""},
	{"corsec_commissioner",60,-26.4983,-0.519991,9.85428,360.011,2625365, "conversation", ""},
	{"corsec_commissioner",60,7.8197,1.00001,-5.9104,180.001,3075366, "conversation", ""},
	{"corsec_commissioner",60,21.878,-0.894997,-15.7126,0,3075430, "conversation", ""},
	{"corsec_commissioner",60,-4.68154,0.639424,59.8856,360.011,9665356, "conversation", ""},
	{"corsec_deserter",60,-19.1229,9,14.3195,135.007,1935472, "conversation", ""},
	{"corsec_deserter",60,-5467.56,21,-2791.59,180.005,0, "conversation", ""},
	{"corsec_deserter",60,-5.41306,0.999953,6.26959,134.998,3075366, "conversation", ""},
	{"corsec_detective",60,-20.2743,3.22324,22.781,180.005,1855468, "conversation", ""},
	{"corsec_detective",60,-18.0229,9,14.3195,180.008,1935472, "conversation", ""},
	{"corsec_detective",60,-4999.24,28.1,-2520.6,180.005,0, "conversation", ""},
	{"corsec_detective",60,-1.85381,0.639422,56.3013,180.012,1935687, "conversation", ""},
	{"corsec_inspector_sergeant",60,-5061.36,21,-2532.53,0,0, "conversation", ""},
	{"corsec_investigator",60,17.3056,1.28309,-6.37174,180.003,1935527, "conversation", ""},
	{"corsec_investigator",60,-5491.88,30.0036,-2808.63,180.005,0, "conversation", ""},
	{"corsec_investigator",60,-5159.41,21,-2569.03,0,0, "conversation", ""},
	{"corsec_investigator",60,17.1745,1.28309,-12.0361,179.995,3075367, "conversation", ""},
	{"corsec_investigator",60,40.8822,0.104999,2.22818,0,3075427, "conversation", ""},
	{"corsec_lieutenant",60,21.8079,3.22324,25.517,360.011,1855469, "conversation", ""},
	{"corsec_major",60,-7.91375,-0.894992,-5.88587,0,8105496, "conversation", ""},
	{"corsec_major",60,5.33572,2.12878,71.6096,0,2365436, "conversation", ""},
	{"corsec_major",60,-5010.49,28.1,-2496.09,135.004,0, "conversation", ""},
	{"corsec_master_sergeant",60,-1.85381,0.639422,55.3013,360.011,1935687, "conversation", ""},
	{"corsec_master_sergeant",60,3300.28,308,5496.49,180.005,0, "conversation", ""},
	{"corsec_master_sergeant",60,-14.8394,2.41844,24.4443,5.24424,4395401, "conversation", ""},
	{"corsec_rogue",60,4.71201,-0.894992,-8.73417,180.01,8105496, "conversation", ""},
	{"corsec_rogue",60,-16.9721,1.00014,-3.02621,180.01,1935528, "conversation", ""},
	{"corsec_rogue",60,-5059.06,21,-2399.08,180.005,0, "conversation", ""},
	{"corsec_rogue",60,7.8197,1.00001,-7.0104,0,3075366, "conversation", ""},
	{"corsec_sergeant",60,24.3471,1.28309,8.93357,360.011,1855549, "conversation", ""},
	{"corsec_sergeant",60,-5410.17,20.9418,-2789.21,215.169,0, "calm", ""},
	{"corsec_sergeant",60,29.3506,13.25,10.8359,180.011,1935841, "conversation", ""},
	{"corsec_sergeant",60,3154.04,300,5172.07,0,0, "conversation", ""},
	{"corsec_sergeant",60,-3.23192,0.184067,-4.20004,180.012,4345354, "conversation", ""},
	{"corsec_sergeant",60,8.35364,-0.894992,6.38149,360.011,3075429, "conversation", ""},
	{"corsec_trooper",60,-5061.36,21,-2531.53,180.005,0, "conversation", ""},
	{"corsec_trooper",60,57.1873,-0.521137,35.1187,360.011,1935690, "conversation", ""},
	{"corsec_trooper",60,-5.68393,7.26,0.077741,180.455,1935837, "conversation", ""},
	{"corsec_trooper",60,3.96145,2.12878,75.4149,0,4395403, "conversation", ""},
	{"crackdown_comm_operator",60,3308,308,5485.8,45,0, "npc_imperial", ""},
	{"crackdown_command_security_guard",60,-175.887,28,-4765.95,86.2823,0, "npc_imperial", ""},
	{"crackdown_dark_trooper",400,141.3,28,-4540.1,138,0, "npc_imperial", ""},
	{"crackdown_dark_trooper",400,-5347.92,21.0054,-2440.31,351.468,0, "npc_imperial", ""},
	{"crackdown_dark_trooper",400,3173.3,300,5302.5,-155,0, "npc_imperial", ""},
	{"crackdown_elite_dark_trooper",400,-175.3,28,-4837.9,-179,0, "npc_imperial", ""},
	{"crackdown_elite_dark_trooper",400,3181,302.9,5099.8,175,0, "npc_imperial", ""},
	{"crackdown_elite_sand_trooper",400,-2.3,28,-4512.6,91,0, "npc_imperial", ""},
	{"crackdown_elite_sand_trooper",400,-5613.95,21,-2585.97,41.9991,0, "npc_imperial", ""},
	{"crackdown_elite_sand_trooper",400,3142.5,300,5169.9,179,0, "npc_imperial", ""},
	{"crackdown_elite_sand_trooper",400,3319.3,308,5523.9,25,0, "npc_imperial", ""},
	{"crackdown_imperial_army_captain",400,-157.7,28,-4832.6,-130,0, "npc_imperial", ""},
	{"crackdown_imperial_army_captain",400,-177.7,28,-4766.5,86,0, "npc_imperial", ""},
	{"crackdown_imperial_army_captain",400,6820.49,315,-5743.53,353.468,0, "npc_imperial", ""},
	{"crackdown_imperial_army_captain",400,6832.21,315,-5811.19,189.637,0, "npc_imperial", ""},
	{"crackdown_imperial_corporal",400,-5590.48,20.3776,-2854.51,311.192,0, "npc_imperial", ""},
	{"crackdown_imperial_corporal",400,3310.8,308,5482.9,45,0, "npc_imperial", ""},
	{"crackdown_imperial_first_lieutenant",400,-336.602,28,-4791.97,283.938,0, "npc_imperial", ""},
	{"crackdown_imperial_first_lieutenant",400,-206.6,28,-4063.8,0,0, "npc_imperial", ""},
	{"crackdown_imperial_medic",400,-561.9,28,-4234.3,-54,0, "npc_imperial", ""},
	{"crackdown_imperial_noncom",400,-5207.41,21.425,-2247.49,237.999,0, "npc_imperial", ""},
	{"crackdown_imperial_warrant_officer_ii",400,-541.2,28,-4628.5,176,0, "npc_imperial", ""},
	{"crackdown_specialist_noncom",400,-5342.53,21,-2468.78,360.011,0, "npc_imperial", ""},
	{"crackdown_specialist_noncom",400,6830.18,314.823,-5816.91,187.167,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,-569.2,28,-4242.5,-43,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,110.8,28,-4496.5,99,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,25.8,28,-4239.9,-6,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,-5112.07,21,-2248.89,97.4325,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,48.13,0.105,2.47,248.001,2625353, "neutral", ""},
	{"crackdown_stormtrooper",400,3171.4,301.9,5100.1,175,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,3141.3,290,4984.9,-89,0, "npc_imperial", ""},
	{"crackdown_stormtrooper",400,-13,0.2,-7.7,60,4345354, "npc_imperial", ""},
	{"crackdown_stormtrooper_bombardier",400,-547.026,28,-4669.14,331.925,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_bombardier",400,-5086.49,21,-2255.77,216.35,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_captain",400,-338.2,28,-4791.5,110,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_captain",400,6854.5,315,-5696.6,87,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_rifleman",400,-5097.16,21,-2271.05,130.264,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_rifleman",400,3133.4,300,5169.9,178,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_sniper",400,-501.3,28,-4644.5,-2,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_sniper",400,-5094.14,21,-2270.16,45.8873,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_squad_leader",400,6650.38,330,-5938.43,280.869,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_squad_leader",400,-502.1,28,-4701.1,185.005,0, "", ""},
	{"crackdown_stormtrooper_squad_leader",400,-175.938,28,-4767.14,86.307,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_squad_leader",400,-5613.85,21,-2584,33.2059,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_squad_leader",400,-5103.81,21,-2266.4,126.218,0, "npc_imperial", ""},
	{"crackdown_stormtrooper_squad_leader",400,3141.1,290,4975.7,-95,0, "npc_imperial", ""},
	{"crev_bombaasa",60,45.2285,0.104999,0.017077,135.448,2625353, "calm", "Crev Bombaasa"},
	{"criminal",60,-5.02826,-0.894991,-21.3375,60.6357,8105501, "calm", ""},
	--{"daclif_gallamby",60,-35.6875,1.29422,-1.70805,88.4786,1855467, "calm", ""},
	{"dannik_malaan",60,-451.472,28,-4572.05,218.458,0, "calm", "Dannik Malaan"},
	{"death_watch_herald_rebel",1,-213.642,28,-4445.46,28.5501,0, "", ""},
	{"entertainer",60,2.80432,-0.894991,9.55434,360.011,8105496, "conversation", ""},
	{"entertainer",60,0.767877,0.3,-2.90219,180.005,1855463, "conversation", ""},
	{"entertainer",60,-3.65637,1.1544,-8.77307,0,1935476, "conversation", ""},
	{"entertainer",60,-5539.77,21,-2683.65,0,0, "conversation", ""},
	{"entertainer",60,-5539.77,21,-2682.65,180.005,0, "conversation", ""},
	{"entertainer",60,-5196.06,21,-2408.57,0,0, "conversation", ""},
	{"entertainer",60,-6.74614,1.6,-12.8336,0,1935826, "conversation", ""},
	{"entertainer",60,-5009.39,28.1,-2496.09,180.005,0, "conversation", ""},
	{"entertainer",60,-63.189,2.63942,41.8477,134.996,1935695, "conversation", ""},
	{"entertainer",60,24.4668,0.26,3.56238,0,1935831, "conversation", ""},
	{"entertainer",60,21.878,-0.894997,-14.6126,179.999,3075430, "conversation", ""},
	{"entertainer",60,15.2654,2.37968,24.8667,180.002,4395401, "conversation", ""},
	{"explorer",60,17.3045,2.25,18.2968,360.011,1855477, "conversation", ""},
	{"explorer",60,26.5189,2.12846,71.9319,0,2365399, "conversation", ""},
	{"explorer",60,-6.12488,2.6,14.1431,180.005,2365397, "conversation", ""},
	{"explorer",60,1.55839,2.6,4.15034,135.004,2365434, "conversation", ""},
	{"explorer",60,-5568.35,21,-2663.99,180.005,0, "conversation", ""},
	{"explorer",60,-5596.05,21,-2762.83,0,0, "conversation", ""},
	{"explorer",60,-5308.12,21,-2493.27,0,0, "conversation", ""},
	{"explorer",60,-62.5737,2.63942,41.0043,180.004,9665364, "conversation", ""},
	{"farmer",60,-9.42234,1.75,-19.8259,0,1855484, "conversation", ""},
	{"farmer",60,-20.2743,3.22324,21.681,0,1855468, "conversation", ""},
	{"farmer",60,-18.6014,1.30259,-11.3146,360.011,1855463, "conversation", ""},
	{"farmer",60,0.767877,0.3,-4.00219,0,1855463, "conversation", ""},
	{"farmer",60,37.1168,1.29422,-4.41488,0,1855470, "conversation", ""},
	{"farmer",60,-17.5041,0.887194,41.0759,180.006,2365397, "conversation", ""},
	{"farmer",60,-62.7673,2.63942,40.6604,360.011,1855683, "conversation", ""},
	{"farmer",60,10.1683,1.75,-5.25457,135.008,1935476, "conversation", ""},
	{"farmer",60,-22.8235,0.609014,44.1007,180.008,2365434, "conversation", ""},
	{"farmer",60,-5574.26,21,-2683.38,180.005,0, "conversation", ""},
	{"farmer",60,-5159.41,21,-2568.03,180.005,0, "conversation", ""},
	{"farmer",60,-5196.06,21,-2407.57,180.005,0, "conversation", ""},
	{"farmer",60,-4999.24,28.1,-2521.71,0,0, "conversation", ""},
	{"farmer",60,-62.089,2.63942,40.7477,0,1935695, "conversation", ""},
	{"farmer",60,29.3506,13.25,9.83587,360.011,1935841, "conversation", ""},
	{"farmer",60,3145.1,289.991,4994.55,359.489,0, "conversation", ""},
	{"farmer",60,-62.5737,2.63942,40.0043,360.011,9665364, "conversation", ""},
	{"farmer",60,-17.5346,0.765493,42.402,354.765,4395401, "conversation", ""},
	{"farmer",60,-17.5346,0.665389,43.4928,180.009,4395401, "conversation", ""},
	{"farmer",60,25.4426,0.746078,42.666,5.24364,4395401, "conversation", ""},
	{"farmer",60,3.96145,2.12878,76.4149,180.002,4395403, "conversation", ""},
	{"farmer_rancher",60,4.71201,-0.894992,-9.83418,360.011,8105496, "conversation", ""},
	{"farmer_rancher",60,-20.3488,2.12878,65.9854,180.006,2365400, "conversation", ""},
	{"farmer_rancher",60,11.2683,1.75,-5.25457,180.017,1935476, "conversation", ""},
	{"farmer_rancher",60,-14.2562,2.3868,24.7891,180.003,2365434, "conversation", ""},
	{"farmer_rancher",60,3196.61,295.033,5073.8,350.188,0, "conversation", ""},
	{"farmer_rancher",60,3196.61,295.206,5074.8,180.005,0, "conversation", ""},
	{"farmer_rancher",60,8.35364,-0.894992,7.38149,179.999,3075429, "conversation", ""},
	{"farmer_rancher",60,-23.9134,0.6,-3.15254,179.996,4395397, "conversation", ""},
	{"fringer",60,3.66172,0.6,-2.64185,180.005,2365392, "conversation", ""},
	{"fringer",60,-21.8263,2.12878,74.8963,179.999,4395404, "conversation", ""},
	{"gambler",60,-4.61669,0.639424,67.8263,180.012,1855675, "conversation", ""},
	{"gambler",60,0.68378,0.639421,61.0666,268.449,4255423, "calm", ""},
	{"gambler",60,5.33572,2.12878,72.7096,180.003,2365436, "conversation", ""},
	{"gambler",60,3184.22,300,5162.04,0,0, "conversation", ""},
	{"gambler",60,3184.22,300,5163.04,180.005,0, "conversation", ""},
	{"herald_biogenic_03",60,21.3645,1.28309,9.48413,142.744,1935823, "calm", "Teraeza Furloti"},
	{"hunter",60,8.65132,0.639421,75.5483,256.69,1855672, "calm", ""},
	{"hunter",60,3145.1,290,4995.55,180.005,0, "conversation", ""},
	{"hunter",60,-21.8263,2.12878,73.7963,0,4395404, "conversation", ""},
	{"imperial_sergeant",60,6712.78,315,-5810.38,112.467,0, "npc_imperial", ""},
	{"imperial_sergeant",60,6795.21,315,-5702.92,63.9209,0, "npc_imperial", ""},
	{"imperial_sergeant",60,6823.92,315,-5597.88,121.846,0, "npc_imperial", ""},
	{"imperial_sergeant_major",400,6908.17,330,-5608.54,27.4568,0, "npc_imperial", ""},
	{"imperial_staff_sergeant",400,6909.29,330,-5606.48,204.967,0, "npc_imperial", ""},
	{"info_broker",60,21.8079,3.22324,26.617,180.006,1855469, "conversation", ""},
	{"info_broker",60,-17.5041,0.992207,39.9855,5.50246,2365397, "conversation", ""},
	{"info_broker",60,-3557.49,86,3158.11,180.005,0, "conversation", ""},
	{"info_broker",60,-5574.26,21,-2684.38,0,0, "conversation", ""},
	{"info_broker",60,25.7618,0.784388,42.249,5.24275,2365434, "conversation", ""},
	{"info_broker",60,-5095.02,21,-2513.56,180.005,0, "conversation", ""},
	{"info_broker",60,-14.8394,2.32744,25.4359,180.013,4395401, "conversation", ""},
	{"info_broker",60,21.6023,-0.894996,-17.4913,180.012,3375356, "conversation", ""},
	{"j_pai_brek",60,-5073.17,21,-2342.77,33.2325,0, "neutral", ""},
	{"jom_irimore",60,-5520,21.3,-2630.99,0,0, "calm", "Jom Irimore"},
	{"junk_dealer",0,6840,315,-5630,-32,0, "", "",JUNKCLOTHESANDJEWELLERY,JUNKCONVFINARY},
	{"junk_dealer",0,-14.5,1.1,1.9,89,2365767, "", "",JUNKWEAPONS,JUNKCONVARMS},
	{"junk_malik",0,6756.1,315,-5778,88,0, "", "Malik Pendron",JUNKCORSEC,JUNKCONVMALIKVISTAL},
	{"junk_dealer",0,6970,330,-5588,92,0, "", "",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,-118.2,28,-4792.9,-144,0, "", "",JUNKGENERIC,JUNKCONVGENERIC}, 
	{"junk_dealer",0,-14.5,1.1,2.5,88,1855505, "", "",JUNKWEAPONS,JUNKCONVARMS},
	{"junk_dealer",0,-14.5,1.1,2.5,88,3075358, "", "",JUNKWEAPONS,JUNKCONVARMS},
	{"junk_dealer",0,3402.4,308,5679,5,0, "", "",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",10,-3133.8,31,2975.5,7,0, "", "",JUNKGENERIC,JUNKCONVGENERIC},
	{"junk_dealer",0,-5639.2,21,-2799.2,-40,0, "", "",JUNKCLOTHESANDJEWELLERY,JUNKCONVFINARY},
	{"junk_dealer",0,-5203.6,21,-2285.9,-11,0, "", "",JUNKGENERIC,JUNKCONVGENERIC},
	{"karena_keer",60,-7.91182,-0.895002,18.5763,115.51,2625361, "calm", "Karena Keer"},
	{"larek_tatham",60,-5050.23,21,-2291.69,113.059,0, "neutral", ""},
	{"medic",60,-0.332123,0.3,-4.00219,45.0054,1855463, "conversation", ""},
	{"medic",60,5.18395,2.27819,-26.1292,164.924,1855463, "conversation", ""},
	{"medic",60,11.2683,1.75,-6.35457,360.011,1935476, "conversation", ""},
	{"medic",60,-5095.02,21,-2514.56,0,0, "conversation", ""},
	{"medic",60,-4.31306,0.999965,5.16959,0,3075366, "conversation", ""},
	{"medic",60,-43.4991,0.105009,-23.2411,135.007,3375367, "conversation", ""},
	{"mercenary",60,-62.7673,2.63942,41.7604,179.995,1855683, "conversation", ""},
	{"mercenary",60,-3.65637,1.1544,-7.67307,179.999,1935476, "conversation", ""},
	{"mercenary",60,-5308.12,21,-2492.27,180.005,0, "conversation", ""},
	{"mercenary",60,-5398.52,21,-2675.03,180.005,0, "conversation", ""},
	{"mercenary",60,-5059.06,21,-2400.08,0,0, "conversation", ""},
	{"mercenary",60,-5.6917,7.26,-0.915899,0.445885,1935837, "conversation", ""},
	{"mercenary",60,-22.9263,2.12878,74.8963,134.998,4395404, "conversation", ""},
	{"mercenary",60,-0.629707,2.6,2.33132,360.011,4395401, "conversation", ""},
	{"miner",60,37.163,0.639417,39.6061,0,1855678, "conversation", ""},
	{"miner",60,1.29504,1.75,-20.9672,360.011,1935477, "conversation", ""},
	{"miner",60,-5.46842,-0.894998,20.8012,0,3375361, "conversation", ""},
	{"noble",60,11.9421,1.75,-19.8404,0,1855484, "conversation", ""},
	{"noble",60,4.12842,0.3,4.01677,134.998,1855463, "conversation", ""},
	{"noble",60,5.78383,1.1544,-1.95638,180.012,1935476, "conversation", ""},
	{"noble",60,15.2654,2.47978,23.7759,5.24424,4395401, "conversation", ""},
	{"noren_krast",60,-5203.33,21,-2488.13,176.643,0, "calm", "Noren Krast"},
	{"pilot",60,23.1824,1.28309,9.37019,179.994,1935527, "conversation", ""},
	{"pilot",60,3202.28,290,4988.06,0,0, "conversation", ""},
	{"r2",60,-1.84202,0.184067,2.59886,22.229,3375392, "calm", "R2-J0"},
	{"r2",60,-3697.43,87.5185,3141.62,327.074,0, "calm", "R2-Z1"},
	{"r2",60,-5295.88,21,-2528.24,196.589,0, "calm", "R2-B0"},
	{"r2",60,-13.4312,1.6,-15.4443,7.68027,1935827, "calm", "R2-P9"},
	{"r2",60,-5297.6,21,-2396.69,271.4,0, "calm", "R2-X2"},
	{"r2",60,-4954.63,21,-2376.82,26.4361,0, "calm", "R2-E3"},
	{"r2",60,6857.06,315,-5702.8,0,0, "calm", "R2-J9"},
	{"r3",60,-149.754,28,-4785.34,297.928,0, "calm", "R3-E4"},
	{"r3",60,-182.479,28,-4731.42,293.019,0, "calm", "R3-S1"},
	{"r3",60,-3423.05,80.6846,3333.75,253.023,0, "calm", "R3-U1"},
	{"r3",60,-3327.95,86,3233.64,315.946,0, "calm", "R3-N0"},
	{"r3",60,-3151.77,31,2800,265.951,0, "calm", "R3-L8"},
	{"r3",60,-16.1386,2.25,18.5614,173.343,1935472, "calm", "R3-X8"},
	{"r3",60,-5306.4,21,-2567.6,-145,0, "calm", "R3-X5"},
	{"r4",60,6715.38,330,-5903.81,0.0395659,0, "calm", "R4-O8"},
	{"r5",60,-3094.48,31,2972.63,268.321,0, "calm", "R5-W1"},
	{"r5",60,-3134.32,31,2801.71,82.3858,0, "calm", "R5-U7"},
	{"r5",60,-5400.32,21,-2614.17,236.816,0, "calm", "R5-S7"},
	{"r5",60,-4954.81,21,-2379.55,166.051,0, "calm", "R5-C7"},
	{"scientist",60,-1.72746,7.9,-31.075,180.005,1855463, "conversation", ""},
	{"scientist",60,-7.22488,2.6,14.1431,135.008,2365397, "conversation", ""},
	{"scientist",60,56.669,-0.521137,32.6689,360.011,1855678, "conversation", ""},
	{"shalera_the_hutt",60,-19.2041,-0.894989,22.0094,239.061,2625364, "calm", "Shalera the Hutt"},
	{"slicer",60,-18.6014,1.30292,-10.2146,180.006,1855463, "conversation", ""},
	{"slicer",60,26.5189,2.12858,73.0319,180.005,2365399, "conversation", ""},
	{"slicer",60,-18.6041,0.887072,41.0759,134.784,2365397, "conversation", ""},
	{"slicer",60,-4.61669,0.639424,66.7263,0,1855675, "conversation", ""},
	{"slicer",60,5.78383,1.1544,-3.05638,360.011,1935476, "conversation", ""},
	{"slicer",60,-18.0229,9,13.2195,360.011,1935472, "conversation", ""},
	{"slicer",60,-5564.23,21,-2777.78,0,0, "conversation", ""},
	{"slicer",60,-23.3263,1.6,4.96228,180.004,1935824, "conversation", ""},
	{"slicer",60,40.8822,0.104999,3.32819,180.003,3075427, "conversation", ""},
	{"slicer",60,1.28595,0.639421,66.8733,0,9665356, "conversation", ""},
	{"stormtrooper",60,6727.1,315,-5809.9,165,0, "npc_imperial", ""},
	{"stormtrooper",60,6707.89,315,-5814.25,131.647,0, "npc_imperial", ""},
	{"stormtrooper",60,6794.42,315,-5696.6,90.5594,0, "npc_imperial", ""},
	{"stormtrooper",60,6826.7,315,-5820.68,309.206,0, "npc_imperial", ""},
	{"stormtrooper",60,6825.35,315,-5620.37,277.216,0, "npc_imperial", ""},
	{"stormtrooper",60,6842.92,315,-5604.11,56.0358,0, "npc_imperial", ""},
	{"stormtrooper",60,6852,315,-5831.51,128.695,0, "npc_imperial", ""},
	{"stormtrooper",60,6837.95,315,-5806.84,302.784,0, "npc_imperial", ""},
	{"ulaire_roye",60,-5048.68,21,-2291.24,122.799,0, "neutral", ""},
	{"vrak",60,-26.3961,-0.894991,23.1611,112,2625364, "nervous", ""},
	{"willham_burke",60,0.861081,0.999995,2.33215,346.259,3075366, "neutral", ""},
	{"zo_ssa",60,-1.1331,0.999991,1.50214,21.773,3075366, "neutral", ""},
}

corellia_badges = {
	{"badge_agrilat_swap",1387,3749,30,20},
	{"badge_bela_vistal_fountain",6767,-5617,30,81},
	{"badge_rebel_hideout",-6530,5967,30,78},
	{"badge_rogue_corsec_base",5291,1494,30,79},
	{"badge_tyrena_theater",-5418,-6248,30,80},
}
