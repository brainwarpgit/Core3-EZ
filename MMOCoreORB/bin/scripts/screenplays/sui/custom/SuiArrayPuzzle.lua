local ObjectManager = require("managers.object.object_manager")

SuiArrayPuzzle = {}
function SuiArrayPuzzle:openPuzzle(pCreatureObject, pArray)
	local sui = SuiCalibrationGame1.new("SuiArrayPuzzle", "defaultCallback")

	sui.setTargetNetworkId(0)

	sui.setForceCloseDistance(0)

	local goal = getRandomNumber(100)
	local cur = { 0, 0, 0, 0, 0 }
	local mod = { 0, 0, 0, 0, 0 }
	local tries = 10

	for i = 1, #cur, 1 do
		cur[i] = getRandomNumber(100)
		mod[i] = getRandomNumber(100)
	end

	sui.setTitle("@quest/force_sensitive/fs_crafting:sui_ssa_title")
	sui.setDescription("@quest/force_sensitive/fs_crafting:sui_ssa_description")
	sui.setAttemptsDesc("@quest/force_sensitive/fs_crafting:sui_attempts_remaining" .. " 100%")

	sui.subscribeToEvent(SuiEventType.SET_onButton, "btnOk", "SuiArrayPuzzle:defaultCallback")

	sui.subscribeToPropertyForEvent(SuiEventType.SET_onButton, "comp.sliders.1.slider", "Value")
	sui.subscribeToPropertyForEvent(SuiEventType.SET_onButton, "comp.sliders.2.slider", "Value")
	sui.subscribeToPropertyForEvent(SuiEventType.SET_onButton, "comp.sliders.3.slider", "Value")
	sui.subscribeToPropertyForEvent(SuiEventType.SET_onButton, "comp.sliders.4.slider", "Value")
	sui.subscribeToPropertyForEvent(SuiEventType.SET_onButton, "comp.sliders.5.slider", "Value")

	sui.setSliderTitle(1, "@quest/force_sensitive/fs_crafting:sui_ssa_slider1")
	sui.setSliderTitle(2, "@quest/force_sensitive/fs_crafting:sui_ssa_slider2")
	sui.setSliderTitle(3, "@quest/force_sensitive/fs_crafting:sui_ssa_slider3")
	sui.setSliderTitle(4, "@quest/force_sensitive/fs_crafting:sui_ssa_slider4")
	sui.setSliderTitle(5, "@quest/force_sensitive/fs_crafting:sui_ssa_slider5")

	local goalTemp = math.floor(20 + (228 * (goal / 100)))

	sui.setProperty("line", "Value", "" .. tostring(goalTemp))

	for i = 1, #cur, 1 do
		local pct = cur[i]
		sui.setProperty("comp.sliders." .. i .. ".slider", "Value", tostring(pct))
		pct = pct + mod[i]

		if (pct > 100) then
			pct = pct - 100
		end

		sui.setProperty("comp.bars.bar" .. i .. ".left", "OnRunScript", "sizeX = parent.sizeX * Value / 100.0")
		sui.setProperty("comp.bars.bar" .. i .. ".right", "OnRunScript", "sizeX = parent.sizeX * Value / 100.0\nlocationX = parent.sizeX - sizeX")
		sui.setProperty("comp.bars.bar" .. i .. ".left", "Value", "" .. (pct - 3))
		sui.setProperty("comp.bars.bar" .. i .. ".right", "Value", "" .. (100 - (pct + 3)))
		sui.setProperty("comp.bars.bar" .. i .. ".left", "RunScript", "")
		sui.setProperty("comp.bars.bar" .. i .. ".right", "RunScript", "")
	end

	local pageId = sui.sendTo(pCreatureObject)
	writeData(SceneObject(pCreatureObject):getObjectID() .. ":arrayPuzzle:Pid", pageId)

	writeData("sui:" .. pageId .. ":tries", tries)
	writeData("sui:" .. pageId .. ":maxTries", tries)
	writeData("sui:" .. pageId .. ":goal", goal)

	for i = 1, #mod, 1 do
		writeData("sui:" .. pageId .. ":mod" .. i, mod[i])
	end
end

function SuiArrayPuzzle:noCallback(pPlayer, pSui, eventIndex, ...)
end

