function createMissionTargetConvoTemplate(templateName, convoHandler)
	mission_target_convotemplate = ConvoTemplate:new {
		initialScreen = "npc_breech_n",
		templateType = "Lua",
		luaClassHandler = convoHandler,
		screens = {}
	}

	mission_target_npc_breech_n = ConvoScreen:new {
		id = "npc_breech_n",
		leftDialog = ":npc_breech_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_npc_breech_n);

	mission_target_invfull = ConvoScreen:new {
		id = "inv_full",
		leftDialog = "",
		stopConversation = "false",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_invfull);

	mission_target_npc_smuggle_n = ConvoScreen:new {
		id = "npc_smuggle_n",
		leftDialog = ":npc_smuggle_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_npc_smuggle_n);

	mission_target_npc_more_1_n = ConvoScreen:new {
		id = "npc_more_1_n",
		leftDialog = ":npc_more_1_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_npc_more_1_n);

	mission_target_npc_more_2_n = ConvoScreen:new {
		id = "npc_more_2_n",
		leftDialog = ":npc_more_2_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_npc_more_2_n);

	mission_target_npc_more_3_n = ConvoScreen:new {
		id = "npc_more_3_n",
		leftDialog = ":npc_more_3_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_npc_more_3_n);

	mission_target_npc_takeme_n = ConvoScreen:new {
		id = "npc_takeme_n",
		leftDialog = ":npc_takeme_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_npc_takeme_n);

	mission_target_dontknowyou_n = ConvoScreen:new {
		id = "dontknowyou_n",
		leftDialog = ":dontknowyou_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_dontknowyou_n);

	mission_target_otherescort_n = ConvoScreen:new {
		id = "otherescort_n",
		leftDialog = ":otherescort_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_otherescort_n);

	mission_target_notit_n = ConvoScreen:new {
		id = "notit_n",
		leftDialog = ":notit_1",
		stopConversation = "true",
		options = {
		}
	}

	mission_target_convotemplate:addScreen(mission_target_notit_n);

	addConversationTemplate(templateName, mission_target_convotemplate);
end


-- Themeparks
createMissionTargetConvoTemplate("theme_park_imperial_mission_target_convotemplate","theme_park_imperial_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_jabba_mission_target_convotemplate","theme_park_jabba_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_marauder_mission_target_convotemplate","theme_park_marauder_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_rebel_mission_target_convotemplate","theme_park_rebel_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_valarian_mission_target_convotemplate","theme_park_valarian_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_nightsister_mission_target_convotemplate","theme_park_nightsister_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_smc_zideera_mission_target_convotemplate", "theme_park_smc_zideera_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_smc_vhaunda_izaryx_mission_target_convotemplate", "theme_park_smc_vhaunda_izaryx_mission_target_conv_handler")
createMissionTargetConvoTemplate("theme_park_smc_vurlene_aujante_mission_target_convotemplate", "theme_park_smc_vurlene_aujante_mission_target_conv_handler")

-- Generic
createMissionTargetConvoTemplate("generic_businessman_mission_target_convotemplate", "generic_businessman_mission_target_conv_handler")
createMissionTargetConvoTemplate("generic_criminal_mission_target_convotemplate", "generic_criminal_mission_target_conv_handler")
createMissionTargetConvoTemplate("generic_noble_mission_target_convotemplate", "generic_noble_mission_target_conv_handler")
createMissionTargetConvoTemplate("generic_scientist_mission_target_convotemplate", "generic_scientist_mission_target_conv_handler")

-- Epic Quest Chains
createMissionTargetConvoTemplate("krayt_dragon_skull_mission_target_convotemplate","krayt_dragon_skull_mission_target_conv_handler")
createMissionTargetConvoTemplate("zicx_bug_bomb_mission_target_convotemplate","zicx_bug_bomb_mission_target_conv_handler")

-- Corellia
createMissionTargetConvoTemplate("blk_sun_tasks_mission_target_convotemplate","blk_sun_tasks_mission_target_conv_handler")
createMissionTargetConvoTemplate("chertyl_ruluwoor_mission_target_convotemplate","chertyl_ruluwoor_mission_target_conv_handler")
createMissionTargetConvoTemplate("coraline_dynes_mission_target_convotemplate","coraline_dynes_mission_target_conv_handler")
createMissionTargetConvoTemplate("corran_horn_mission_target_convotemplate","corran_horn_mission_target_conv_handler")
createMissionTargetConvoTemplate("crev_bombaasa_mission_target_convotemplate","crev_bombaasa_mission_target_conv_handler")
createMissionTargetConvoTemplate("denell_kel_vannon_mission_target_convotemplate","denell_kel_vannon_mission_target_conv_handler")
createMissionTargetConvoTemplate("diktatTargetConvo","diktatTargetHandler")
createMissionTargetConvoTemplate("garm_bel_iblis_mission_target_convotemplate","garm_bel_iblis_mission_target_conv_handler")
createMissionTargetConvoTemplate("gilad_pellaeon_mission_target_convotemplate","gilad_pellaeon_mission_target_conv_handler")
createMissionTargetConvoTemplate("gilker_budz_mission_target_convotemplate","gilker_budz_mission_target_conv_handler")
createMissionTargetConvoTemplate("ging_darjeek_mission_target_convotemplate","ging_darjeek_mission_target_conv_handler")
createMissionTargetConvoTemplate("grondorn_muse_mission_target_convotemplate","grondorn_muse_mission_target_conv_handler")
createMissionTargetConvoTemplate("hal_horn_mission_target_convotemplate","hal_horn_mission_target_conv_handler")
createMissionTargetConvoTemplate("ignar_ominaz_mission_target_convotemplate","ignar_ominaz_mission_target_conv_handler")
createMissionTargetConvoTemplate("jadam_questrel_mission_target_convotemplate","jadam_questrel_mission_target_conv_handler")
createMissionTargetConvoTemplate("kirkin_liawoon_mission_target_convotemplate","kirkin_liawoon_mission_target_conv_handler")
createMissionTargetConvoTemplate("lady_hutt_mission_target_convotemplate","lady_hutt_mission_target_conv_handler")
createMissionTargetConvoTemplate("luthin_dlunar_mission_target_convotemplate","luthin_dlunar_mission_target_conv_handler")
createMissionTargetConvoTemplate("noren_krast_mission_target_convotemplate","noren_krast_mission_target_conv_handler")
createMissionTargetConvoTemplate("thrackan_sal_solo_mission_target_convotemplate","thrackan_sal_solo_mission_target_conv_handler")
createMissionTargetConvoTemplate("zakarisz_ghent_mission_target_convotemplate","zakarisz_ghent_mission_target_conv_handler")

-- Dantooine
createMissionTargetConvoTemplate("drakka_judarrl_mission_target_convotemplate","drakka_judarrl_mission_target_conv_handler")
createMissionTargetConvoTemplate("jatrian_lytus_mission_target_convotemplate","jatrian_lytus_mission_target_conv_handler")
createMissionTargetConvoTemplate("kelvus_naria_mission_target_convotemplate","kelvus_naria_mission_target_conv_handler")
createMissionTargetConvoTemplate("luthik_uwyr_mission_target_convotemplate","luthik_uwyr_mission_target_conv_handler")
createMissionTargetConvoTemplate("lx_466_mission_target_convotemplate","lx_466_mission_target_conv_handler")
createMissionTargetConvoTemplate("sg_567_mission_target_convotemplate","sg_567_mission_target_conv_handler")
createMissionTargetConvoTemplate("stoos_olko_mission_target_convotemplate","stoos_olko_mission_target_conv_handler")
createMissionTargetConvoTemplate("xaan_talmaron_mission_target_convotemplate","xaan_talmaron_mission_target_conv_handler")

-- Dathomir
createMissionTargetConvoTemplate("dolac_legasi_mission_target_convotemplate", "dolac_legasi_mission_target_conv_handler")
createMissionTargetConvoTemplate("shaki_hamachil_mission_target_convotemplate", "shaki_hamachil_mission_target_conv_handler")
createMissionTargetConvoTemplate("shibb_nisshil_mission_target_convotemplate", "shibb_nisshil_mission_target_conv_handler")
createMissionTargetConvoTemplate("singular_nak_mission_target_convotemplate", "singular_nak_mission_target_conv_handler")
createMissionTargetConvoTemplate("wallaw_loowobbli_mission_target_convotemplate", "wallaw_loowobbli_mission_target_conv_handler")
createMissionTargetConvoTemplate("warden_vinzel_haylon_mission_target_convotemplate", "warden_vinzel_haylon_mission_target_conv_handler")
createMissionTargetConvoTemplate("xarot_korlin_mission_target_convotemplate", "xarot_korlin_mission_target_conv_handler")

-- Naboo
createMissionTargetConvoTemplate("arven_wendik_mission_target_convotemplate","arven_wendik_mission_target_conv_handler")
createMissionTargetConvoTemplate("bardo_klinj_mission_target_convotemplate", "bardo_klinj_mission_target_conv_handler")
createMissionTargetConvoTemplate("boss_nass_mission_target_convotemplate","boss_nass_mission_target_conv_handler")
createMissionTargetConvoTemplate("brennis_doore_mission_target_convotemplate", "brennis_doore_mission_target_conv_handler")
createMissionTargetConvoTemplate("damalia_korde_mission_target_convotemplate","damalia_korde_mission_target_conv_handler")
createMissionTargetConvoTemplate("dilvin_lormurojo_mission_target_convotemplate","dilvin_lormurojo_mission_target_conv_handler")
createMissionTargetConvoTemplate("ebenn_q3_baobab_mission_target_convotemplate", "ebenn_q3_baobab_mission_target_conv_handler")
createMissionTargetConvoTemplate("gavyn_sykes_mission_target_convotemplate","gavyn_sykes_mission_target_conv_handler")
createMissionTargetConvoTemplate("kima_nazith_mission_target_convotemplate","kima_nazith_mission_target_conv_handler")
createMissionTargetConvoTemplate("kritus_morven_mission_target_convotemplate", "kritus_morven_mission_target_conv_handler")
createMissionTargetConvoTemplate("leb_slesher_mission_target_convotemplate","leb_slesher_mission_target_conv_handler")
createMissionTargetConvoTemplate("lergo_brazee_mission_target_convotemplate","lergo_brazee_mission_target_conv_handler")
createMissionTargetConvoTemplate("mullud_bombo_mission_target_convotemplate","mullud_bombo_mission_target_conv_handler")
createMissionTargetConvoTemplate("pooja_naberrie_mission_target_convotemplate", "pooja_naberrie_mission_target_conv_handler")
createMissionTargetConvoTemplate("rep_been_mission_target_convotemplate", "rep_been_mission_target_conv_handler")
createMissionTargetConvoTemplate("rovim_minnoni_mission_target_convotemplate","rovim_minnoni_mission_target_conv_handler")
createMissionTargetConvoTemplate("tamvar_senzen_mission_target_convotemplate","tamvar_senzen_mission_target_conv_handler")
createMissionTargetConvoTemplate("vana_sage_mission_target_convotemplate","vana_sage_mission_target_conv_handler")

-- Rori
createMissionTargetConvoTemplate("ajuva_vanasterin_mission_target_convotemplate","ajuva_vanasterin_mission_target_conv_handler")
createMissionTargetConvoTemplate("biribas_tarun_mission_target_convotemplate","biribas_tarun_mission_target_conv_handler")
createMissionTargetConvoTemplate("booto_lubble_mission_target_convotemplate","booto_lubble_mission_target_conv_handler")
createMissionTargetConvoTemplate("draya_korbinari_mission_target_convotemplate","draya_korbinari_mission_target_conv_handler")
createMissionTargetConvoTemplate("hefsen_zindalai_mission_target_convotemplate","hefsen_zindalai_mission_target_conv_handler")
createMissionTargetConvoTemplate("indintra_imbru_yerevan_mission_target_convotemplate","indintra_imbru_yerevan_mission_target_conv_handler")
createMissionTargetConvoTemplate("jaleela_bindoo_mission_target_convotemplate","jaleela_bindoo_mission_target_conv_handler")
createMissionTargetConvoTemplate("oxil_sarban_mission_target_convotemplate","oxil_sarban_mission_target_conv_handler")
createMissionTargetConvoTemplate("raxa_binn_mission_target_convotemplate","raxa_binn_mission_target_conv_handler")
createMissionTargetConvoTemplate("sidoras_bey_mission_target_convotemplate","sidoras_bey_mission_target_conv_handler")
createMissionTargetConvoTemplate("sindra_lintikoor_mission_target_convotemplate","sindra_lintikoor_mission_target_conv_handler")
createMissionTargetConvoTemplate("sloan_rusper_mission_target_convotemplate","sloan_rusper_mission_target_conv_handler")
createMissionTargetConvoTemplate("vordin_sildor_mission_target_convotemplate","vordin_sildor_mission_target_conv_handler")
createMissionTargetConvoTemplate("zeelius_kraymunder_mission_target_convotemplate","zeelius_kraymunder_mission_target_conv_handler")

-- Talus
createMissionTargetConvoTemplate("champhra_biahin_mission_target_convotemplate","champhra_biahin_mission_target_conv_handler")
createMissionTargetConvoTemplate("haleen_snowline_hagrin_zeed_mission_target_convotemplate","haleen_snowline_hagrin_zeed_mission_target_conv_handler")
createMissionTargetConvoTemplate("igbi_freemo_mission_target_convotemplate","igbi_freemo_mission_target_conv_handler")
createMissionTargetConvoTemplate("kathikiis_ruwahurr_mission_target_convotemplate","kathikiis_ruwahurr_mission_target_conv_handler")
createMissionTargetConvoTemplate("mourno_draver_mission_target_convotemplate","mourno_draver_mission_target_conv_handler")
createMissionTargetConvoTemplate("nurla_slinthiss_mission_target_convotemplate","nurla_slinthiss_mission_target_conv_handler")
createMissionTargetConvoTemplate("radlee_mathiss_mission_target_convotemplate","radlee_mathiss_mission_target_conv_handler")
createMissionTargetConvoTemplate("sigrix_slix_mission_target_convotemplate","sigrix_slix_mission_target_conv_handler")
createMissionTargetConvoTemplate("slooni_jong_mission_target_convotemplate","slooni_jong_mission_target_conv_handler")
createMissionTargetConvoTemplate("xalox_guul_mission_target_convotemplate","xalox_guul_mission_target_conv_handler")

-- Tatooine
createMissionTargetConvoTemplate("aaph_koden_mission_target_convotemplate","aaph_koden_mission_target_conv_handler")
createMissionTargetConvoTemplate("blerx_tango_mission_target_convotemplate","blerx_tango_mission_target_conv_handler")
createMissionTargetConvoTemplate("bren_kingal_mission_target_convotemplate","bren_kingal_mission_target_conv_handler")
createMissionTargetConvoTemplate("farious_gletch_mission_target_convotemplate","farious_gletch_mission_target_conv_handler")
createMissionTargetConvoTemplate("fixer_mission_target_convotemplate","fixer_mission_target_conv_handler")
createMissionTargetConvoTemplate("gramm_rile_mission_target_convotemplate","gramm_rile_mission_target_conv_handler")
createMissionTargetConvoTemplate("hedon_istee_mission_target_convotemplate","hedon_istee_mission_target_conv_handler")
createMissionTargetConvoTemplate("ikka_gesul_mission_target_convotemplate","ikka_gesul_mission_target_conv_handler")
createMissionTargetConvoTemplate("jilljoo_jab_mission_target_convotemplate","jilljoo_jab_mission_target_conv_handler")
createMissionTargetConvoTemplate("kaeline_ungasan_mission_target_convotemplate","kaeline_ungasan_mission_target_conv_handler")
createMissionTargetConvoTemplate("kitster_banai_mission_target_convotemplate","kitster_banai_mission_target_conv_handler")
createMissionTargetConvoTemplate("kormund_thrylle_mission_target_convotemplate","kormund_thrylle_mission_target_conv_handler")
createMissionTargetConvoTemplate("lt_harburik_mission_target_convotemplate","lt_harburik_mission_target_conv_handler")
createMissionTargetConvoTemplate("melios_purl_mission_target_convotemplate","melios_purl_mission_target_conv_handler")
createMissionTargetConvoTemplate("nitra_vendallan_mission_target_convotemplate","nitra_vendallan_mission_target_conv_handler")
createMissionTargetConvoTemplate("om_aynat_mission_target_convotemplate","om_aynat_mission_target_conv_handler")
createMissionTargetConvoTemplate("pfilbee_jhorn_mission_target_convotemplate","pfilbee_jhorn_mission_target_conv_handler")
createMissionTargetConvoTemplate("prefect_talmont_mission_target_convotemplate","prefect_talmont_mission_target_conv_handler")
createMissionTargetConvoTemplate("rakir_banai_mission_target_convotemplate","rakir_banai_mission_target_conv_handler")
createMissionTargetConvoTemplate("stella_mission_target_convotemplate","stella_mission_target_conv_handler")
createMissionTargetConvoTemplate("tekil_barje_mission_target_convotemplate","tekil_barje_mission_target_conv_handler")
createMissionTargetConvoTemplate("vardias_tyne_mission_target_convotemplate","vardias_tyne_mission_target_conv_handler")

-- Yavin4
createMissionTargetConvoTemplate("gins_darone_mission_target_convotemplate","gins_darone_mission_target_conv_handler")
createMissionTargetConvoTemplate("jazeen_thurmm_mission_target_convotemplate","jazeen_thurmm_mission_target_conv_handler")
createMissionTargetConvoTemplate("lian_byrne_mission_target_convotemplate","lian_byrne_mission_target_conv_handler")
createMissionTargetConvoTemplate("megan_drlar_mission_target_convotemplate","megan_drlar_mission_target_conv_handler")
createMissionTargetConvoTemplate("ruwan_tokai_mission_target_convotemplate","ruwan_tokai_mission_target_conv_handler")
createMissionTargetConvoTemplate("yith_seenath_mission_target_convotemplate","yith_seenath_mission_target_conv_handler")

