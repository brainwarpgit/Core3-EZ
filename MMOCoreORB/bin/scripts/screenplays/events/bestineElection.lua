local ObjectManager = require("managers.object.object_manager")

BestineElectionScreenPlay = ScreenPlay:new {}

BESTINE_ELECTION_ENABLED = 1

-- TESTING 2 MINUTES EACH PHASE
--local CAMPAIGN_TIME = 2 * 60 * 1000
--local TUNE_TIME = 2 * 60 * 1000
--PROD - 30 DAYS EACH PHASE
--local CAMPAIGN_TIME = 30 * 24 * 60 * 60 * 1000 -- 30 days Phase 1
--local TUNE_TIME = 30 * 24 * 60 * 60 * 1000 -- 30 days (TUNE = Time Until Next Election) Phase 2
--QA - 48 HRS & 24 HOURS TESTING
local CAMPAIGN_TIME = 2 * 24 * 60 * 60 * 1000 -- 48 hours
local TUNE_TIME = 24 * 60 * 60 * 1000 -- 24 hours (TUNE = Time Until Next Election) Phase 2

local electionMobiles = {
	{ template = "sean_trenwell", x = 19.46, z = 3.22, y = -35.97, direction = 10, cellID=926483, moodString = "neutral", breech = 0},
	{ template = "victor_visalis", x = -26.48, z = 3.23, y = 20.29, direction = 146, cellID = 926480, moodString = "neutral", breech = 0},
	{ template = "tour_aryon", x = -37.31, z = 1.29, y = 0.71, direction = -125, cellID = 926479, moodString = "neutral", breech = 10},
	{ template = "indigo_siyan", x = 24.64, z = 3.22, y = -30.71, direction = 341.212, cellID = 926483, moodString = "neutral", breech = 0},
	{ template = "keanna_likyna", x = -18.88, z = 3.22, y = 20.6, direction = 214.006, cellID = 926480, moodString = "neutral", breech = 0},
	{ template = "victor_questn_capitol", x = 6.1, z = 0.3, y = -0.49,direction = 96.7754, cellID = 926475, moodString = "npc_imperial", breech = 4},
	{ template = "victor_questn_cantina", x = 3.1, z = -0.9, y = 22.6, direction = 179, cellID = 1028651, moodString = "npc_sitting_chair", breech = 0},
	{ template = "victor_questp_slums", x= -1357, z=26, y=-3871, direction = -108, cellID=0, moodString = "neutral", breech = 4},
	{ template = "sean_questp_house", x = 3.0, z = .4, y = -0.2, direction = -111, cellID = 1528397, moodString = "neutral", breech = 4},
	{ template = "victor_questp_hospital", x = -1294, z = 12, y = -3500, direction = 45, cellID = 0, moodString = "neutral", breech = 4},
	{ template = "sean_questp_market", x = -1104, z = 12, y = -3705, direction = 20, cellID = 0, moodString = "neutral", breech = 4},
	{ template = "sean_questn_university", x = 3.6, z = 1.1, y = -4.6, direction = 0, cellID = 1028578, moodString = "neutral", breech = 8},
	{ template = "sean_contact_quest", x = -1448, z = 10, y = -3765, direction = 0, cellID = 0, moodString = "neutral", breech = 4},
	{ template = "seans_historian", x = -758, z = 10.5, y = -3907, direction = 0, cellID = 0, moodString = "neutral", breech = 4},
}