function SuiArrayPuzzle:defaultCallback(pPlayer, pSui, eventIndex, ...)
	local cancelPressed = (eventIndex == 1)
	local playerID = SceneObject(pPlayer):getObjectID()
	local pageId = readData(playerID .. ":arrayPuzzle:Pid")

	if (pageId == 0) then
		return
	end

	local pPageData = LuaSuiBoxPage(pSui):getSuiPageData()

	if (pPageData == nil) then
		printf("Error in SuiArrayPuzzle:defaultCallback, pageData is nil.\n")
		return
	end

	local suiPageData = LuaSuiPageData(pPageData)

	if (cancelPressed) then
		CreatureObject(pPlayer):sendSystemMessage("@quest/force_sensitive/fs_crafting:phase1_msg_calibration_aborted")
		deleteData("sui:" .. pageId .. ":tries")
		deleteData("sui:" .. pageId .. ":maxTries")
		deleteData("sui:" .. pageId .. ":goal")

		for i = 1, 5, 1 do
			deleteData("sui:" .. pageId .. ":mod" .. i)
		end
		return
	end

	ObjectManager.withCreaturePlayerObject(pPlayer, function(playerObject)
		playerObject:addSuiBox(pSui)
	end)

	local args = {...}

	local current = { 0, 0, 0, 0, 0 }
	local mod = { }
	local tries = readData("sui:" .. pageId .. ":tries")
	local maxTries = readData("sui:" .. pageId .. ":maxTries")
	local goal = readData("sui:" .. pageId .. ":goal")
	local wonPuzzle = true

	for i = 1, 5, 1 do
		table.insert(mod, i, readData("sui:" .. pageId .. ":mod" .. i))
	end

	for i = 1, #current, 1 do
		current[i] = args[i]
		local pct = current[i] + mod[i]

		if (pct > 100) then
			pct = pct - 100
		end

		local delta = goal - pct

		if (delta < -3 or delta > 2) then
			wonPuzzle = false
		end

		suiPageData:setProperty("comp.sliders." .. i .. ".slider", "Value", tostring(current[i]))
		suiPageData:setProperty("comp.bars.bar" .. i .. ".left", "Value", "" .. (pct - 3))
		suiPageData:setProperty("comp.bars.bar" .. i .. ".right", "Value", "" .. (100 - (pct + 3)))
		suiPageData:setProperty("comp.bars.bar" .. i .. ".left", "RunScript", "")
		suiPageData:setProperty("comp.bars.bar" .. i .. ".right", "RunScript", "")
	end

	tries = tries - 1

	local integrity = math.floor((tries / maxTries) * 100)

	if (wonPuzzle or tries <= 0) then
		suiPageData:subscribeToEvent(SuiEventType.SET_onButton, "btnOk", "SuiArrayPuzzle:noCallback")
		suiPageData:setProperty("comp.sliders.1.slider", "GetsInput", "false")
		suiPageData:setProperty("comp.sliders.2.slider", "GetsInput", "false")
		suiPageData:setProperty("comp.sliders.3.slider", "GetsInput", "false")
		suiPageData:setProperty("comp.sliders.4.slider", "GetsInput", "false")
		suiPageData:setProperty("comp.sliders.5.slider", "GetsInput", "false")
		suiPageData:setProperty("btnOk", "Visible", "false")

		if (wonPuzzle) then
			writeData(playerID .. ":arrayPuzzle:status", 1)
			suiPageData:setProperty("description.desc", "Text", "@quest/force_sensitive/fs_crafting:sui_calibration_success")
		else
			writeData(playerID .. ":arrayPuzzle:status", -1)
			suiPageData:setProperty("description.desc", "Text", "@quest/force_sensitive/fs_crafting:sui_calibration_failure")
			suiPageData:setProperty("description.attempts", "Text", "@quest/force_sensitive/fs_crafting:sui_attempts_remaining" .. " " .. integrity .. "%")
		end

		deleteData(playerID .. ":arrayPuzzle:Pid")
	else
		suiPageData:setProperty("description.attempts", "Text", "@quest/force_sensitive/fs_crafting:sui_attempts_remaining" .. " " .. integrity .. "%")
		writeData("sui:" .. pageId .. ":tries", tries)
	end

	suiPageData:sendUpdateTo(pPlayer)
end
