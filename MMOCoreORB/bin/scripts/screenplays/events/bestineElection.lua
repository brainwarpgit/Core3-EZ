local ObjectManager = require("managers.object.object_manager")

BestineElectionScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "BestineElectionScreenPlay",


}

ELECTION_ENABLED = 1

local CAMPAIGN_TIME = 23 * 24 *30 * 60 * 1000 -- 23 days Phase 1
local TUNE_TIME = 7 * 24 * 30 * 60 * 1000 -- 7 days (TUNE = Time Until Next Election) Phase 2

local electionMobiles = {
		--{ template = "sean_trenwell", x = 19.4653, z = 3.22324, y = -35.9776, direction = 10, cellID=926483},
		--{ template = "victor_visalis", x = -26.4873, z = 3.22324, y = 20.2943, direction = 146, cellID = 926480},
		--{ template = "tour_aryon", x = -37.3031, z = 1.29422, y = 0.713583, direction = -125, cellID = 926479},
		--{ template = "indigo_siyan", x = 24.6402, z = 3.22324, y = -30.7135, direction = 341.212, cellID = 926483},
		--{ template = "keanna_likyna", x = -18.8886, z = 3.22324, y = 20.608, direction = 214.006, cellID = 926480},
		--{ template = "victor_questp_slums", x= -1357, z=26, y=-3871, direction = -108, cellID=0},
		--{ template = "sean_questp_house", x = 3.0, z = .4, y = -0.2, direction = -111, cellID = 1528397},
		--{ template = "victor_questp_hospital", x = -1294, z = 12, y = -3500, direction = 45, cellID = 0},
		--{ template = "sean_questp_market", x = -1104, z = 12, y = -3705, direction = 20, cellID = 0},
		--{ template = "sean_questn_university", x = 3.6, z = 1.1, y = -4.6, direction = 0, cellID = 1028578},
}

registerScreenPlay("BestineElectionScreenPlay", true)

function BestineElectionScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:doPhaseInit()
		self:spawnMobiles()
		--self:setupTerminals()
	end
end

function BestineElectionScreenPlay:spawnMobiles()
	for i = 1, #electionMobiles do
		local npcData = electionMobiles[i]
		local pNpc = spawnMobile("tatooine", npcData.template, 1, npcData.x, npcData.z, npcData.y, npcData.direction, npcData.cellID)
		self:setMoodString(pNpc, "neutral")
	end


	pNpc = spawnMobile("tatooine", "tour_aryon", 1, -37.30, 1.3, .71, -125, 926479)
	self:setMoodString(pNpc, "neutral")
	writeData("bestine_election:tour_aryon", SceneObject(pNpc):getObjectID())
	local pActiveArea = spawnActiveArea("tatooine", "object/active_area.iff", -1138.5, 13.3, -3560, 10, 0)
	if pActiveArea ~= nil then
		createObserver(ENTEREDAREA, "BestineElectionScreenPlay", "approachTour", pActiveArea)
	end
	--negative quest NPC
--[[	pNpc = spawnMobile("tatooine", "victor_questn_cantina",60,3.1,-0.9,22.6,179,1028651)
	self:setMoodString(pNpc, "npc_sitting_chair")
	pNpc = spawnMobile("tatooine", "victor_questn_capitol",60,6.1,0.3,-0.49,96.7754,926475)
	self:setMoodString(pNpc, "npc_imperial")

	--Merchants if Sean Wins
	--print("	--Merchants if Sean Wins")
	--pNpc = spawnMobile("tatooine", "bestine_merchant", 60, -1135.28, 12,-3688.03, 61, 0)
	--pNpc = spawnMobile("tatooine", "bestine_merchant", 60, -1133.53, 12, -3693.98, 90, 0)
	--pNpc = spawnMobile("tatooine", "bestine_merchant", 60, -1126, 12, -3673.42, -110, 0) --rare stone
	--pNpc = spawnMobile("tatooine", "bestine_merchant", 60, -1115.29, 12, -3709.47, 7, 0)
	--pNpc = spawnMobile("tatooine", "bestine_merchant", 60, -1136.64, 12, -3667.40, -175, 0)
	--spawnSceneObject("tatooine", "object/soundobject/soundobject_marketplace_large.iff", -1124.35, 12.0, -3695.85, 0, 1, 0, 0, 0)

	--Hutt informant quest for Sean
	pNpc = spawnMobile("tatooine", "hutt_informant_quest", 1, -1120, 12,-3639, 160, 0)
	writeData("bestine_election:hutt_informant", SceneObject(pNpc):getObjectID())
	pActiveArea = spawnActiveArea("tatooine", "object/active_area.iff", -1120, 12, -3639, 15,0)
	if pActiveArea ~= nil then
		createObserver(ENTEREDAREA, "BestineElectionScreenPlay", "informantApproach", pActiveArea)

--]]
end



