EmpireDay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "EmpireDay",
}
registerScreenPlay("EmpireDay", true)

function EmpireDay:start(force_start)
	if force_start or os.date("%m%d%H%M") >= "06260600" and os.date("%m%d%H") < "070512" then
		print(os.date() .. ": Empire Day Event - Starting")

		self:spawnMobiles()
		self:spawnDecorationObjects()

		-- Schedules check for despawn 1 day from launch
		createEvent(24 * 60 * 60 * 1000, "EmpireDay", "despawnEvent", nil, "")
	end
end

function EmpireDay:spawnMobiles()
	local mobileTable = empiredayMobiles

	for i = 1, #mobileTable, 1 do
		local mobile = mobileTable[i]

		if isZoneEnabled(mobile[1]) then
			--{planet, template, timer, x, z, y, direction, cell}
			local pMobile = spawnMobile(mobile[1], mobile[2], -1, mobile[3], mobile[4], mobile[5], mobile[6], mobile[7])

			if (pMobile ~= nil) then
				local pOid = SceneObject(pMobile):getObjectID()

				if mobile[2] == "empireday_peetyjoe" or "empireday_puprus" then
					createObserver(CREATUREDESPAWNED, "EmpireDay", "onDespawn", pMobile)
					CreatureObject(pMobile):setPvpStatusBitmask(0)

					writeData(pOid .. ":empireDaySpawnNum", i)
				end

				writeData(i .. ":empiredayMob", pOid)
			end
		end
	end
end

function EmpireDay:spawnDecorationObjects()
	local decoTable = empiredayDecorationObjects

	for i = 1, #decoTable, 1 do
		local deco = decoTable[i]

		if isZoneEnabled(deco[1]) then
			--{planet, template, x, z, y, cell, direction}
			local pScno = spawnSceneObject(deco[1], deco[2], deco[3], deco[4], deco[5], deco[6], math.rad(deco[7]))

			if pScno ~= nil then
				local pScnoOid = SceneObject(pScno):getObjectID()

				writeData(i .. ":empiredayDeco", pScnoOid)
			end
		end
	end
end

function EmpireDay:onDespawn(pMobile)
	if pMobile == nil or not SceneObject(pMobile):isAiAgent() then
		return
	end

	local pOid = SceneObject(pMobile):getObjectID()
	local mobNum = tonumber(readData(pOid .. ":empireDaySpawnNum"))

	createEvent(30 * 1000, "EmpireDay", "respawn", nil, mobNum)

	deleteData(mobNum .. ":empiredayMob")
	deleteData(pOid .. ":empireDaySpawnNum")

	return 1
end

function EmpireDay:respawn(pMobile, spawnNumber)
	local mobiles = empiredayMobiles
	local npcNum = tonumber(spawnNumber)
	local npc = mobiles[npcNum]

	local pMob = spawnMobile(npc[1], npc[2], -1, npc[3], npc[4], npc[5], npc[6], npc[7])

	if (pMob ~= nil) then
		local pOid = SceneObject(pMob):getObjectID()

		createObserver(CREATUREDESPAWNED, "EmpireDay", "onDespawn", pMob)
		CreatureObject(pMob):setPvpStatusBitmask(0)

		writeData(spawnNumber .. ":empiredayMob", pOid)
		writeData(pOid .. ":empireDaySpawnNum", npcNum)
	end
end

function EmpireDay:setQuestStatus(pPlayer, quest, status)
	if pPlayer == nil then
		return
	end

	local playerID = SceneObject(pPlayer):getObjectID()
	local string = quest
	local questStatus = status

	if (playerID ~= nil) then
		setQuestStatus(playerID .. string, status)
	end
end

function EmpireDay:cleanUp(pPlayer)
	if pPlayer == nil then
		return
	end

	local playerID = SceneObject(pPlayer):getObjectID()

	if (playerID ~= nil) then
		removeQuestStatus(playerID .. ":empiredayImpWPID_7")
		removeQuestStatus(playerID .. ":empiredayRebellWPID_4")
	end
end

function EmpireDay:grantReward(pPlayer)
	if pPlayer == nil then
		return
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local playerID = SceneObject(pPlayer):getObjectID()
	local playerFaction = CreatureObject(pPlayer):getFaction()
	local empiredayHelperStatus = getQuestStatus(playerID .. ":empiredayHelper")

	if pInventory == nil then
		return
	end

	PlayerObject(pGhost):awardBadge(124) --Live Event Badge

	local pReward = giveItem(pInventory, "object/tangible/item/lytus_family_artefact.iff", -1)

	if pReward ~= nil then
		if (playerFaction == FACTIONIMPERIAL or empiredayHelperStatus == "2") then
			SceneObject(pReward):setCustomObjectName("2021 - Empire Day Miniature Hologram")
		else
			SceneObject(pReward):setCustomObjectName("2021 - Remembrance Day Miniature Hologram")
		end
	end
end

function EmpireDay:despawnEvent(pMobile, args)
	if pMobile == nil and os.date("%m%d%H%M") < "07050600" then
		print(os.date() .. ": Empire Day Event - Rescheduling Despawn")

		createEvent(24 * 60 * 60 * 1000, "EmpireDay", "despawnEvent", nil, "")
		return
	end

	print(os.date() .. ": Empire Day Event - Despawning")

	local mobiles = empiredayMobiles

	for i = 1, #mobiles, 1 do
		local pMobID = readData(i .. ":empiredayMob")
		local despawnMob = getSceneObject(pMobID)

		if despawnMob ~= nil then
			if i == 3 or i == 5 then
				dropObserver(CREATUREDESPAWNED, "EmpireDay", "onDespawn", despawnMob)
				deleteData(pMobID .. ":empireDaySpawnNum")
			end

			SceneObject(despawnMob):destroyObjectFromWorld()
			deleteData(i .. ":empiredayMob")
		end
	end

	local decor = empiredayDecorationObjects

	for j = 1, #decor, 1 do
		local pObID = readData(j .. ":empiredayDeco")
		local pObject = getSceneObject(pObID)

		if pObject ~= nil then
			SceneObject(pObject):destroyObjectFromWorld()
			deleteData(j .. ":empiredayDeco")
		end
	end

	print(os.date() .. ": Empire Day Event - Despawn Complete")
end
