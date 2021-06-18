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

EmpireDayGeneralAldric_convo_handler = conv_handler:new {}

function EmpireDayGeneralAldric_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	if (pPLayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	--[[
	if (screenID == "Response_Accepted") then
		if pGhost ~= nil then
			local empiredayImpWpID_5 = PlayerObject(pGhost):addWaypoint("naboo", "Confront the suspected rebel terrorist", "Confront the suspected rebel terrorist", -5066, 3399, WAYPOINT_COLOR_PURPLE, true, true, 0)

			EmpireDay:setQuestStatus(pPlayer, ":empiredayImpStatus", 5)
			EmpireDay:setQuestStatus(pPlayer, ":empiredayImpWpID_5", empiredayImpWpID_5)

			local playerID = SceneObject(pPlayer):getObjectID()
			local wpID_4 = getQuestStatus(playerID .. ":empiredayImpWpID_4")

			if wpID_4 ~= nil then
				PlayerObject(pGhost):removeWaypoint(wpID_4, true)
				removeQuestStatus(playerID .. ":empiredayImpWpID_4")
			end
 		end
	end

	if (screenID == "Turnin_Response_Accepted") then
		if pGhost ~= nil then
			local empiredImpWpID_7 = PlayerObject(pGhost):addWaypoint("naboo", "Head over to and speak with Captin Alrez-Rin", "Head over to and speak with Captin Alrez-Rin", -5496, 4451, WAYPOINT_COLOR_PURPLE, true, true, 0)

			EmpireDay:setQuestStatus(pPlayer, ":empiredayImpStatus", 7)
 			EmpireDay:setQuestStatus(pPlayer, ":empiredayImpWpID_7", empiredayImpWpID_7)

 			local playerID = SceneObject(pPlayer):getObjectID()
			local wpID_6 = getQuestStatus(playerID .. ":empiredayImpWpID_6")

			if wpID_6 ~= nil then
				PlayerObject(pGhost):removeWaypoint(wpID_6, true)
				removeQuestStatus(playerID .. ":empiredayImpWpID_6")
			end
		end
	end]]
	return pConvScreen
end

function EmpireDayGeneralAldric_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	printf(" aldrics handler called \n")

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (pPlayer == nil) then
		return
	end

	local playerFaction = CreatureObject(pPlayer):getFaction()
	local playerID = SceneObject(pPlayer):getObjectID()
	local empiredayImpStatus = tonumber(getQuestStatus(playerID .. ":empiredayImpStatus"))
	local empiredayHelperStatus = getQuestStatus(playerID .. ":empiredayHelper")

	if (empiredayImpStatus == nil) then
		empiredayImpStatus = 0
	end

	if (playerFaction == FACTIONREBEL or empiredayHelperStatus == "1") then
		return convoTemplate:getScreen("Deny_Faction")
	end

	printf("past the checks \n")
	printf(" imp status:  " .. empiredayImpStatus .. "\n")

	if empiredayImpStatus < 4 then
		return convoTemplate:getScreen("Not_Elligible")
	elseif empiredayImpStatus == 5 then
		return convoTemplate:getScreen("Response_Dismiss")
	elseif empiredayImpStatus == 6 then
		return convoTemplate:getScreen("TurnInConvo")
	elseif empiredayImpStatus >= 7 then
		return convoTemplate:getScreen("Service_Noted")
	end

	return convoTemplate:getScreen("InitialConvo")
end