function BestineElectionScreenPlay:createEvent(duration)
	local electionNum = tonumber(getQuestStatus("bestine_election:election_num"))
	if electionNum == nil then
		electionNum = 0
	end
	local eventID = createServerEvent(duration, "BestineElectionScreenPlay", "doPhaseChange", "ElectionPhaseChange")
	setQuestStatus("bestine_election:event_id", eventID)
	electionNum = electionNum + 1
	setQuestStatus("bestine_election:election_num",electionNum)
end

function BestineElectionScreenPlay:doPhaseInit()
	if (ELECTION_ENABLED == 0) then
		return 0
	end

	local phase = self:getCurrentPhase()
	if (phase == nil) then
		self:setCurrentPhase(1)
	end

	if (not hasServerEvent("ElectionPhaseChange")) then
		BestineElectionScreenPlay:createEvent(CAMPAIGN_TIME)
	end
end

function BestineElectionScreenPlay:doPhaseChange()
	if (ELECTION_ENABLED == 0) then
		return 0
	end

	printf("[BestineElection] Initiating phase change.\n")
	--keeping it in phase1 for testing.
	local currentPhase = self:getCurrentPhase()
	if (currentPhase == 1) then
	--	self:setCurrentPhase(2)
	--	if (not hasServerEvent("ElectionPhaseChange")) then
	--		BestineElectionScreenPlay:createEvent(TUNE_TIME)
	--	end
	--else
		self:setCurrentPhase(1)
		if (not hasServerEvent("ElectionPhaseChange")) then
			BestineElectionScreenPlay:createEvent(CAMPAIGN_TIME)
		end
	end
end


function BestineElectionScreenPlay:getCurrentPhase()
	return tonumber(getQuestStatus("bestine_election:currentPhase"))
end

function BestineElectionScreenPlay:setCurrentPhase(phase)
	if (phase >= 3) or (phase <= 0) or (phase == nil) then
		phase = 1
	end
	setQuestStatus("bestine_election:currentPhase", phase)
end

function BestineElectionScreenPlay:getElectionNumber()
	local electionNum = tonumber(getQuestStatus("bestine_election:election_num"))
	if electionNum == nil then
		electionNum = 1
	end
	return electionNum
end

function BestineElectionScreenPlay:isElectionEnabled()
	return ELECTION_ENABLED == 1
end


function BestineElectionScreenPlay:hasAlreadyVoted(pPlayer)
	return false
end

function BestineElectionScreenPlay:canVoteForSean(pPlayer)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if pInventory ~= nil then
		if getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/sean_questp_ctestimony.iff" , true) then
			return true
		elseif getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/sean_questp_mdisk.iff", true) then
			return true
		elseif getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/sean_questp_htestimony.iff", true) then
			return true
		end
	end
	return false
end

function BestineElectionScreenPlay:canVoteForVictor(pPlayer)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if pInventory ~= nil then
		if getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/victor_questp_testimony.iff" , true) then
			return true
		elseif getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/victor_questp_jregistry.iff", true) then
			return true
		elseif getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/victor_questp_receipt.iff", true) then
			return true
		end
	end
	return false
end


