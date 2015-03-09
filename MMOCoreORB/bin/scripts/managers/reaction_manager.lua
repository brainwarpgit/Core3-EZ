-- This file manages npc reaction levels to emotes and spatial

emoteReactionLevels = {
	{ "backhand", 3 },
	{ "bang", 3 },
	{ "bodyslam", 3 },
	{ "halfnelson", 3 },
	{ "nelson", 3 },
	{ "noogie", 3 },
	{ "punch", 3 },
	{ "slap", 3 },
	{ "spit", 3 },
	{ "strangle", 3 },
	{ "tackle", 3 },
	{ "bonk", 2 },
	{ "claw", 2 },
	{ "drool", 2 },
	{ "elbow", 2 },
	{ "lick", 2 },
	{ "pet", 2 },
	{ "pinch", 2 },
	{ "provoke", 2 },
	{ "puke", 2 },
	{ "swat", 2 },
	{ "twistarm", 2 },
	{ "whap", 2 },
	{ "fiddle", 2 },
	{ "knockwood", 2 },
	{ "lean", 2 },
	{ "mosh", 2 },
	{ "flail", 2 },
	{ "charge", 2 },
	{ "chestpuff", 2 },
	{ "peyoo", 1 },
	{ "echuta", 2 },
	{ "fistpalm", 2 },
	{ "poke", 2 },
	{ "combhair", 1 },
	{ "hug", 1 },
	{ "kiss", 1 },
	{ "melt", 1 },
	{ "nuzzle", 1 },
	{ "pat", 1 },
	{ "scratch", 1 },
	{ "slobber", 1 },
	{ "snog", 1 },
	{ "squeeze", 1 },
	{ "stomp", 1 },
	{ "sweat", 1 },
	{ "toss", 1 },
	{ "tug", 1 },
	{ "tweak", 1 },
	{ "covereyes", 1 },
	{ "embrace", 1 },
	{ "hi5", 1 },
	{ "nap", 1 },
	{ "pillow", 1 },
	{ "prod", 1 },
	{ "pull", 1 },
	{ "push", 1 },
	{ "ruffle", 1 },
	{ "spin", 1 },
	{ "stretch", 1 },
	{ "tickle", 1 },
	{ "brandish", 1 },
	{ "burp", 1 },
	{ "chestpound", 1 },
	{ "curse", 1 },
	{ "deride", 1 },
	{ "flame", 1 },
	{ "hand", 1 },
	{ "pound", 1 },
	{ "roar", 1 },
	{ "adjust", 1 },
	{ "boggle", 1 },
	{ "chase", 1 },
	{ "dance", 1 },
	{ "diagnose", 1 },
	{ "feel", 1 },
	{ "fool", 1 },
	{ "fume", 1 },
	{ "gag", 1 },
	{ "glare", 1 },
	{ "growl", 1 },
	{ "hiss", 1 },
	{ "hose", 1 },
	{ "mimic", 1 },
	{ "mourn", 1 },
	{ "mutter", 1 },
	{ "pucker", 1 },
	{ "raspberry", 1 },
	{ "scare", 1 },
	{ "scold", 1 },
	{ "scowl", 1 },
	{ "sharpen", 1 },
	{ "slit", 1 },
	{ "smell", 1 },
	{ "snarl", 1 },
	{ "sneer", 1 },
	{ "steam", 1 },
	{ "throwat", 1 },
	{ "throwdown", 1 },
	{ "tongue", 1 },
	{ "veto", 1 },
	{ "yawn", 1 },
}

emoteReactionFines = {
	-- { EmoteLevel, IsImperial, IsHuman, RankComparison, CreditFine, FactionFine, Knockdown, quipMin, quipMax, responseEmote }
	-- RankComparison: -1 = inferior rank than npc, 0 = same rank as npc, 1 = superior rank than npc

	-- Inferior Ranked Imperials --
	{ 3, true, true, -1, 3500, 35, true, 21, 24, "" },
	{ 3, true, false, -1, 5000, 50, true, 13, 16, "" },
	{ 2, true, true, -1, 2000, 20, false, 21, 24, "" },
	{ 2, true, false, -1, 5000, 20, true, 13, 16, "" },
	{ 1, true, true, -1, 500, 50, false, 21, 24, "" },
	{ 1, true, false, -1, 2000, 20, false, 13, 16, "" },
	{ 0, true, true, -1, 0, 0, false, 0, 0, "" }, -- No reaction
	{ 0, true, false, -1, 500, 5, false, 13, 16, "" },

	-- Superior Ranked Imperials --
	{ 3, true, true, 1, 0, 0, false, 35, 36, "standing_placate" },
	{ 3, true, false, 1, 0, 0, false, 35, 36, "standing_placate" },
	{ 2, true, true, 1, 0, 0, false, 35, 36, "salute2" },
	{ 2, true, false, 1, 0, 0, false, 35, 36, "salute2" },
	{ 1, true, true, 1, 0, 0, false, 37, 39, "salute1" },
	{ 1, true, false, 1, 0, 0, false, 37, 39, "salute1" },
	{ 0, true, true, 1, 0, 0, false, -1, -1, "salute1" },
	{ 0, true, false, 1, 0, 0, false, -1, -1, "salute1" },

	-- Equal Ranked Imperials --
	{ 3, true, true, 0, 0, 25, false, 25, 26, "" },
	{ 3, true, false, 0, 0, 50, false, 21, 24, "" },
	{ 2, true, true, 0, 0, 25, false, 25, 26, "" },
	{ 2, true, false, 0, 0, 50, false, 21, 24, "" },
	{ 1, true, true, 0, 0, 0, false, -1, -1, "" },
	{ 1, true, false, 0, 0, 0, false, -1, -1, "" },
	{ 0, true, true, 0, 0, 0, false, -1, -1, "" },
	{ 0, true, false, 0, 0, 0, false, -1, -1, "" },

	-- Non Imperials --
	{ 3, false, true, 0, 3500, 35, true, 31, 34, "" },
	{ 3, false, false, 0, 5000, 50, true, 27, 30, "" },
	{ 2, false, true, 0, 2000, 20, false, 31, 34, "" },
	{ 2, false, false, 0, 5000, 50, true, 27, 30, "" },
	{ 1, false, true, 0, 500, 5, false, 31, 34, "" },
	{ 1, false, false, 0, 3500, 35, false, 27, 30, "" },
	{ 0, false, true, 0, 0, 0, false, -1, -1, "" }, -- No reaction
	{ 0, false, false, 0, 1000, 10, false, 27, 30, "" },
}

