/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#include "Badge.h"

uint8  Badge::types[] = {
		MISC, //"count_5",
		MISC, //"count_10",
		MISC, //"count_25",
		MISC, //"count_50",
		MISC, //"count_75",
		MISC, //"count_100",
		MISC, //"count_125",
		EXPLORATION, //"poi_rabidbeast",
		EXPLORATION, //"poi_prisonbreak",
		EXPLORATION, //"poi_twoliars",
		EXPLORATION, //"poi_factoryliberation",
		EXPLORATION, //"poi_heromark",
		EXPLORATION, //"exp_tat_bens_hut",
		EXPLORATION, //"exp_tat_tusken_pool",
		EXPLORATION, //"exp_tat_krayt_skeleton",
		EXPLORATION, //"exp_tat_escape_pod",
		EXPLORATION, //"exp_tat_sarlacc_pit",
		EXPLORATION, //"exp_tat_lars_homestead",
		EXPLORATION, //"exp_tat_krayt_graveyard",
		EXPLORATION, //"exp_nab_gungan_sacred_place",
		EXPLORATION, //"exp_cor_agrilat_swamp",
		EXPLORATION, //"exp_yav_temple_woolamander",
		EXPLORATION, //"exp_yav_temple_blueleaf",
		EXPLORATION, //"exp_yav_temple_exar_kun",
		EXPLORATION, //"exp_lok_volcano",
		EXPLORATION, //"exp_dat_tarpit",
		EXPLORATION, //"exp_dat_sarlacc",
		EXPLORATION, //"exp_dat_escape_pod",
		EXPLORATION, //"exp_dat_misty_falls_1",
		EXPLORATION, //"exp_dat_misty_falls_2",
		EXPLORATION, //"exp_dan_jedi_temple",
		EXPLORATION, //"exp_dan_rebel_base",
		EVENT, //"event_project_dead_eye_1",
		MISC, //"acc_good_samaritan",
		MISC, //"acc_fascinating_background",
		MISC, //"acc_brave_soldier",
		MISC, //"acc_interesting_personage",
		MISC, //"acc_professional_demeanor",
		QUEST, //"warren_compassion",
		QUEST, //"warren_hero",
		EVENT, //"event_coa2_rebel",
		EVENT, //"event_coa2_imperial",
		PROFESSION, //"combat_1hsword_master",
		PROFESSION, //"combat_2hsword_master",
		PROFESSION, //"combat_bountyhunter_master",
		PROFESSION, //"combat_brawler_master",
		PROFESSION, //"combat_carbine_master",
		PROFESSION, //"combat_commando_master",
		PROFESSION, //"combat_marksman_master",
		PROFESSION, //"combat_pistol_master",
		PROFESSION, //"combat_polearm_master",
		PROFESSION, //"combat_rifleman_master",
		PROFESSION, //"combat_smuggler_master",
		PROFESSION, //"combat_unarmed_master",
		PROFESSION, //"crafting_architect_master",
		PROFESSION, //"crafting_armorsmith_master",
		PROFESSION, //"crafting_artisan_master",
		PROFESSION, //"crafting_chef_master",
		PROFESSION, //"crafting_droidengineer_master",
		PROFESSION, //"crafting_merchant_master",
		PROFESSION, //"crafting_tailor_master",
		PROFESSION, //"crafting_weaponsmith_master",
		PROFESSION, //"outdoors_bioengineer_master",
		PROFESSION, //"outdoors_creaturehandler_master",
		PROFESSION, //"outdoors_ranger_master",
		PROFESSION, //"outdoors_scout_master",
		PROFESSION, //"outdoors_squadleader_master",
		PROFESSION, //"science_combatmedic_master",
		PROFESSION, //"science_doctor_master",
		PROFESSION, //"science_medic_master",
		PROFESSION, //"social_dancer_master",
		PROFESSION, //"social_entertainer_master",
		PROFESSION, //"social_imagedesigner_master",
		PROFESSION, //"social_musician_master",
		PROFESSION, //"social_politician_master",
		EXPLORATION, //"bdg_exp_nab_theed_falls_bottom",
		EXPLORATION, //"bdg_exp_nab_deeja_falls_top",
		EXPLORATION, //"bdg_exp_nab_amidalas_sandy_beach",
		EXPLORATION, //"bdg_exp_cor_rebel_hideout",
		EXPLORATION, //"bdg_exp_cor_rogue_corsec_base",
		EXPLORATION, //"bdg_exp_cor_tyrena_theater",
		EXPLORATION, //"bdg_exp_cor_bela_vistal_fountain",
		EXPLORATION, //"bdg_exp_dat_crashed_ship",
		EXPLORATION, //"bdg_exp_dat_imp_prison",
		EXPLORATION, //"bdg_exp_dan_dantari_village1",
		EXPLORATION, //"bdg_exp_dan_dantari_village2",
		EXPLORATION, //"bdg_exp_end_ewok_tree_village",
		EXPLORATION, //"bdg_exp_end_ewok_lake_village",
		EXPLORATION, //"bdg_exp_end_dulok_village",
		EXPLORATION, //"bdg_exp_end_imp_outpost",
		EXPLORATION, //"bdg_exp_tal_creature_village",
		EXPLORATION, //"bdg_exp_tal_imp_base",
		EXPLORATION, //"bdg_exp_tal_imp_vs_reb_battle",
		EXPLORATION, //"bdg_exp_tal_aqualish_cave",
		EXPLORATION, //"bdg_exp_ror_kobala_spice_mine",
		EXPLORATION, //"bdg_exp_ror_rebel_outpost",
		EXPLORATION, //"bdg_exp_ror_imp_camp",
		EXPLORATION, //"bdg_exp_ror_imp_hyperdrive_fac",
		EXPLORATION, //"bdg_exp_lok_imp_outpost",
		EXPLORATION, //"bdg_exp_lok_kimogila_skeleton",
		MISC, //"bdg_exp_10_badges",
		MISC, //"bdg_exp_20_badges",
		MISC, //"bdg_exp_30_badges",
		MISC, //"bdg_exp_40_badges",
		MISC, //"bdg_exp_45_badges",
		QUEST, //"bdg_thm_park_jabba_badge",
		QUEST, //"bdg_thm_park_imperial_badge",
		QUEST, //"bdg_thm_park_rebel_badge",
		QUEST, //"bdg_thm_park_nym_badge",
		EVENT, //"event_coa3_rebel",
		EVENT, //"event_coa3_imperial",
		QUEST, //"bdg_library_trivia",
		DUNGION, //"bdg_corvette_imp_destroy",
		DUNGION, //"bdg_corvette_imp_rescue",
		DUNGION, //"bdg_corvette_imp_assassin",
		DUNGION, //"bdg_corvette_neutral_destroy",
		DUNGION, //"bdg_corvette_neutral_rescue",
		DUNGION, //"bdg_corvette_neutral_assassin",
		DUNGION, //"bdg_corvette_reb_destroy",
		DUNGION, //"bdg_corvette_reb_rescue",
		DUNGION, //"bdg_corvette_reb_assassin",
		MISC, //"bdg_racing_agrilat_swamp",
		MISC, //"bdg_racing_keren_city",
		MISC, //"bdg_racing_mos_espa",
		EVENT, //"bdg_accolade_live_event",
		MISC, //"bdg_racing_lok_marathon",
		MISC, //"bdg_racing_narmle_memorial",
		MISC, //"bdg_racing_nashal_river",
		MISC, //"destroy_deathstar",
		PROFESSION, //"crafting_shipwright",
		PROFESSION, //"pilot_rebel_navy_naboo",
		PROFESSION, //"pilot_rebel_navy_corellia",
		PROFESSION, //"pilot_rebel_navy_tatooine",
		PROFESSION, //"pilot_imperial_navy_naboo",
		PROFESSION, //"pilot_imperial_navy_corellia",
		PROFESSION, //"pilot_imperial_navy_tatooine",
		PROFESSION, //"pilot_neutral_naboo",
		PROFESSION, //"pilot_corellia",
		PROFESSION, //"pilot_tatooine",
		EVENT //"bdg_accolate_home_show"
};