function BestineElectionScreenPlay:getPhaseTimeLeft(pPlayer)
	local eventID = getServerEventID("ElectionPhaseChange")
	if (eventID == nil) then
		return
	end
	local timeLeft = getServerEventTimeLeft(eventID) / 1000
	local daysLeft = math.floor(timeLeft / (24 * 60 * 60))
	local hoursLeft = math.floor((timeLeft / 3600) % 24)
	local minutesLeft = math.floor((timeLeft / 60) % 60)
	local secondsLeft = math.floor(timeLeft % 60)
	local timeString = "Time left in current Election Phase: " .. daysLeft .. " days, " .. hoursLeft .. " hours, " .. minutesLeft .. " minutes, " .. secondsLeft .. " seconds."
	if pPlayer ~= nil then 	CreatureObject(pPlayer):sendSystemMessage(timeString) end
	return timeLeft
end

function BestineElectionScreenPlay:hasFullInventory(pPlayer)
	if (pPlayer == nil) then
		return true
	end
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
	if (pInventory == nil) then
		return true
	end
	return SceneObject(pInventory):isContainerFullRecursive()
end

function BestineElectionScreenPlay:setupTerminals()
	local pTerminal = getSceneObject(5565564) --terminal in victors office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionVictorTerminalMenuComponent")

	pTerminal = getSceneObject(5565562) --desk in seans office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSeanDeskMenuComponent")

	pTerminal = getSceneObject(5565563) --terminal in seans office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSeanTerminalMenuComponent")

	pTerminal = getSceneObject(4475579) --other desk in seans office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSeanDesk2MenuComponent")
	--4475571 SEans table
	pTerminal = getSceneObject(4475571) --other desk in seans office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionFakeSearchMenuComponent")

	pTerminal = getSceneObject(4475517) --other desk in seans office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionFakeSearchMenuComponent")

	pTerminal = getSceneObject(5565565) --other desk in seans office
	SceneObject(pTerminal):setObjectMenuComponent("BestineElectionFakeSearchMenuComponent")
	--4475517 victors desk
	--5565565 victors table

end

function BestineElectionScreenPlay:approachTour(pActiveArea, pMovingObject)
	if (pMovingObject == nil or pActiveArea == nil or not SceneObject(pMovingObject):isCreatureObject()) then
		return 0
	end
	if (CreatureObject(pMovingObject):isAiAgent() and not AiAgent(pMovingObject):isPet()) then
		return 0
	end
	local tourID = readData("bestine_election:tour_aryon")
	local pTour = getSceneObject(tourID)
	SceneObject(pTour):faceObject(pMovingObject, true)
	return 0
end

function BestineElectionScreenPlay:informantApproach(pActiveArea, pMovingObject)
	if (pMovingObject == nil or pActiveArea == nil or not SceneObject(pMovingObject):isCreatureObject()) then
		return 0
	end
	if (CreatureObject(pMovingObject):isAiAgent() and not AiAgent(pMovingObject):isPet()) then
		return 0
	end
	local informantId = readData("bestine_election:hutt_informant")
	local pInformant = getSceneObject(informantId)

	if pInformant ~= nil then
		local pInventory = CreatureObject(pMovingObject):getSlottedObject("inventory")
		if pInventory ~= nil then
			if (getContainerObjectByTemplate(pInventory, "object/tangible/loot/quest/sean_history_disk.iff" , true) ~= nil) then
				SceneObject(pInformant):faceObject(pMovingObject, true)
				spatialChat(pInformant, "@bestine:come_here")
			end
		end
	end
	return 0
end


tour_aryon_conv_handler = tourAryonConvoHandler:new {
	themePark = BestineElection
}
--[[
keanna_likyna_conv_handler = keannaLikynaConvoHandler:new {
	themePark = BestineElection
}

indigo_siyan_conv_handler = indigoSiyanConvoHandler:new {
	themePark = BestineElection
}
sean_trenwell_conv_handler = seanTrenwellConvoHandler:new {
	themePark = BestineElection
}

victor_visalis_conv_handler = victorVisalisConvoHandler:new {
	themePark = BestineElection
}

victor_questn_cantina_conv_handler = victorQuestnCantinaConvoHandler:new {
	themePark = BestineElection
}

victor_questn_capitol_conv_handler = victorQuestnCapitolConvoHandler:new {
	themePark = BestineElection
}

sean_questn_university_conv_handler = seanQuestnUniversityConvoHandler:new {
	themePark = BestineElection
}

hutt_informant_conv_handler = huttInformantConvoHandler:new {
	themePark = BestineElection
}
--]]