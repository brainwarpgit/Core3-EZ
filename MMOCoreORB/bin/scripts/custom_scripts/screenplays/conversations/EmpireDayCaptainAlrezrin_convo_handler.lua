local ObjectManager = require("managers.object.object_manager")

--[[ empireday imperial Screenplay Status
0 - Not spoken with TK626
1 - Accepted to speak with Carkor
2 - Spoken with Carkor and accepted to hunt down Peety
3 - Dealt with Peety
4 - Accepted from Carkor to speak with Aldric
5 - Spoken with Aldric and accepted to hunt down Puprus
6 - Dealt with Puprus
7 - Accepted to speak with Alrez-Rin
8 - Turned in Quest for rewards from Alrez-Rin

Helper Status
1 - rebel
2 - imperial
]]

empiredayAlrezrin_convo_handler = conv_handler:new {}

function empiredayAlrezrin_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (screenID == "Response_01" or "Response_02")then
		if pGhost ~= nil then


		    EmpireDay:setQuestStatus(pPlayer, ":empiredayImpStatus", 8)

            if screenID == "Response_Accepted" then

                local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
                local playerID = SceneObject(pPlayer):getObjectID()

                if pInventory == nil then
                    return
                end

                if SceneObject(pInventory):isContainerFullRecursive() then
                    CreatureObject(pPlayer):sendSystemMessage("Your inventory is full and you are unable to receive your reward!")
                    return
                end

                empireday:grantReward(pPlayer)
                createEvent(5000, "empireday", "cleanUp", pPlayer, "")
            end
		end
    end
	return pConvScreen
end

function empiredayAlrezrin_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local playerFaction = CreatureObject(pPlayer):getFaction()
	local playerID = SceneObject(pPlayer):getObjectID()
	local empiredayImpStatus = getQuestStatus(playerID .. ":empiredayImpStatus")
	local empiredayHelperStatus = getQuestStatus(playerID .. ":empiredayHelper")

	if (empiredayImpStatus == nil) then
		empiredayImpStatus = "0"
	end

	if (playerFaction == FACTIONREBEL or empiredayHelperStatus == "1") then
		return convoTemplate:getScreen("Deny_Faction")
	end

	if empiredayImpStatus == "8" then
		return convoTemplate:getScreen("Response_Accepted")
	elseif (empiredayImpStatus == "1" or empiredayImpStatus == "2" or empiredayImpStatus == "3" or empiredayImpStatus == "4" or empiredayImpStatus == "5" or empiredayImpStatus == "6") then
		return convoTemplate:getScreen("Response_Dismissed")
	end

	return convoTemplate:getScreen("InitialConvo")

end