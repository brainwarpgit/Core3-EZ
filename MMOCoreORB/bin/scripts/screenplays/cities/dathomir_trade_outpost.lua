DathomirTradeOutpostScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "DathomirTradeOutpostScreenPlay",

	planet = "dathomir",

	combatPatrol = {"commando", "commoner_technician", "mercenary", "miner", "sharpshooter"},
	patrolNpcs = {"businessman_patrol", "commoner_fat_patrol", "commoner_old_patrol", "commoner_patrol"},

	patrolMobiles = {
		--{patrolPoints, template, level, x, z, y, direction, cell, mood},

		--Droids
		{"r4_1", "r4", 1, 620, 6, 3088, 191.123, 0, "", false},
		{"r4_2", "r4", 1, 619.822, 6, 3097.36, 339.758, 0, "", false},
		{"r5_1", "r5", 1, 627.744, 6, 3086.77, 278.522, 0, "", false},

		--NPCs
		{"npc_1", "combatPatrol", 300, 559, 6, 3076, 297, 0, "", true},
		{"npc_2", "combatPatrol", 300, 566, 6, 3070, 284, 0, "", true},
		{"npc_3", "combatPatrol", 300, 578, 6, 3092, 253, 0, "", true},
		{"npc_4", "patrolNpc", 1, 590, 6, 3058, 264, 0, "", false},
		{"npc_5", "patrolNpc", 1, 577, 6, 3100, 52, 0, "", false},
		{"npc_6", "patrolNpc", 1, 616, 6, 3056, 135.38, 0, "", false},
	},

	patrolPoints = {
		--table_name = {{x, z, y, cell, delayAtNextPoint}} 1 = no delay 0 = delay
		r4_1 = {{620, 6, 3085, 0, 1}, {620, 6, 3065, 0, 1}, {599, 6, 3058, 0, 1}, {590, 6, 3080, 0, 1}, {618, 6, 3089, 0, 0}},
		r4_2 = {{620, 6, 3089, 0, 1}, {613, 6, 3106, 0, 0}, {607, 6, 3109, 0, 1}, {615, 6, 3108, 0, 0}, {623, 6, 3101, 0, 1}, {619, 6, 3087, 0, 0}},
		r5_1 = {{633, 6, 3084, 0, 1}, {622, 6, 3086, 0}, {636, 6, 3085, 0, 1}, {637, 6, 3044, 0, 1}, {619, 6, 3029, 0, 1}, {619, 6, 3043, 0}, {637, 6, 3044, 0, 1}},

		npc_1 = {{559, 6, 3076, 0, 0}, {536, 8, 3077, 0, 0}, {546, 7, 3085, 0, 0}, {556, 6, 3083, 0, 0}, {538, 8, 3091, 0, 0}},
		npc_2 = {{566, 6, 3070, 0, 0}, {569, 6, 3085, 0, 0}, {581, 6, 3071, 0, 0}, {578, 6, 3072, 0, 0}},
		npc_3 = {{578, 6, 3092, 0, 0}, {585, 6, 3082, 0, 0}, {584, 6, 3102, 0, 0}, {592, 6, 3097, 0, 0}},
		npc_4 = {{590, 6, 3058, 0, 0}, {599, 6, 3071, 0, 0}, {605, 6, 3066, 0, 0}, {610, 6, 3049, 0, 0}, {596, 6, 3051, 0, 0}},
		npc_5 = {{577, 6, 3100, 0, 0}, {568, 6, 3106, 0, 0}, {563, 6, 3092, 0, 0}, {556, 6, 3099, 0, 0}, {590, 6, 3108, 0, 0}},
		npc_6 = {{616, 6, 3056, 0, 0}, {610, 6, 3065, 0, 0}, {617, 6, 3072, 0, 0}, {609, 6, 3052, 0, 0}},
	},
}

registerScreenPlay("DathomirTradeOutpostScreenPlay", true)

function DathomirTradeOutpostScreenPlay:start()
	if (isZoneEnabled("dathomir")) then
		self:spawnMobiles()
		self:spawnPatrolMobiles()
	end
end

function DathomirTradeOutpostScreenPlay:spawnMobiles()

	--In buildings
	local pNpc = spawnMobile("dathomir", "scientist",60,5.7,0.6,-6.3,-132,6955370)
	self:setMoodString(pNpc, "conversation")
	spawnMobile("dathomir", "noble", 60, 3.00888, 0.125266, -2.92449, -90, 1392894)
	spawnMobile("dathomir", "businessman", 60, 6.94935, 0.624998, 2.6394, 198.079, 6955367)
	spawnMobile("dathomir", "businessman", 60, -8.09806, 0.625, 4.31086, 153.675, 6955368)
	spawnMobile("dathomir", "nirame_sakute", 60, -2.1912, 0.624999, -6.92293, 24.0649, 6955369)

	--Outside
	spawnMobile("dathomir", "businessman", 60, 594.44, 6, 3087.13, 181.146, 0)
	spawnMobile("dathomir", "businessman", 60, 614.681, 6, 3081.65, 80.4705, 0)
	pNpc = spawnMobile("dathomir", "commoner", 60, 597.6, 6, 3048.5, 135, 0)
	self:setMoodString(pNpc, "conversation")
	pNpc = spawnMobile("dathomir", "commoner", 60, 598.679, 6, 3046.85, 315, 0)
	self:setMoodString(pNpc, "conversation")
	spawnMobile("dathomir", "commoner", 60, 621.667, 6, 3092.75, 351.148, 0)
	spawnMobile("dathomir", "scientist", 60, 623.05, 6, 3037.98, 54.874, 0)
	spawnMobile("dathomir", "informant_npc_lvl_3", 0,590,6,3091,-31,0)
	spawnMobile("dathomir", "informant_npc_lvl_3", 0,598,6,3025,180,0)

end
