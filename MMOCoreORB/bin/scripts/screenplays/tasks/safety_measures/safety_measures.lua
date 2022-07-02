local QuestManager = require("managers.quest.quest_manager")

SafetyMeasures = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "SafetyMeasures",

	KILLWORRTS = 1,
	KILLRILLS = 2,
	KILLBRIGANDS = 3,
	BRIGANDCAMP = 4,
	BRIGANDLEADER = 5,

	questGiver = "gerak_vurtimis",
	planet = "tatooine",
	questGiverLocation = {-1254, 12, -3617},
	brigandCampLocation = {1144, 151, -3920},

	mobiles = {
		-- Quest Gives
		{"gerak_vurtimis", -1254, 12, -3617, 0, 0},

		-- Brigand Camp: brigand_leader, brigand_assassin, brigand_scout, brigand
		-- Camp Center
		{"brigand", 1150, 151, -3920},
		{"brigand", 1145, 151, -3927},
		{"brigand", 1140, 151, -3922},
		{"brigand_assassin", 1138, 151, -3920},

		-- outside of camp
		{"brigand_scout", 1127, 158, -3904},
	},

	brigandCampObjects = {
		{"object/static/structure/general/trash_pile_s01.iff", -0.900, -0.103, 0.959, 0},
		{"object/static/structure/corellia/corl_tent_hut_s01.iff", -1.393, 0.011, 2.875, 0 },
		{"object/static/structure/general/camp_lawn_chair_s01.iff", -0.205, -0.145, -1.388, -145.141},
		{"object/static/structure/general/campfire_smoldering.iff", 2.029, 0.303, -3.361, 0},
		{"object/static/structure/general/camp_cot_s01.iff", 0.468, -0.066, 0.915, 123.759}
	},
}

registerScreenPlay("SafetyMeasures", true)

function SafetyMeasures:start()
	if (not isZoneEnabled(self.planet)) then
		return
	end

	self:spawnBrigandCamp1()
	self:spawnMobiles()
end

function SafetyMeasures:spawnBrigandCamp1()
	local x = self.brigandCampLocation[1]
	local y = self.brigandCampLocation[3]

	-- Spawn Theater for terrain
	spawnTheaterObject(self.planet, x, getWorldFloor(x, y, self.planet), y, true)

	-- Spawn Active Area: onEntry observer to spawn the leader when player is on that portion of the quest
	local pActiveArea = spawnActiveArea(self.planet, "object/active_area.iff", x, getWorldFloor(x, y, self.planet), y, 32, 0)

	if (pActiveArea ~= nil) then
		createObserver(ENTEREDAREA, "SafetyMeasures", "onEnteredCamp1Area", pActiveArea)
	end

	-- Spawn Camp Area Decor
	for i = 1, #self.brigandCampObjects, 1 do
		local object = self.brigandCampObjects[i]

		spawnSceneObject(self.planet, object[1], object[2] + x, object[3] + 151, object[4] + y, 0, object[5])
	end

	createNavMesh(self.planet, x, y, 64, true, "brigand_camp1")
end

function SafetyMeasures:spawnMobiles()
	for i = 1, #self.mobiles, 1 do
		local mobile = self.mobiles[i]

		local pMobile = spawnMobile(self.planet, mobile[1], -1, mobile[2], mobile[3], mobile[4], 0, 0)

		if (pMobile ~= nil and string.find(mobile[1], "brigand")) then
			createObserver(CREATUREDESPAWNED, "SafetyMeasures", "onDespawn", pMobile)

			local mobID = SceneObject(pMobile):getObjectID()
			writeData(mobID .. ":SafetyMeasures:mobID:", i)
		end
	end
end

