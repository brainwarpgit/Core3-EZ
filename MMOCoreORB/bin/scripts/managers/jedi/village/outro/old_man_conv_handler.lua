local VillageJediManagerCommon = require("managers.jedi.village.village_jedi_manager_common")
local OldManEncounter = require("managers.jedi.village.outro.old_man_encounter")
local QuestManager = require("managers.quest.quest_manager")

oldManIntroConvoHandler = Object:new {}

function oldManIntroConvoHandler:getNextConversationScreen(pConversationTemplate, pPlayer, selectedOption, pConversingNpc)
	local pConversationSession = CreatureObject(pPlayer):getConversationSession()

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

function oldManIntroConvoHandler:getInitialScreen(pPlayer, pNpc, pConversationTemplate)
	local convoTemplate = LuaConversationTemplate(pConversationTemplate)
	if OldManEncounter:doesOldManBelongToThePlayer(pPlayer, pNpc) then
		return convoTemplate:getScreen("fairly_urgent_matter")
	else
		return convoTemplate:getScreen("nothing_to_discuss")
	end
end


function oldManIntroConvoHandler:runScreenHandlers(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
	local screen = LuaConversationScreen(pConversationScreen)

	local screenID = screen:getScreenID()

	if screenID == "perhaps_meet_again" or screenID == "perhaps_another_time" then
		OldManEncounter:scheduleDespawnOfOldMan(pConversingPlayer)
		CreatureObject(pConversingNpc):setOptionsBitmask(128)
	elseif screenID == "where_camp" then
		OldManEncounter:scheduleDespawnOfOldMan(pConversingPlayer)
		QuestManager.completeQuest(pConversingPlayer, QuestManager.quests.OLD_MAN_FINAL)
		CreatureObject(pConversingNpc):setOptionsBitmask(128)
	end

	return pConversationScreen
end