String Badge::names[] = {
		"count_5",
		"count_10",
		"count_25",
		"count_50",
		"count_75",
		"count_100",
		"count_125",
		"poi_rabidbeast",
		"poi_prisonbreak",
		"poi_twoliars",
		"poi_factoryliberation",
		"poi_heromark",
		"exp_tat_bens_hut",
		"exp_tat_tusken_pool",
		"exp_tat_krayt_skeleton",
		"exp_tat_escape_pod",
		"exp_tat_sarlacc_pit",
		"exp_tat_lars_homestead",
		"exp_tat_krayt_graveyard",
		"exp_nab_gungan_sacred_place",
		"exp_cor_agrilat_swamp",
		"exp_yav_temple_woolamander",
		"exp_yav_temple_blueleaf",
		"exp_yav_temple_exar_kun",
		"exp_lok_volcano",
		"exp_dat_tarpit",
		"exp_dat_sarlacc",
		"exp_dat_escape_pod",
		"exp_dat_misty_falls_1",
		"exp_dat_misty_falls_2",
		"exp_dan_jedi_temple",
		"exp_dan_rebel_base",
		"event_project_dead_eye_1",
		"acc_good_samaritan",
		"acc_fascinating_background",
		"acc_brave_soldier",
		"acc_interesting_personage",
		"acc_professional_demeanor",
		"warren_compassion",
		"warren_hero",
		"event_coa2_rebel",
		"event_coa2_imperial",
		"combat_1hsword_master",
		"combat_2hsword_master",
		"combat_bountyhunter_master",
		"combat_brawler_master",
		"combat_carbine_master",
		"combat_commando_master",
		"combat_marksman_master",
		"combat_pistol_master",
		"combat_polearm_master",
		"combat_rifleman_master",
		"combat_smuggler_master",
		"combat_unarmed_master",
		"crafting_architect_master",
		"crafting_armorsmith_master",
		"crafting_artisan_master",
		"crafting_chef_master",
		"crafting_droidengineer_master",
		"crafting_merchant_master",
		"crafting_tailor_master",
		"crafting_weaponsmith_master",
		"outdoors_bio_engineer_master",
		"outdoors_creaturehandler_master",
		"outdoors_ranger_master",
		"outdoors_scout_master",
		"outdoors_squadleader_master",
		"science_combatmedic_master",
		"science_doctor_master",
		"science_medic_master",
		"social_dancer_master",
		"social_entertainer_master",
		"social_imagedesigner_master",
		"social_musician_master",
		"social_politician_master",
		"bdg_exp_nab_theed_falls_bottom",
		"bdg_exp_nab_deeja_falls_top",
		"bdg_exp_nab_amidalas_sandy_beach",
		"bdg_exp_cor_rebel_hideout",
		"bdg_exp_cor_rogue_corsec_base",
		"bdg_exp_cor_tyrena_theater",
		"bdg_exp_cor_bela_vistal_fountain",
		"bdg_exp_dat_crashed_ship",
		"bdg_exp_dat_imp_prison",
		"bdg_exp_dan_dantari_village1",
		"bdg_exp_dan_dantari_village2",
		"bdg_exp_end_ewok_tree_village",
		"bdg_exp_end_ewok_lake_village",
		"bdg_exp_end_dulok_village",
		"bdg_exp_end_imp_outpost",
		"bdg_exp_tal_creature_village",
		"bdg_exp_tal_imp_base",
		"bdg_exp_tal_imp_vs_reb_battle",
		"bdg_exp_tal_aqualish_cave",
		"bdg_exp_ror_kobala_spice_mine",
		"bdg_exp_ror_rebel_outpost",
		"bdg_exp_ror_imp_camp",
		"bdg_exp_ror_imp_hyperdrive_fac",
		"bdg_exp_lok_imp_outpost",
		"bdg_exp_lok_kimogila_skeleton",
		"bdg_exp_10_badges",
		"bdg_exp_20_badges",
		"bdg_exp_30_badges",
		"bdg_exp_40_badges",
		"bdg_exp_45_badges",
		"bdg_thm_park_jabba_badge",
		"bdg_thm_park_imperial_badge",
		"bdg_thm_park_rebel_badge",
		"bdg_thm_park_nym_badge",
		"event_coa3_rebel",
		"event_coa3_imperial",
		"bdg_library_trivia",
		"bdg_corvette_imp_destroy",
		"bdg_corvette_imp_rescue",
		"bdg_corvette_imp_assassin",
		"bdg_corvette_neutral_destroy",
		"bdg_corvette_neutral_rescue",
		"bdg_corvette_neutral_assassin",
		"bdg_corvette_reb_destroy",
		"bdg_corvette_reb_rescue",
		"bdg_corvette_reb_assassin",
		"bdg_racing_agrilat_swamp",
		"bdg_racing_keren_city",
		"bdg_racing_mos_espa",
		"bdg_accolade_live_event",
		"bdg_racing_lok_marathon",
		"bdg_racing_narmle_memorial",
		"bdg_racing_nashal_river",
		"destroy_deathstar",
		"crafting_shipwright",
		"pilot_rebel_navy_naboo",
		"pilot_rebel_navy_corellia",
		"pilot_rebel_navy_tatooine",
		"pilot_imperial_navy_naboo",
		"pilot_imperial_navy_corellia",
		"pilot_imperial_navy_tatooine",
		"pilot_neutral_naboo",
		"pilot_corellia",
		"pilot_tatooine",
		"bdg_accolate_home_show"
};