function SafetyMeasures:startQuest(pPlayer, pNpc, quest)
	if (pPlayer == nil or pNpc == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local ghost = LuaPlayerObject(pGhost)
	local playerID = SceneObject(pPlayer):getObjectID()

	if (quest == self.KILLWORRTS) then
		ghost:activateJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY1, true)
		createObserver(KILLEDCREATURE, "SafetyMeasures", "notifyKilledCreature", pPlayer)

		local waypointID = ghost:addWaypoint(self.planet, "Gerak Vertimis", "Gerak Vertimis", self.questGiverLocation[1], self.questGiverLocation[3], WAYPOINTYELLOW, true, true, 0, 0)
		writeData(playerID .. ":SafetyMeasures:waypointID:", waypointID)
		CreatureObject(pNpc):doAnimation("nod")
	elseif (quest == self.KILLRILLS) then
		ghost:activateJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY2, true)
		createObserver(KILLEDCREATURE, "SafetyMeasures", "notifyKilledCreature", pPlayer)

		local waypointID = ghost:addWaypoint(self.planet, "Gerak Vertimis", "Gerak Vertimis", self.questGiverLocation[1], self.questGiverLocation[3], WAYPOINTYELLOW, true, true, 0, 0)
		writeData(playerID .. ":SafetyMeasures:waypointID:", waypointID)
		CreatureObject(pNpc):doAnimation("nod")
	elseif (quest == self.KILLBRIGANDS) then
		ghost:activateJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY3, true)
		createObserver(KILLEDCREATURE, "SafetyMeasures", "notifyKilledCreature", pPlayer)

		local waypointID = ghost:addWaypoint(self.planet, "Brigand Camp", "Brigand Camp", self.brigandCampLocation[1], self.brigandCampLocation[3], WAYPOINTYELLOW, true, true, 0, 0)
		writeData(playerID .. ":SafetyMeasures:waypointID:", waypointID)
		CreatureObject(pNpc):doAnimation("bow")
	elseif (quest == self.BRIGANDCAMP) then
		ghost:activateJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY2, true)



	elseif (quest == self.BRIGANDLEADER) then
		ghost:activateJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY2, true)

		createObserver(KILLEDCREATURE, "SafetyMeasures", "notifyKilledCreature", pPlayer)
	end

	CreatureObject(pNpc):doAnimation("nod")
end

function SafetyMeasures:completeQuest(pPlayer, pNpc, quest)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local ghost = LuaPlayerObject(pGhost)
	local playerID = SceneObject(pPlayer):getObjectID()

	if (quest == self.KILLWORRTS) then
		ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY1, 1, true)
		ghost:completeJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY1, true)
	elseif (quest == self.KILLRILLS) then
		ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY2, 1, true)
		ghost:completeJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY2, true)
	elseif (quest == self.KILLBRIGANDS) then
		ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY3, 1, true)
		ghost:completeJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY3, true)
	elseif (quest == self.BRIGANDCAMP) then
		ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY4, 1, true)
		ghost:completeJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY4, true)
	elseif (quest == self.BRIGANDLEADER) then
		ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY5, 1, true)
		ghost:completeJournalQuest(QuestManager.questCRC.QUEST_LF_SAFETY5, true)
	end

	local waypointID = readData(playerID .. ":SafetyMeasures:waypointID:")
	ghost:removeWaypoint(waypointID, true)

	if (pNpc ~= nil) then
		CreatureObject(pNpc):doAnimation("applause_excited")
	end
end

function SafetyMeasures:grantReward(pPlayer, quest)
	if (pPlayer == nil) then
		return
	end




end

function SafetyMeasures:respawn(mob, spawnNumber)
	local mobile = self.mobiles[spawnNumber]

	local pMobile = spawnMobile(self.planet, mobile[1], -1, mobile[1], mobile[2], mobile[3], 0, 0)

	if (pMobile ~= nil and string.find(mobile[1], "brigand")) then
		createObserver(CREATUREDESPAWNED, "SafetyMeasures", "onDespawn", pMobile)

		local mobID = SceneObject(pMobile):getSceneObject()
		writeData(mobID .. ":SafetyMeasures:mobID:", spawnNumber)
	end
end

--[[

	========== Observers ==========

]]

