global_imperial_probot_handler_drone_camp_imperial_small_theater = Lair:new {
	mobiles = {
		{"droid_corps_junior_technician",1},
		{"imperial_probe_drone",3},	
	},
	spawnLimit = 9,
	buildingsVeryEasy = {"object/building/poi/anywhere_imperial_base_small_1.iff","object/building/poi/lok_imperial_small1.iff","object/building/poi/lok_imperial_small2.iff"},
	buildingsEasy = {"object/building/poi/anywhere_imperial_base_small_1.iff","object/building/poi/lok_imperial_small1.iff","object/building/poi/lok_imperial_small2.iff"},
	buildingsMedium = {"object/building/poi/anywhere_imperial_base_small_1.iff","object/building/poi/lok_imperial_small1.iff","object/building/poi/lok_imperial_small2.iff"},
	buildingsHard = {"object/building/poi/anywhere_imperial_base_small_1.iff","object/building/poi/lok_imperial_small1.iff","object/building/poi/lok_imperial_small2.iff"},
	buildingsVeryHard = {"object/building/poi/anywhere_imperial_base_small_1.iff","object/building/poi/lok_imperial_small1.iff","object/building/poi/lok_imperial_small2.iff"},
	missionBuilding = "object/tangible/lair/base/objective_banner_imperial.iff",
	mobType = "npc",
	buildingType = "theater",
	faction = "imperial"
}

addLairTemplate("global_imperial_probot_handler_drone_camp_imperial_small_theater", global_imperial_probot_handler_drone_camp_imperial_small_theater)