local rumorMobiles = {
	{ template = "bestine_rumor01", x = -1095.68, z = 12, y = -3640.98, direction = 281, cellID=0, moodString = "neutral", breech = 6},
	{ template = "bestine_rumor02", x = -1205, z = 12, y = -3539, direction = 80, cellID=0, moodString = "neutral", breech = 6},
	{ template = "bestine_rumor03", x = -1211, z = 12, y = -3637.48, direction = 26, cellID=0, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor04", x = -1145.53, z = 12, y = -3656.31, direction = 21, cellID=0, moodString = "neutral", breech = 6},
	{ template = "bestine_rumor05", x = -1013, z = 12, y = -3695, direction = 233, cellID=0, moodString = "neutral", breech = 6},
	{ template = "bestine_rumor06", x = -1088, z = 12, y = -3656, direction = 201, cellID=0, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor07", x = -1048, z = 12, y = -3699, direction = 53, cellID=0, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor08", x = -1174, z = 12, y = -3635.8, direction = 221, cellID=0, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor09", x = 0.69, z = 0.5, y = -2.4 , direction = -107, cellID=1028169, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor10", x = -1106.31, z = 14, y = -3697.59, direction = -177, cellID=0, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor11", x = -1221, z = 12, y = -3650, direction = -49, cellID=0, moodString = "neutral", breech = 4},
	{ template = "bestine_rumor12", x = -1291, z = 12, y = -3634, direction = 301, cellID=0, moodString = "neutral", breech = 6},
}

local capitolMobiles = {
	{ template = "bestine_capitol01", x = -0.7, z = 3.22, y = 21.1, direction = 187, cellID=926474, moodString = "neutral", breech = 4},
	{ template = "bestine_capitol02", x = -23.29, z = 1.3, y = -10.39, direction = 234, cellID=926475, moodString = "neutral", breech = 4},
	{ template = "bestine_capitol03", x = -3.78, z = 2.27, y = -25.85, direction = 158, cellID=926475, moodString = "neutral", breech = 4},
	{ template = "bestine_capitol04", x = 2.26, z = 7.9, y = -37.38, direction = 304, cellID=926476, moodString = "neutral", breech = 4},
}

local seanMerchants = {
	{template = "bestine_merchant", x = -1135.28, z = 12, y = -3688.03, direction = 61},
	{template = "bestine_merchant", x = -1136.64, z =  12, y =  -3667.40, direction = -175},
	{template = "bestine_merchant", x = -1115.29, z =  12, y =  -3709.47, direction = 7},
	{template = "bestine_merchant", x = -1133.53, z =  12, y =  -3693.98, direction = 90},
	{template = "bestine_stone_merchant", x = -1127, z =  12, y =  -3674, direction = -110},
}

local seanEvidence = {"object/tangible/loot/quest/sean_questp_ctestimony.iff", "object/tangible/loot/quest/sean_questp_mdisk.iff", "object/tangible/loot/quest/sean_questp_htestimony.iff"}
local victorEvidence = {"object/tangible/loot/quest/victor_questp_testimony.iff","object/tangible/loot/quest/victor_questp_jregistry.iff", "object/tangible/loot/quest/victor_questp_receipt.iff"}


registerScreenPlay("BestineElectionScreenPlay", true)

function BestineElectionScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:doPhaseInit()
		self:spawnMobiles()
		self:setupTerminals()
	end
end

function BestineElectionScreenPlay:spawnMobiles()
	for i = 1, #electionMobiles do
		local npcData = electionMobiles[i]
		local pNpc = spawnMobile("tatooine", npcData.template, 60, npcData.x, npcData.z, npcData.y, npcData.direction, npcData.cellID)
		if (pNpc ~= nil) then
			self:setMoodString(pNpc, npcData.moodString)
			if npcData.template == "tour_aryon" then
				SceneObject(pNpc):setContainerComponent("TourContainerComponent")
			end
			if npcData.breech > 0 then
				local pActiveArea = spawnActiveArea("tatooine", "object/active_area.iff", SceneObject(pNpc):getWorldPositionX(),SceneObject(pNpc):getWorldPositionZ(),SceneObject(pNpc):getWorldPositionY(), npcData.breech, 0)
				if pActiveArea ~= nil then
					local areaID = SceneObject(pActiveArea):getObjectID()
					writeData(areaID .. ":OwnerID", SceneObject(pNpc):getObjectID())
					createObserver(ENTEREDAREA, "BestineElectionScreenPlay", "spawnApproach", pActiveArea)
				end
			end
		end
	end

	for i = 1, #capitolMobiles do
		local npcData = capitolMobiles[i]
		local pNpc = spawnMobile("tatooine", npcData.template, 60, npcData.x, npcData.z, npcData.y, npcData.direction, npcData.cellID)
		if (pNpc ~= nil) then
			self:setMoodString(pNpc, npcData.moodString)
			if npcData.breech > 0 then
				local pActiveArea = spawnActiveArea("tatooine", "object/active_area.iff", SceneObject(pNpc):getWorldPositionX(),SceneObject(pNpc):getWorldPositionZ(),SceneObject(pNpc):getWorldPositionY(), npcData.breech, 0)
				if pActiveArea ~= nil then
					local areaID = SceneObject(pActiveArea):getObjectID()
					writeData(areaID .. ":OwnerID", SceneObject(pNpc):getObjectID())
					createObserver(ENTEREDAREA, "BestineElectionScreenPlay", "spawnApproach", pActiveArea)
				end
			end
		end
	end

	for i = 1, #rumorMobiles do
		local npcData = rumorMobiles[i]
		local pNpc = spawnMobile("tatooine", npcData.template, 60, npcData.x, npcData.z, npcData.y, npcData.direction, npcData.cellID)
		if pNpc ~= nil then
			self:setMoodString(pNpc, npcData.moodString)
			if npcData.breech > 0 then
				local pActiveArea = spawnActiveArea("tatooine", "object/active_area.iff", SceneObject(pNpc):getWorldPositionX(),SceneObject(pNpc):getWorldPositionZ(),SceneObject(pNpc):getWorldPositionY(), npcData.breech, 0)
				if pActiveArea ~= nil then
					local areaID = SceneObject(pActiveArea):getObjectID()
					writeData(areaID .. ":OwnerID", SceneObject(pNpc):getObjectID())
					createObserver(ENTEREDAREA, "BestineElectionScreenPlay", "spawnApproach", pActiveArea)
				end
			end
		end
	end

	--Hutt informant quest for Sean
	local pNpc = spawnMobile("tatooine", "hutt_informant_quest", 1, -1120, 12,-3639, 160, 0)
	if (pNpc ~= nil) then
		writeData("bestine_election:hutt_informant", SceneObject(pNpc):getObjectID())
		local pActiveArea = spawnActiveArea("tatooine", "object/active_area.iff", -1120, 12, -3639, 15,0)
		if pActiveArea ~= nil then
			createObserver(ENTEREDAREA, "BestineElectionScreenPlay", "informantApproach", pActiveArea)
		end
	end
end

function BestineElectionScreenPlay:spawnMerchants()
	print("spawning Merchants")
	for i = 1, #seanMerchants do
		local npcData = seanMerchants[i]
		local pNpc = spawnMobile("tatooine", npcData.template, 0, npcData.x, npcData.z, npcData.y, npcData.direction, 0)
		if (pNpc ~= nil) then
			local mobileID = SceneObject(pNpc):getObjectID()
			writeData("bestine_election:merchants:" .. i, mobileID)
			print("spawning bestine_election:merchants:" .. i, mobileID)
		end
	end
	local pSnd = spawnSceneObject("tatooine", "object/soundobject/soundobject_marketplace_large.iff", -1124, 12, -3695, 0, 0)
	if (pSnd ~= nil) then
		local mobileID = SceneObject(pSnd):getObjectID()
		writeData("bestine_election:merchants:marketsound", mobileID)
	end
end

function BestineElectionScreenPlay:despawnMerchants()
	for i = 1, #seanMerchants do
		local objectID = readData("bestine_election:merchants:" .. i)
		local pMobile = getSceneObject(objectID)
		if (pMobile ~= nil) then
			SceneObject(pMobile):destroyObjectFromWorld()
			deleteData("bestine_election:merchants:" .. i)
		end
	end
	local marketSoundID = readData("bestine_election:merchants:marketsound")
	local pSnd = getSceneObject(marketSoundID)
	if (pSnd ~= nil) then
		SceneObject(pSnd):destroyObjectFromWorld()
		deleteData("bestine_election:merchants:object:marketsound")
	end
end

function BestineElectionScreenPlay:createEvent(duration)
	local eventID = createServerEvent(duration, "BestineElectionScreenPlay", "doPhaseChange", "ElectionPhaseChange")
	setQuestStatus("bestine_election:event_id", eventID)
end

function BestineElectionScreenPlay:doPhaseInit()
	if (not BestineElectionScreenPlay:isElectionEnabled()) then
		return
	end

	local phase = self:getCurrentPhase()
	if (phase == nil) then
		BestineElectionScreenPlay:setCurrentPhase(1)
	end

	if (not hasServerEvent("ElectionPhaseChange")) then
		BestineElectionScreenPlay:createEvent(CAMPAIGN_TIME)
	end
end

function BestineElectionScreenPlay:doPhaseChange()
	if (not BestineElectionScreenPlay:isElectionEnabled()) then
		return
	end

	local electionNum = tonumber(getQuestStatus("bestine_election:election_num"))
	if (electionNum == nil) then
		electionNum = 1
		setQuestStatus("bestine_election:election_num", electionNum)
	end

	local currentPhase = self:getCurrentPhase()
	if (currentPhase == 1) then
		BestineElectionScreenPlay:setCurrentPhase(2)
		BestineElectionScreenPlay:determineWinner()
		if (not hasServerEvent("ElectionPhaseChange")) then
			BestineElectionScreenPlay:createEvent(TUNE_TIME)
		end
	else
		self:setCurrentPhase(1)
		if (not hasServerEvent("ElectionPhaseChange")) then
			BestineElectionScreenPlay:createEvent(CAMPAIGN_TIME)
			electionNum = electionNum + 1
			setQuestStatus("bestine_election:election_num",electionNum)
			setQuestStatus("bestine_election:votesForSean",0)
			setQuestStatus("bestine_election:votesForVictor",0)
		end
	end
	printf("[BestineElection] Initiating phase change: "..electionNum.."\n")
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
	if (electionNum == nil) then
		electionNum = 1
		setQuestStatus("bestine_election:election_num",electionNum)
	end
	return electionNum
end

function BestineElectionScreenPlay:isElectionEnabled()
	return BESTINE_ELECTION_ENABLED
end

function BestineElectionScreenPlay:determineWinner()
	local votesForSean = tonumber(getQuestStatus("bestine_election:votesForSean"))
	if (votesForSean == nil) then
		votesForSean = 0
	end

	local votesForVictor = tonumber(getQuestStatus("bestine_election:votesForVictor"))
	if (votesForVictor == nil) then
		votesForVictor = 0
	end

	local electionWinner = ""
	if (votesForSean == votesForVictor) then
		local chance = getRandomNumber(1,2)
		if (chance == 1) then
			electionWinner = "Sean"
		else electionWinner = "Victor"
		end
	elseif (votesForSean > votesForVictor) then
		electionWinner = "Sean"
		self:spawnMerchants()
		--remove some imperial guards
	elseif (votesForSean < votesForVictor) then
		electionWinner = "Victor"
		self:despawnMerchants()
		--spawn more imperials
		--start bestine raid script
	end
	setQuestStatus("bestine_election:electionWinner","Sean")
end

function BestineElectionScreenPlay:castVote(pPlayer, who)
	if (pPlayer == nil) or (who == "")then
		return
	end
	local votes = tonumber(getQuestStatus("bestine_election:votesFor"..who))
	print("bestine_election:votesFor"..who)
	print("votes: "..votes)
	local electionNum = BestineElectionScreenPlay:getElectionNumber()

	if (votes == nil) then
		votes = 0
		setQuestStatus("bestine_election:votesFor"..who,votes)
	end

	votes = votes + 1
	setQuestStatus("bestine_election:votesFor"..who,votes)
	writeScreenPlayData(pPlayer, "BestineElection", "Voted"..who,electionNum)
	self:removeEvidence(pPlayer, who)
end

function BestineElectionScreenPlay:joinedVictorCampaign(pPlayer)
	if (pPlayer ~= nil) then
		local playerCampaign = tonumber(readScreenPlayData(pPlayer, "BestineElection", "VictorCampaign"))
		local electionNum = BestineElectionScreenPlay:getElectionNumber()
		return (playerCampaign ~= nil) and (playerCampaign == electionNum)
	end
	return false
end

function BestineElectionScreenPlay:joinedSeanCampaign(pPlayer)
	if (pPlayer ~= nil) then
		local playerCampaign = tonumber(readScreenPlayData(pPlayer, "BestineElection", "SeanCampaign"))
		local electionNum = BestineElectionScreenPlay:getElectionNumber()
		return (playerCampaign ~= nil) and (playerCampaign == electionNum)
	end
	return false
end

function BestineElectionScreenPlay:votedVictor(pPlayer)
	if (pPlayer ~= nil) then
		local electionNum = self:getElectionNumber()
		local playerCampaign = tonumber(readScreenPlayData(pPlayer, "BestineElection", "VotedVictor"))
		return (playerCampaign ~= nil) and (playerCampaign == electionNum)
	end
	return false
end

function BestineElectionScreenPlay:votedSean(pPlayer)
	if (pPlayer ~= nil) then
		local playerID = CreatureObject(pPlayer):getObjectID()
		local electionNum = self:getElectionNumber()
		local playerCampaign = tonumber(readScreenPlayData(pPlayer, "BestineElection", "VotedSean"))
		return (playerCampaign ~= nil) and (playerCampaign == electionNum)
	end
	return false
end

function BestineElectionScreenPlay:alreadyVoted(pPlayer)
	if (pPlayer == nil) then
		return false
	end
	return self:votedVictor(pPlayer) or self:votedSean(pPlayer)
end

function BestineElectionScreenPlay:canVoteForSean(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	if self:joinedSeanCampaign(pPlayer) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
		if pInventory == nil then
			return false
		end

		for i = 1, # seanEvidence do
			local pInvItem = getContainerObjectByTemplate(pInventory, seanEvidence[i], true)
			if pInvItem ~= nil then
				return true
			end
		end
	end
	return false
end

function BestineElectionScreenPlay:canVoteForVictor(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	if self:joinedVictorCampaign(pPlayer) then
		local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
		if pInventory == nil then
			return false
		end

		for i = 1, # victorEvidence do
			local pInvItem = getContainerObjectByTemplate(pInventory, victorEvidence[i], true)
			if pInvItem ~= nil then
				return true
			end
		end
	end
	return false
end

function BestineElectionScreenPlay:canVote(pPlayer)
	if (pPlayer == nil) then
		return false
	end
	return (not self:alreadyVoted(pPlayer)) and (self:canVoteForSean(pPlayer) or self:canVoteForVictor(pPlayer))
end

function BestineElectionScreenPlay:removeEvidence(pPlayer, who)
	if (pPlayer == false) or (who == "") then
		return
	end
	local templates = { }
	if who == "Sean" then
		templates = seanEvidence
	else
		templates = victorEvidence
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if pInventory ~= nil then
		for i = 1, # templates do
			local pInvItem = getContainerObjectByTemplate(pInventory, templates[i], true)
			if pInvItem ~= nil then
				SceneObject(pInvItem):destroyObjectFromWorld()
				SceneObject(pInvItem):destroyObjectFromDatabase()
			end
		end
	end
end

function BestineElectionScreenPlay:getPhaseTimeLeft()
	local eventID = getServerEventID("ElectionPhaseChange")
	if (eventID == nil) then
		return 0
	end
	print("getPhaseTimeLeft: "..getServerEventTimeLeft(eventID) / 1000)
	return getServerEventTimeLeft(eventID) / 1000
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

function BestineElectionScreenPlay:noroomReturned(pPlayer, quest)
	if (pPlayer == nil or quest == "") then
		return false
	end

	local playerID = CreatureObject(pPlayer):getObjectID()
	local electionNum = BestineElectionScreenPlay:getElectionNumber()
	local playerCampaign = readData(playerID..":bestine_election:"..quest.."_noroom")
	return (playerCampaign == electionNum)
end


function BestineElectionScreenPlay:setupTerminals()
	local pTerminal = getSceneObject(5565564) --terminal in victors office gives object/tangible/loot/quest/victor_questp_jregistry.iff
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionVictorTerminalMenuComponent_Registry")
	end
	pTerminal = getSceneObject(5565562) --desk in seans office
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSeanDeskMenuComponent")
	end
	pTerminal = getSceneObject(5565563) --terminal in seans office
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSeanTerminalMenuComponent")
	end

	pTerminal = getSceneObject(4475579) --other desk in seans office
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSeanDesk2MenuComponent")
	end
	--4475571 SEans table
	pTerminal = getSceneObject(4475571) --other desk in seans office
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionFakeSearchMenuComponent")
	end

	pTerminal = getSceneObject(4475517) --4475517 victors desk - gives object/tangible/loot/quest/victor_questn_journal.iff
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionSearchMenuComponent_Journal")
	end

	pTerminal = getSceneObject(5565565) --5565565 victors table
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionFakeSearchMenuComponent")
	end

	pTerminal = getSceneObject(3195507) --terminal for seans history quest.
	if pTerminal ~= nil then
		SceneObject(pTerminal):setObjectMenuComponent("BestineElectionHistoryQuestMenuComponent")
	end

end

function BestineElectionScreenPlay:spawnApproach(pActiveArea, pMovingObject)
	if (pMovingObject == nil or pActiveArea == nil or not SceneObject(pMovingObject):isCreatureObject()) then
		return 0
	end

	local npcID = readData(SceneObject(pActiveArea):getObjectID() .. ":OwnerID")
	local pNpc = getSceneObject(npcID)
	if (pNpc ~= nil) then
		SceneObject(pNpc):faceObject(pMovingObject, true)
	end
	return 0
end

function BestineElectionScreenPlay:informantApproach(pActiveArea, pMovingObject)
	if (pMovingObject == nil or pActiveArea == nil or not SceneObject(pMovingObject):isCreatureObject()) then
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

hutt_informant_conv_handler = huttInformantConvoHandler:new {
	themePark = BestineElection
}

victor_visalis_conv_handler = victorVisalisConvoHandler:new {
	themePark = BestineElection
}

sean_trenwell_conv_handler = seanTrenwellConvoHandler:new {
	themePark = BestineElection
}
seans_historian_conv_handler = seansHistorianConvoHandler:new {
	themePark = BestineElection
}
sean_contact_conv_handler = seanContactConvoHandler:new {
	themePark = BestineElection
}
bestine_election_questn_conv_handler = BestineElectionQuestnConvoHandler:new {
	themePark = BestineElection
}
bestine_election_questp_conv_handler = BestineElectionQuestpConvoHandler:new {
	themePark = BestineElection
}
bestine_election_conv_handler = bestineElectionConvoHandler:new {
	themePark = BestineElection
}
stone_merchant_conv_handler = StoneMerchantConvoHandler:new {
	themePark = BestineElection
}
