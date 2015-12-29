local ObjectManager = require("managers.object.object_manager")

SuiPhase1AccessTerminal = {
	terminalComponents = { "@quest_item_n:fs_craft_puzzle_config_processor", "@quest_item_n:fs_craft_puzzle_gyro_receiver",
		"@quest_item_n:fs_craft_puzzle_signal_amp", "@quest_item_n:fs_craft_puzzle_solid_state_array" },

	componentTemplates =  { "object/tangible/item/quest/force_sensitive/fs_craft_puzzle_config_processor.iff", "object/tangible/item/quest/force_sensitive/fs_craft_puzzle_gyro_receiver.iff",
		"object/tangible/item/quest/force_sensitive/fs_craft_puzzle_signal_amp.iff", "object/tangible/item/quest/force_sensitive/fs_craft_puzzle_solid_state_array.iff"}
}

function SuiPhase1AccessTerminal:openAccessTerminal(pPlayer, pTerminal)
	local playerID = SceneObject(pPlayer):getObjectID()
	local existingPid = readData(playerID .. ":fsCrafting1:pid")

	if (existingPid ~= 0) then
		CreatureObject(pPlayer):sendSystemMessage("@quest/force_sensitive/fs_crafting:phase1_msg_cant_open_sui")
		return
	end

	local status = { -1, -1, -1, -1 }

	for i = 1, 4, 1 do
		local tempVal = readScreenPlayData(pPlayer, "FsCrafting1", "accessTerminalStatus" .. i)

		if (tempVal == "") then
			writeScreenPlayData(pPlayer, "FsCrafting1", "accessTerminalStatus" .. i, "-1")
			tempVal = "-1"
		end

		status[i] = tonumber(tempVal)
	end

	local completed = true
	local arrayStatus = "@quest/force_sensitive/fs_crafting:sui_access_terminal_online"

	for i = 1, 4, 1 do
		if (status[i] ~= 1) then
			completed = false
			arrayStatus = "@quest/force_sensitive/fs_crafting:sui_access_terminal_offline"
		end
	end

	local suiPrompt = "@quest/force_sensitive/fs_crafting:sui_access_terminal_prompt0 \n\n"
	suiPrompt = suiPrompt .. "@quest/force_sensitive/fs_crafting:sui_access_terminal_prompt1 " .. arrayStatus .. " \n\n"
	suiPrompt = suiPrompt .. "@quest/force_sensitive/fs_crafting:sui_access_terminal_prompt2 "

	local componentStatus = { }

	for i = 1, 4, 1 do
		componentStatus[i] = self.terminalComponents[i] .. " - "
		if (status[i] == -1) then
			componentStatus[i] = componentStatus[i] .. "@quest/force_sensitive/fs_crafting:sui_access_terminal_damaged"
		elseif (status[i] == 0) then
			componentStatus[i] = componentStatus[i] .. "@quest/force_sensitive/fs_crafting:sui_access_terminal_empty";
		elseif (status[i] == 1) then
			componentStatus[i] = componentStatus[i] .. "@quest/force_sensitive/fs_crafting:sui_access_terminal_online"
		end
	end

	local sui = SuiListBox.new("SuiPhase1AccessTerminal", "accessTerminalCallback")
	sui.setTitle("@quest/force_sensitive/fs_crafting:sui_access_terminal_title")
	sui.setPrompt(suiPrompt)
	sui.showOtherButton()
	sui.setTargetNetworkId(SceneObject(pTerminal):getObjectID())

	for i = 1, #componentStatus, 1 do
		sui.add(componentStatus[i], "")
	end

	if (completed) then
		sui.setProperty("btnOk", "Visible", "false")
		sui.setProperty("btnOther", "Visible", "false")
	else
		sui.setProperty("btnOk", "Text", "@quest/force_sensitive/fs_crafting:sui_btn_replace")
		sui.setProperty("btnOther", "Text", "@quest/force_sensitive/fs_crafting:sui_btn_retrieve")
	end

	sui.sendTo(pPlayer)
end

function SuiPhase1AccessTerminal:accessTerminalCallback(pPlayer, pSui, eventIndex, rowIndex, otherPressed)
	if (eventIndex == 1) then
		return
	end

	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		return
	end

	local suiPageData = LuaSuiPageData(pPageData)

	if (rowIndex == -1) then
		suiPageData:sendUpdateTo(pPlayer)
		return
	end

	if (otherPressed) then
		self:retrieveComponent(pPlayer, suiPageData, rowIndex)
	else
		self:replaceComponent(pPlayer, suiPageData, rowIndex)
	end
end

function SuiPhase1AccessTerminal:retrieveComponent(pPlayer, suiPageData, rowIndex)
	rowIndex = rowIndex + 1

	if (rowIndex > 4 or rowIndex < 1) then
		return
	end

	local rowStatus = readScreenPlayData(pPlayer, "FsCrafting1", "accessTerminalStatus" .. rowIndex)

	if (rowStatus == 0) then
		CreatureObject(pPlayer):sendSystemMessage("@quest/force_sensitive/fs_crafting:phase1_msg_comp_not_installed")
		suiPageData:sendUpdateTo(pPlayer)
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("@quest/force_sensitive/fs_crafting:phase1_msg_inventory_full")
		suiPageData:sendUpdateTo(pPlayer)
		return
	end

	local pItem = giveItem(pInventory, self.componentTemplates[rowIndex], -1)

	if (pItem == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Failed to generate component, please try again.")
		suiPageData:sendUpdateTo(pPlayer)
		return
	end

	if (rowStatus == 1) then
		setQuestStatus(SceneObject(pItem):getObjectID() .. ":componentStatus", 1)
	else
		setQuestStatus(SceneObject(pItem):getObjectID() .. ":componentStatus", -1)
	end

	writeScreenPlayData(pPlayer, "FsCrafting1", "accessTerminalStatus" .. rowIndex, "0")

	CreatureObject(pPlayer):sendSystemMessage("@quest/force_sensitive/fs_crafting:phase1_msg_component_retrieved")
	--suiPageData:sendUpdateTo(pPlayer)
end
