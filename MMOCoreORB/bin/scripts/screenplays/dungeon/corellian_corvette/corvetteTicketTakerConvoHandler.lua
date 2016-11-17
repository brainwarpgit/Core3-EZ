local ObjectManager = require("managers.object.object_manager")

CorvetteTicketTakerConvoHandler = conv_handler:new {
	ticketTaker = nil
}

function CorvetteTicketTakerConvoHandler:setTicketTaker(taker)
	self.ticketTaker = taker
end

function CorvetteTicketTakerConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local player = CreatureObject(pPlayer)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if screenID == "start" then
		pConvScreen = self:handleScreenStart(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	elseif screenID == "continue" then
		pConvScreen = self:handleScreenContinue(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	elseif screenID == "authorization" then
		self.ticketTaker:validateTicket(pPlayer)
	end
	return pConvScreen
end

function CorvetteTicketTakerConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	return convoTemplate:getScreen("start")
end

function CorvetteTicketTakerConvoHandler:getNextConversationScreen(pConvTemplate, pPlayer, selectedOption, pNpc)
	local pConversationSession = CreatureObject(pPlayer):getConversationSession()
	local pLastConversationScreen = nil

	if (pConversationSession ~= nil) then
		local conversationSession = LuaConversationSession(pConversationSession)
		pLastConversationScreen = conversationSession:getLastConversationScreen()
	end

	local conversationTemplate = LuaConversationTemplate(pConvTemplate)
	if (pLastConversationScreen ~= nil) then
		local lastConversationScreen = LuaConversationScreen(pLastConversationScreen)
		local optionLink = lastConversationScreen:getOptionLink(selectedOption)
		return conversationTemplate:getScreen(optionLink)
	end

	return self:getInitialScreen(pPlayer, pNpc, pConvTemplate)
end

function CorvetteTicketTakerConvoHandler:handleScreenStart(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	pConvScreen = screen:cloneScreen()
	local clonedScreen = LuaConversationScreen(pConvScreen)

	local player = CreatureObject(pPlayer)
	local activeStep = tonumber(getQuestStatus(player:getObjectID() .. ":activeCorvetteStep"))

	clonedScreen:removeAllOptions()
	if activeStep == 2 then
		if (self.ticketTaker.faction == 0) then
			if player:getGroupSize() > 10 then
				clonedScreen:addOption(self.ticketTaker.helpMeString, "too_many")
			else
				clonedScreen:addOption(self.ticketTaker.helpMeString, "continue")
			end
		else
			local rightFaction = self.ticketTaker:checkFaction(pPlayer)
			if (player:getGroupSize() > 10) and (rightFaction == false) then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_wrong_faction_too_many")
			elseif (player:getGroupSize() > 10) then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_too_many")
			elseif (rightFaction == false) then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_wrong_faction")
			else
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission")
			end
		end
	end
	clonedScreen:addOption(self.ticketTaker.goodbyeString, "goodbye")
	return pConvScreen
end

function CorvetteTicketTakerConvoHandler:handleScreenContinue(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	pConvScreen = screen:cloneScreen()
	local clonedScreen = LuaConversationScreen(pConvScreen)

	local player = CreatureObject(pPlayer)
	local activeStep = tonumber(getQuestStatus(player:getObjectID() .. ":activeCorvetteStep"))

	clonedScreen:removeAllOptions()
	if activeStep == 2 then
		if (self.ticketTaker.faction == FACTIONNEUTRAL) then
			if player:getGroupSize() > 10 then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_too_many")
			else
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission")
			end
		else
			local rightFaction = self.ticketTaker:checkFaction(pPlayer)
			if (player:getGroupSize() > 10) and (rightFaction == false) then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_wrong_faction_too_many")
			elseif (player:getGroupSize() > 10) then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_too_many")
			elseif (rightFaction == false) then
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission_wrong_faction")
			else
				clonedScreen:addOption(self.ticketTaker.aboutMissionString, "mission")
			end
		end
	end
	clonedScreen:addOption(self.ticketTaker.nevermindString, "goodbye2")

	return pConvScreen
end