function SafetyMeasures:notifyKilledCreature(pPlayer, pVictim)
	if (pPlayer == nil or pVictim == nil) then
		return 0
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local ghost = LuaPlayerObject(pGhost)

	local victimName = SceneObject(pVictim):getObjectName()
	local playerID = SceneObject(pPlayer):getObjectID()

	print("Safety Measures - notifyKilledCreature for player ID: " .. playerID .. " killing Victim: " .. victimName)

	if (ghost:isJournalQuestActive(QuestManager.questCRC.QUEST_LF_SAFETY1) and victimName == "worrt") then
		local totalKilled = readData(playerID .. ":SafetyMeasures:killCount:") + 1

		print("active quest = true with totalKilled = " .. totalKilled)

		if (totalKilled >= 10) then
			ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY1, 0, true)
			ghost:activateJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY1, 1, true)

			self:grantReward(pPlayer, self.KILLWORRTS)
			deleteData(playerID .. ":SafetyMeasures:killCount:")
			return 1
		end

		writeData(playerID .. ":SafetyMeasures:killCount:", totalKilled)
	elseif (ghost:isJournalQuestActive(QuestManager.questCRC.QUEST_LF_SAFETY2) and victimName == "rill") then
		local totalKilled = readData(playerID .. ":SafetyMeasures:killCount:") + 1

		print("active quest = true with totalKilled = " .. totalKilled)

		if (totalKilled >= 10) then
			ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY2, 0, true);
			ghost:activateJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY2, 1, true);

			self:grantReward(pPlayer, self.KILLRILLS)
			deleteData(playerID .. ":SafetyMeasures:killCount:")
			return 1
		end

		writeData(playerID .. ":SafetyMeasures:killCount:", totalKilled)
	elseif (ghost:isJournalQuestActive(QuestManager.questCRC.QUEST_LF_SAFETY3) and string.find(victimName, "brigand")) then
		local totalKilled = readData(playerID .. ":SafetyMeasures:killCount:") + 1

		print("active quest = true with totalKilled = " .. totalKilled)

		if (totalKilled >= 12) then
			ghost:completeJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY3, 0, true);
			ghost:activateJournalQuestTask(QuestManager.questCRC.QUEST_LF_SAFETY3, 1, true);

			self:grantReward(pPlayer, self.KILLBRIGANDS)
			deleteData(playerID .. ":SafetyMeasures:killCount:")
			return 1
		end

		writeData(playerID .. ":SafetyMeasures:killCount:", totalKilled)
	end

	return 0
end


-- Persistent Entered Area Observer to spawn leader if not already spawned and player with mission enters area
function SafetyMeasures:onEnteredCamp1Area(pActiveArea, pCreature)
	if (pCreature == nil or not SceneObject(pCreature):isPlayerCreature()) then
		return 0
	end

	local pGhost = CreatureObject(pCreature):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local ghost = LuaPlayerObject(pGhost)

	if (ghost:isJournalQuestActive(QuestManager.questCRC.QUEST_LF_SAFETY5)) then
		local leaderID = readData("SafetyMeasures:brigandLeader:")
		local pLeader = getSceneObject(leaderID)

		if (pLeader ~= nil and not CreatureObject(pLeader):isDead()) then
			return 0
		end

		local x = self.brigandCampLocation[1]
		local y = self.brigandCampLocation[3]

		pLeader = spawnMobile(self.planet, "brigand_leader", -1, x, getWorldFloor(x, y), y, 0, 0)

		if (pLeader ~= nil) then
			leaderID = SceneObject(pLeader):getObjectID()

			writeData("SafetyMeasures:brigandLeader:", leaderID)
		end
	end

	return 0
end

function SafetyMeasures:onDespawn(pMobile)
	if pMobile == nil or not SceneObject(pMobile):isAiAgent() then
		return
	end

	local mobID = SceneObject(pMobile):getObjectID()
	local mobNum = readData(mobID .. ":SafetyMeasures:mobID:")

	createEvent(300 * 1000, "SafetyMeasures", "respawn", nil, mobNum)
	deleteData(mobID .. ":SafetyMeasures:mobID:")

	return 1
end