-- This is the list of npcs that have reactions and their reaction rank
-- Their rank is compared to player faction rank to determine if they are superior/inferior/equal in rank
imperialReactionRanks = {
	{ "imperial_cadet_squadleader", 1, 1 },
	{ "imperial_civil_patrolman", 1, 1 },
	{ "imperial_private", 1, 1 },
	{ "imperial_trooper", 1, 1 },
	{ "imperial_lance_corporal", 2, 2 },
	{ "imperial_senior_cadet", 2, 2 },
	{ "imperial_civil_patrol_corporal", 3, 3 },
	{ "imperial_corporal", 3, 3 },
	{ "imperial_staff_corporal", 4, 4 },
	{ "imperial_civil_patrol_sergeant", 5, 5 },
	{ "imperial_sergeant", 5, 5 },
	{ "imperial_staff_sergeant", 6, 6 },
	{ "imperial_master_sergeant", 7, 7 },
	{ "imperial_sergeant_major", 7, 7 },
	{ "imperial_warrant_officer_ii", 8, 8 },
	{ "imperial_warrant_officer_i", 9, 9 },
	{ "imperial_second_lieutenant", 10, 10 },
	{ "imperial_civil_patrol_commander", 11, 11 },
	{ "imperial_first_lieutenant", 11, 11 },
	{ "imperial_army_captain", 12, 12 },
	{ "imperial_civil_patrol_captain", 12, 12},
	{ "stormtrooper_captain", 12, 12 },
	{ "imperial_major", 13, 13 },
	{ "stormtrooper_major", 13, 13 },
	{ "imperial_lieutenant_colonel", 14, 14 },
	{ "imperial_colonel", 15, 15 },
	{ "high_colonel", 16, 16 },
	{ "imperial_brigadier_general", 16, 16 },
	{ "imperial_major_genera", 17, 17 },
	{ "imperial_lieutenant_general", 18, 18 },
	{ "imperial_general", 19, 19 },
	{ "imperial_high_general", 20, 20 },
	{ "imperial_surface_marshal", 21, 21},
	{ "coa3_rebel_research_attacker1", 1, 7 },
	{ "imperial_medic", 1, 7 },
	{ "imperial_noncom", 1, 7 },
	{ "imperial_recruiter", 1, 7 },
	{ "imperial_retreat_guard", 1, 7 },
	{ "imperial_sharpshooter", 1, 7 },
	{ "lance_bombardier", 1, 7 },
	{ "sand_trooper", 1, 7 },
	{ "scout_trooper", 1, 7 },
	{ "storm_commando", 1, 7 },
	{ "stormtrooper", 1, 7 },
	{ "stormtrooper_black_hole", 1, 7 },
	{ "stormtrooper_medic", 1, 7 },
	{ "stormtrooper_rifleman", 1, 7 },
	{ "stormtrooper_sniper", 1, 7 },
	{ "stranded_imperial_soldier", 1, 7 },
	{ "swamp_trooper", 1, 7 },
	{ "swamp_trooper_anti_gungan", 1, 7 },
	{ "veteran_compforce_trooper", 1, 7 },
	{ "bombardier", 8, 13 },
	{ "coa3_information_imperial", 8, 13 },
	{ "coa3_rebel_research_attacker2", 8, 13 },
	{ "coa3_tactical_imperial", 8, 13 },
	{ "comm_operator", 8, 13 },
	{ "command_security_guard", 8, 13 },
	{ "detention_security_guard", 8, 13 },
	{ "imperial_pilot", 8, 13 },
	{ "special_missions_engineer", 8, 13 },
	{ "stormtrooper_black_hole_squad_leader", 8, 13 },
	{ "stormtrooper_bombardier", 8, 13 },
	{ "stormtrooper_squad_leader", 8, 13 },
	{ "stranded_imperial_pilot", 8, 13 },
	{ "imperial_moff", 14, 21 },
	{ "stranded_imperial_officer", 14, 21 },
	{ "assault_trooper", 5, 18 },
	{ "dark_trooper", 5, 18 },
	{ "elite_dark_trooper", 5, 18 },
	{ "elite_sand_trooper", 5, 18 },
	{ "imperial_exterminator", 19, 21 },
	{ "imperial_inquisitor", 19, 21 },
}