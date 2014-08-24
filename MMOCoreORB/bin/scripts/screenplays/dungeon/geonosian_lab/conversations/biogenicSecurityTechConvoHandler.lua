local ObjectManager = require("managers.object.object_manager")

BiogenicSecurityTechConvoHandler = Object:new {
	}

function BiogenicSecurityTechConvoHandler:runScreenHandlers(pConversationTemplate, pConversingPlayer, pConversingNPC, selectedOption, pConversationScreen)
	return ObjectManager.withCreatureObject(pConversingPlayer, function(player)
		local screen = LuaConversationScreen(pConversationScreen)
		local screenID = screen:getScreenID()
		local convoTemplate = LuaConversationTemplate(pConversationTemplate)
		if screenID == "init_firsttalk" then
			writeData(player:getObjectID() .. ":geo_security_tech_talked", 1)
		end
		return pConversationScreen
	end)
end

function BiogenicSecurityTechConvoHandler:getInitialScreen(pPlayer, pNpc, pConversationTemplate)
	local convoTemplate = LuaConversationTemplate(pConversationTemplate)
	return ObjectManager.withCreatureObject(pPlayer, function(player)
		local hasTalked = readData(player:getObjectID() .. ":geo_security_tech_talked")
		if (hasTalked ~= nil and hasTalked == 1) then
			return convoTemplate:getScreen("im_very_busy")
		else
			return convoTemplate:getScreen("init_firsttalk")
		end
	end)
end

function BiogenicSecurityTechConvoHandler:getNextConversationScreen(pConversationTemplate, pPlayer, selectedOption, pConversingNpc)
	local player = LuaCreatureObject(pPlayer)
	local pConversationSession = player:getConversationSession()

	local pLastConversationScreen = nil

	if (pConversationSession ~= nil) then
		local conversationSession = LuaConversationSession(pConversationSession)
		pLastConversationScreen = conversationSession:getLastConversationScreen()
	end

	local conversationTemplate = LuaConversationTemplate(pConversationTemplate)

	if (pLastConversationScreen ~= nil) then
		local lastConversationScreen = LuaConversationScreen(pLastConversationScreen)
		local optionLink = lastConversationScreen:getOptionLink(selectedOption)

		return conversationTemplate:getScreen(optionLink)
	end

	return self:getInitialScreen(pPlayer, pConversingNpc, pConversationTemplate)
end