-- This variable will override the default attack speed for all non player creatures, set to 0.0 to disable
-- If set to 0.0, creatures will use either mobile specific attack speed values or default to level based calculations
globalAttackSpeedOverride = 2.0

-- { speciesId, skeleton, canSit, canLieDown }
aiSpeciesData = {
	{ 0, "human", false, false }, -- human
	{ 1, "human", false, false }, -- rodian
	{ 2, "human", false, false }, -- trandoshan
	{ 3, "human", false, false }, -- mon_calamari
	{ 4, "human", false, false }, -- wookiee
	{ 5, "human", false, false }, -- bothan
	{ 6, "human", false, false }, -- twilek
	{ 7, "human", false, false }, -- zabrak
	{ 8, "human", false, false }, -- abyssin
	{ 9, "human", false, false }, -- aqualish
	{ 10, "human", false, false }, -- arcona
	{ 11, "human", false, false }, -- askajian
	{ 12, "human", false, false }, -- bith
	{ 13, "human", false, false }, -- bomarr_monk
	{ 14, "ewok", false, false }, -- chadra_fan
	{ 15, "chevin", false, false }, -- chevin
	{ 16, "human", false, false }, -- dantari
	{ 17, "human", false, false }, -- devaronian
	{ 18, "drall", false, false }, -- drall
	{ 19, "human", false, false }, -- dug
	{ 20, "human", false, false }, -- duros
	{ 21, "human", false, false }, -- elomin
	{ 22, "ewok", false, false }, -- ewok
	{ 23, "human", false, false }, -- feeorin
	{ 24, "human", false, false }, -- frog_dog
	{ 25, "human", false, false }, -- gamorrean
	{ 26, "gorax", false, false }, -- gorax
	{ 27, "human", false, false }, -- gotal
	{ 28, "human", false, false }, -- gran
	{ 29, "human", false, false }, -- gungan
	{ 30, "human", false, false }, -- gupin
	{ 31, "hutt", false, false }, -- hutt
	{ 32, "human", false, false }, -- ishi_tib
	{ 33, "human", false, false }, -- ithorian
	{ 34, "human", false, false }, -- jawa
	{ 35, "human", false, false }, -- kiffu
	{ 36, "human", false, false }, -- kitonak
	{ 37, "human", false, false }, -- klatooinian
	{ 38, "human", false, false }, -- kowakian_monkey_lizard
	{ 39, "human", false, false }, -- kubaz
	{ 40, "human", false, false }, -- marauder
	{ 41, "human", false, false }, -- massassi_warrior
	{ 42, "human", false, false }, -- nikto
	{ 43, "human", false, false }, -- ortolan
	{ 44, "human", false, false }, -- palowick
	{ 45, "human", false, false }, -- phlog
	{ 46, "human", false, false }, -- quarren
	{ 47, "selonian", false, false }, -- selonian
	{ 48, "human", false, false }, -- shistavanen
	{ 49, "human", false, false }, -- sullustan
	{ 50, "human", false, false }, -- talz
	{ 51, "human", false, false }, -- teek
	{ 52, "tulgah", false, false }, -- tulgah
	{ 53, "human", false, false }, -- toydarian
	{ 54, "human", false, false }, -- tusken_raider
	{ 55, "human", false, false }, -- weequay
	{ 56, "whiphid", false, false }, -- whiffid
	{ 57, "human", false, false }, -- wistie
	{ 58, "human", false, false }, -- yuzzum
	{ 59, "human", false, false }, -- fioran
	{ 60, "spider", false, false }, -- angler
	{ 61, "camel", false, true }, -- bageraset
	{ 62, "elephant", false, true }, -- bantha
	{ 63, "insect_basic", false, false }, -- bark_mite
	{ 64, "bird_turkey", false, true }, -- baz_nitch
	{ 65, "cat_domestic", true, true }, -- bearded_jax
	{ 66, "fish_basic", false, false }, -- blackfish
	{ 67, "dinosaurid", false, true }, -- blistmok
	{ 68, "fish_basic", false, false }, -- bluefish
	{ 69, "tauntaun", false, false }, -- blurrg
	{ 70, "pig", true, true }, -- boar_wolf
	{ 71, "lizard_basic", false, true }, -- bocatt
	{ 72, "dewback", false, true }, -- bol
	{ 73, "giraffe", false, true }, -- bolle_bol
	{ 74, "dewback", false, true }, -- bolma
	{ 75, "horse", false, true }, -- bordok
	{ 76, "bat", false, false }, -- borgle
	{ 77, "camel", false, true }, -- brackaset
	{ 78, "insect_moth", false, false }, -- capper_spineflap
	{ 79, "kaadu", false, true }, -- carrion_spat
	{ 80, "canine", true, true }, -- choku
	{ 81, "frog", false, true }, -- chuba
	{ 82, "colo_claw_fish", false, false }, -- colo_claw_fish
	{ 83, "griffon", false, false }, -- condor_dragon
	{ 84, "cat_predatory", true, true }, -- corellian_sand_panther
	{ 85, "canine", true, true }, -- corellian_slice_hound
	{ 86, "bird_finch", false, false }, -- crowned_rasp
	{ 87, "snake_basic", false, false }, -- crystal_snake
	{ 88, "tauntaun", false, false }, -- cu_pa
	{ 89, "insect_mantis", false, false }, -- dalyrake
	{ 90, "dewback", false, true }, -- dewback
	{ 91, "lizard_basic", false, true }, -- dune_lizard
	{ 92, "rabbit", true, true }, -- durni
	{ 93, "bird_turkey", false, true }, -- dwarf_nuna
	{ 94, "camel", false, true }, -- eopie
	{ 95, "fish_basic", false, false }, -- faa
	{ 96, "camel", false, true }, -- falumpaset
	{ 97, "fambaa", false, true }, -- fambaa
	{ 98, "snake_basic", false, false }, -- fanned_rawl
	{ 99, "insect_moth", false, false }, -- flewt
	{ 100, "bat", false, false }, -- flit
	{ 101, "bird_finch", false, false }, -- flite_rasp
	{ 102, "mynock", false, false }, -- fynock
	{ 103, "bat", false, false }, -- gackle_bat
	{ 104, "spider", false, false }, -- gaping_spider
	{ 105, "dinosaurid", false, true }, -- gekk
	{ 106, "rabbit", true, true }, -- gnort
	{ 107, "rancor", true, true }, -- graul
	{ 108, "cat_predatory", true, true }, -- great_grass_plains_tusk_cat
	{ 109, "elephant", false, true }, -- gronda
	{ 110, "horse", false, true }, -- gualama
	{ 111, "frog", false, true }, -- gubbur
	{ 112, "dewback", false, true }, -- guf_drolg
	{ 113, "griffon", false, false }, -- gulginaw
	{ 114, "simian_ape", true, true }, -- gurk
	{ 115, "camel", false, true }, -- gurnaset
	{ 116, "cat_predatory", true, true }, -- gurrek
	{ 117, "simian_ape", true, true }, -- hanadak
	{ 118, "spider", false, false }, -- hermit_spider
	{ 119, "insect_basic", false, false }, -- horned_krevol
	{ 120, "bird_finch", false, false }, -- horned_rasp
	{ 121, "fambaa", false, true }, -- huf_dun
	{ 122, "canine", true, true }, -- huurton
	{ 123, "goat", false, true }, -- ikopi
	{ 124, "jellyfish", false, false }, -- jellyfish
	{ 125, "kaadu", false, true }, -- kaadu
	{ 126, "griffon", false, false }, -- kaitok
	{ 127, "cat_domestic", true, true }, -- kima
	{ 128, "lizard_giant", false, true }, -- kimogila
	{ 129, "cat_domestic", true, true }, -- kittle
	{ 130, "insect_mantis", false, false }, -- kliknik
	{ 131, "horse", false, true }, -- krahbu
	{ 132, "lizard_giant", false, true }, -- krayt_dragon
	{ 133, "bird_eagle", false, false }, -- kupernug
	{ 134, "canine", true, true }, -- kusak
	{ 135, "tauntaun", false, false }, -- kwi
	{ 136, "fish_basic", false, false }, -- laa
	{ 137, "cat_domestic", true, true }, -- langlatch
	{ 138, "bird_giant", false, false }, -- lantern_bird
	{ 139, "fambaa", false, true }, -- malkloc
	{ 140, "simian_ape", true, true }, -- mamien
	{ 141, "kaadu", false, true }, -- mawgax
	{ 142, "insect_mantis", false, false }, -- merek
	{ 143, "pig", true, true }, -- mott
	{ 144, "goat", false, true }, -- murra
	{ 145, "mynock", false, false }, -- mynock
	{ 146, "cat_predatory", true, true }, -- narglatch
	{ 147, "horse", false, true }, -- nerf
	{ 148, "bird_turkey", false, true }, -- nuna
	{ 149, "opee_sea_killer", false, false }, -- opee_sea_killer
	{ 150, "insect_moth", false, false }, -- predatorial_butterfly
	{ 151, "bird_giant", false, false }, -- peko_peko
	{ 152, "griffon", false, false }, -- perlek
	{ 153, "bird_turkey", false, true }, -- pharple
	{ 154, "giraffe", false, true }, -- piket
	{ 155, "bird_finch", false, false }, -- plumed_rasp
	{ 156, "fish_basic", false, false }, -- pufferfish
	{ 157, "kaadu", false, true }, -- pugoriss
	{ 158, "simian_monkey", true, true }, -- purbole
	{ 159, "rat", false, true }, -- quenker
	{ 160, "bird_eagle", false, false }, -- qurvel
	{ 161, "rancor", true, true }, -- rancor
	{ 162, "fish_basic", false, false }, -- ray
	{ 163, "rat", false, true }, -- remmer
	{ 164, "bird_giant", false, false }, -- reptilian_flyer
	{ 165, "pig", true, true }, -- roba
	{ 166, "insect_basic", false, false }, -- rock_mite
	{ 167, "giraffe", false, true }, -- ronto
	{ 168, "mynock", false, false }, -- salt_mynock
	{ 169, "sarlacc", false, false }, -- sarlacc
	{ 170, "dinosaurid", false, true }, -- scurrier
	{ 171, "giraffe", false, true }, -- sharnaff
	{ 172, "simian_monkey", true, true }, -- shaupaut
	{ 173, "spider", false, false }, -- shear_mite
	{ 174, "simian_monkey", true, true }, -- skreeg
	{ 175, "elephant", false, true }, -- snorbal
	{ 176, "frog", false, true }, -- spined_puc
	{ 177, "snake_basic", false, false }, -- spined_snake
	{ 178, "rabbit", true, true }, -- squall
	{ 179, "simian_monkey", true, true }, -- squill
	{ 180, "rat", false, true }, -- stintaril
	{ 181, "fish_basic", false, false }, -- striped_fish
	{ 182, "goat", false, true }, -- swirl_prong
	{ 183, "insect_basic", false, false }, -- tanc_mite
	{ 184, "tauntaun", false, false }, -- taun_taun
	{ 185, "dinosaurid", false, true }, -- tesselated_arboreal_binjinphant
	{ 186, "elephant", false, true }, -- thune
	{ 187, "fambaa", false, true }, -- torton
	{ 188, "horse", false, true }, -- tybis
	{ 189, "simian_ape", true, true }, -- veermok
	{ 190, "goat", false, true }, -- verne
	{ 191, "lizard_basic", false, true }, -- vesp
	{ 192, "rabbit", true, true }, -- vir_vur
	{ 193, "bird_eagle", false, false }, -- vlutore
	{ 194, "snake_basic", false, false }, -- vog_eel
	{ 195, "lizard_basic", false, true }, -- voritor_lizard
	{ 196, "mynock", false, false }, -- vynock
	{ 197, "bird_giant", false, false }, -- whisper_bird
	{ 198, "bird_eagle", false, false }, -- winged_ornith
	{ 199, "rat", false, true }, -- womp_rat
	{ 200, "simian_monkey", true, true }, -- woolamander
	{ 201, "frog", false, true }, -- worrt
	{ 202, "pig", true, true }, -- zucca_boar
	{ 203, "droid_2", false, false }, -- assassindroid
	{ 204, "astromech", false, false }, -- astromech
	{ 205, "robo_bartender", false, false }, -- bartenderdroid
	{ 206, "protocol_droid", false, false }, -- bugdroid
	{ 207, "human", false, true }, -- darktrooper
	{ 208, "lin_demolition", false, false }, -- demolitionmech
	{ 209, "tt8l_y7", false, false }, -- doordroid
	{ 210, "droideka", false, false }, -- droideka
	{ 211, "ito", false, false }, -- interrogator
	{ 212, "orb", false, false }, -- jeditrainer
	{ 213, "cll8", false, false }, -- loadlifter
	{ 214, "mouse_droid", false, false }, -- mousedroid
	{ 215, "eg6", false, false }, -- powerdroid
	{ 216, "probe_droid", false, false }, -- probot
	{ 217, "protocol_droid", false, false }, -- protocoldroid
	{ 218, "protocol_droid", false, false }, -- repairdroid
	{ 219, "spider_droid", false, false }, -- spiderdroid
	{ 220, "droid_2", false, false }, -- surgicaldroid
	{ 221, "tt8l", false, false }, -- tattletaledroid
	{ 222, "dz70", false, false }, -- trackerdroid
	{ 223, "wed_treadwell", false, false }, -- treadwell
	{ 224, "droid_2", false, false }, -- ev9d9
	{ 225, "orb", false, false }, -- maul_probe_droid
	{ 226, "atst", false, false }, -- atst
	{ 227, "atat", false, false }, -- atat
	{ 228, "geonosian", false, false }, -- geonosian
	{ 229, "varactyl", false, false }, -- veractyle
}
