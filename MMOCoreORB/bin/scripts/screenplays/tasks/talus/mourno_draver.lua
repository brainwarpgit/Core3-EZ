buildingMourno =
	{ 
		type = "destructible",
		building = { template = "object/building/military/pirate_warehouse.iff", planet = "talus" },
		terminal = { template = "object/tangible/terminal/terminal_destructible_building.iff", vectorCellID = 3, x = 0, z = 0.3, y = -6.0 },
		childNpcs = 
		{
			{ npcTemplate = "mourno_surveyor", npcName = "Hutt Expeditionary Force Surveyor", vectorCellID = 3, x = 0, z = 0.3, y = -3.0 }
		}
	}

mourno_draver_missions =
	{
		{
			missionType = "assassinate",
			primarySpawns =
			{
				{ npcTemplate = "mourno_criminal", planetName = "talus", npcName = "Criminal" }
			},
			secondarySpawns =
			{
				{ npcTemplate = "mourno_thug", planetName = "talus", npcName = "a Thug" },
				{ npcTemplate = "mourno_thug", planetName = "talus", npcName = "a Thug" },
			},
			itemSpawns = {	},
			rewards =
			{
				{ rewardType = "credits", amount = 75 },
			}
		},
		{
			missionType = "destroy", 
			buildingSpawn = buildingMourno,
			primarySpawns = { },
			secondarySpawns =	{ { npcTemplate = "mourno_thug", planetName = "talus", npcName = "a Thug" }, { npcTemplate = "mourno_thug", planetName = "talus", npcName = "a Thug" } },
			itemSpawns = {	},
			rewards =
			{
				{ rewardType = "credits", amount = 100 },
			}
		}
	}

npcMapMournoDraver =
	{
		{
			spawnData = { planetName = "talus", npcTemplate = "mourno_draver", x = -21.1, z = 2.13, y = 74.72, direction = 63.52, cellID = 3175573, position = STAND },
			worldPosition = { x = 518, y = -3075 },
			npcNumber = 1,
			stfFile = "@static_npc/talus/talus_dearic_mourno_draver",
			missions = mourno_draver_missions
		},
	}

MournoDraver = ThemeParkLogic:new {
	numberOfActs = 1,
	npcMap = npcMapMournoDraver,
	className = "MournoDraver",
	screenPlayState = "mourno_draver_quest",
	distance = 800,
	missionCompletionMessageStf = "@theme_park/messages:static_completion_message",
}

registerScreenPlay("MournoDraver", true)

mourno_draver_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = MournoDraver
}
mourno_draver_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = MournoDraver
}