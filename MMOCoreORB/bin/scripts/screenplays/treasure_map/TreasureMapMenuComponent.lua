local ObjectManager = require("managers.object.object_manager")

local mapStringName = { "pirate1", "pirate2", "bountyhunter1", "hedon1" }

local treasureMapData = {
	{ planet = "corellia", x = 3400, y = -1400 }, -- Pirate 1
	{ planet = "naboo", x = -1900, y = -4000 }, -- Pirate 2
	{ planet = "talus", x = 3800, y = -1000 }, -- Bounty Hunter
	{ planet = "tatooine", x = 6700, y = 4240 } -- Scythe Schematic
}

local TREASURE_CHEST_LIFESPAN = 600000 --10 minutes

TreasureMapMenuComponent = { }

function TreasureMapMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(120, 3, "@treasure_map/treasure_map:use") -- Read
	menuResponse:addRadialMenuItem(121, 3, "@treasure_map/treasure_map:search_area") -- Search Area
	menuResponse:addRadialMenuItem(122, 3, "@treasure_map/treasure_map:extract_treasure") -- Extract Treasure
end

function TreasureMapMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	return ObjectManager.withCreatureAndPlayerObject(pPlayer, function(creature, player)
		return ObjectManager.withSceneObject(pObject, function(object)
			if (object:isASubChildOf(pPlayer) == false) then
				creature:sendSystemMessage("@treasure_map/treasure_map:sys_not_in_inv") -- The treasure map must be in your inventory for you to use it!
				return 0
			end

			if (TreasureMapMenuComponent:getMapType(pObject) == 0) then
				creature:sendSystemMessage("@treasure_map/treasure_map:map_fail") -- This map is obviously a fake.
				return 0
			end

			if (selectedID == 120) then
				TreasureMapMenuComponent:doReadMap(pObject, pPlayer)
			elseif (selectedID == 121) then
				TreasureMapMenuComponent:doSearchArea(pObject, pPlayer)
			elseif (selectedID == 122) then
				TreasureMapMenuComponent:doExtractTreasure(pObject, pPlayer)
			end
			return 0
		end)
	end)
end

function TreasureMapMenuComponent:doSearchArea(pObject, pPlayer)
	local mapType = TreasureMapMenuComponent:getMapType(pObject)
	ObjectManager.withSceneObject(pPlayer, function(playerSceo)
		ObjectManager.withCreatureAndPlayerObject(pPlayer, function(creature, player)
			local mapData = treasureMapData[mapType]
			local waypointID = readData(creature:getObjectID() .. ":treasureMapSearchAreaWaypointID")
			local searchAreaID = readData(creature:getObjectID() .. ":treasureMapSearchAreaActiveAreaID")

			if (waypointID == 0 or searchAreaID == 0) then
				creature:sendSystemMessage("@treasure_map/treasure_map:sys_no_waypoint") -- You must store the treasure's waypoint in your datapad before you can search for it!
				return 0
			end

			if (playerSceo:hasActiveArea(searchAreaID) == false) then
				creature:sendSystemMessage("@treasure_map/treasure_map:sys_cant_pinpoint") -- You are not close enough to pinpoint the treasure's location.
				return 0
			end

			local pWaypoint = getSceneObject(waypointID)

			player:removeWaypoint(waypointID, true)

			local pActiveArea = getSceneObject(searchAreaID)
			ObjectManager.withSceneObject(pActiveArea, function(area)
				area:destroyObjectFromWorld()
				area:destroyObjectFromDatabase()
			end)

			deleteData(creature:getObjectID() .. ":treasureMapSearchAreaWaypointID")
			deleteData(creature:getObjectID() .. ":treasureMapSearchAreaActiveAreaID")

			local spawnPoint
			ObjectManager.withSceneObject(pWaypoint, function(waypoint)
				if (mapType == 4) then
					spawnPoint = getSpawnPoint(pPlayer, waypoint:getWorldPositionX(), waypoint:getWorldPositionY(), 15, 30)
				else
					spawnPoint = getSpawnPoint(pPlayer, waypoint:getWorldPositionX(), waypoint:getWorldPositionY(), 30, 60)
				end
			end)

			local x = spawnPoint[1]
			local y = spawnPoint[3]

			creature:sendSystemMessage("@treasure_map/treasure_map:sys_pinpoint") -- You have successfully pinpointed the exact location of the treasure!
			waypointID = player:addWaypoint(mapData.planet, "@treasure_map/treasure_map:waypoint_name", "", x, y, WAYPOINTGREEN, true, true, 0)

			writeData(creature:getObjectID() .. ":treasureMapExactWaypointID", waypointID)

		end)
	end)
end

function TreasureMapMenuComponent:doExtractTreasure(pObject, pPlayer)
	local mapType = TreasureMapMenuComponent:getMapType(pObject)
	ObjectManager.withSceneObject(pPlayer, function(playerSceo)
		ObjectManager.withCreatureAndPlayerObject(pPlayer, function(creature, player)
			local mapData = treasureMapData[mapType]
			local waypointID = readData(creature:getObjectID() .. ":treasureMapExactWaypointID")
			local x, z, y

			local pWaypoint = getSceneObject(waypointID)
			ObjectManager.withSceneObject(pWaypoint, function(waypoint)
				x = waypoint:getWorldPositionX()
				y = waypoint:getWorldPositionY()
				z = getTerrainHeight(pPlayer, x, y)
			end)

			if (playerSceo:getDistanceToPosition(x, z, y) > 5) then
				creature:sendSystemMessage("@treasure_map/treasure_map:sys_dist_far") -- You aren't close enough to extract the treasure.
				return 0
			end

			local treasureChestID = readData(creature:getObjectID() .. ":treasureChestID")

			if (treasureChestID ~= 0) then
				creature:sendSystemMessage("@treasure_map/treasure_map:sys_success") -- You've found the treasure!
				return 0
			end

			creature:sendSystemMessage("@treasure_map/treasure_map:sys_found") -- You successfully extract the treasure!

			local pChest = spawnSceneObject(mapData.planet, "object/tangible/container/drum/treasure_drum.iff", x, z, y, 0, 0, 0, 0, 0)
			ObjectManager.withSceneObject(pChest, function(chest)
				writeData(creature:getObjectID() .. ":treasureChestID", chest:getObjectID())
				writeData(chest:getObjectID() .. ":ownerID", creature:getObjectID())
				chest:setContainerOwnerID(creature:getObjectID())
				createObserver(OPENCONTAINER, "TreasureMapMenuComponent", "openChestEvent", pChest)
				createObserver(CONTAINERCONTENTSCHANGED, "TreasureMapMenuComponent", "chestLootedEvent", pChest)
				TreasureMapMenuComponent:spawnTreasureLoot(pChest, pPlayer, mapType)
				createEvent(TREASURE_CHEST_LIFESPAN, "TreasureMapMenuComponent", "removeTreasureChest", pChest)
			end)
			TreasureMapMenuComponent:spawnTreasureDefenders(pObject, pPlayer, x, z, y)
			ObjectManager.withSceneObject(pObject, function(chest)
				chest:destroyObjectFromWorld()
				chest:destroyObjectFromDatabase(true)
			end)
		end)
	end)
end

function TreasureMapMenuComponent:chestLootedEvent(pChest, pCreature)
	ObjectManager.withSceneObject(pChest, function(chest)
		if (chest:getContainerObjectsSize() == 0) then
			TreasureMapMenuComponent:removeTreasureChest(pChest)
		end
	end)
end

function TreasureMapMenuComponent:openChestEvent(pChest, pCreature)
	ObjectManager.withSceneObject(pChest, function(chest)
		ObjectManager.withCreatureObject(pCreature, function(creature)
			local chestOwnerID = readData(chest:getObjectID() .. ":ownerID")
			if (chestOwnerID ~= creature:getObjectID()) then
				creature:sendSystemMessage("@treasure_map/treasure_map:sys_not_yours") -- That treasure chest doesn't belong to you.
				return 0
			end
			local hasOpenedChest = readData(creature:getObjectID() .. ":hasOpenedChest")
			if (hasOpenedChest ~= 1) then
				local credits = getRandomNumber(500, 5000)
				creature:addCashCredits(credits, true)
				creature:sendSystemMessage("You find " .. credits .. " credits in the chest.")
				writeData(creature:getObjectID() .. ":hasOpenedChest", 1)
			end
		end)
	end)
end

function TreasureMapMenuComponent:spawnTreasureLoot(pChest, pPlayer, mapType)
	if (mapType == 1 or mapType == 2 or mapType == 3) then
		local playerLevelRange = 10
		ObjectManager.withCreatureObject(pPlayer, function(creature)
			playerLevelRange = getRandomNumber(creature:getLevel() - 5, creature:getLevel() + 5)
		end)

		local lootAdded = 1
		while (lootAdded <= 5) do
			local lootChoice = getRandomNumber(40)
			if (lootChoice == 1) then
				local randCrystal = getRandomNumber(5)
				if (randCrystal == 1) then
					createLoot(pChest, "crystals_premium", playerLevelRange, false)
				elseif (randCrystal == 2) then
					createLoot(pChest, "crystals_select", playerLevelRange, false)
				elseif (randCrystal == 3) then
					createLoot(pChest, "crystals_okay", playerLevelRange, false)
				elseif (randCrystal == 4) then
					createLoot(pChest, "crystals_good", playerLevelRange, false)
				elseif (randCrystal == 5) then
					createLoot(pChest, "crystals_poor", playerLevelRange, false)
				end
			elseif (lootChoice == 5 or lootChoice == 6) then
				createLoot(pChest, "armor_attachments", playerLevelRange, false)
			elseif (lootChoice == 7 or lootChoice == 8) then
				createLoot(pChest, "clothing_attachments", playerLevelRange, false)
			elseif (lootChoice == 9 or lootChoice == 10) then
				createLoot(pChest, "color_crystals", playerLevelRange, false)
			elseif (lootChoice >= 11 and lootChoice <= 15) then
				createLoot(pChest, "armor_all", playerLevelRange, false)
			elseif (lootChoice >= 21 and lootChoice <= 25) then
				createLoot(pChest, "weapons_all", playerLevelRange, false)
			else
				createLoot(pChest, "junk", playerLevelRange, false)
			end
			lootAdded = lootAdded + 1
		end
	else
		createLoot(pChest, "hedon_istee_treasure", 10, false)
	end
end

function TreasureMapMenuComponent:spawnTreasureDefenders(pObject, pPlayer, x, z, y)
	local mapType = TreasureMapMenuComponent:getMapType(pObject)
	local mapData = treasureMapData[mapType]
	local firstSpawnPoint = getSpawnPoint(pPlayer, x, y, 10, 20)
	local secondSpawnPoint = getSpawnPoint(pPlayer, x, y, 10, 20)
	local thirdSpawnPoint = getSpawnPoint(pPlayer, x, y, 10, 20)

	if (mapType == 1 or mapType == 2) then
		local pMobile = spawnMobile(mapData.planet, "pirate_leader", 0, firstSpawnPoint[1], firstSpawnPoint[2], firstSpawnPoint[3], 0, 0)
		TreasureMapMenuComponent:setDefenderAggro(pMobile, pPlayer)
		spatialChat(pMobile, "@treasure_map/treasure_map:bark_" .. mapStringName[mapType])
		local pMobile2 = spawnMobile(mapData.planet, "pirate_armsman", 0, secondSpawnPoint[1], secondSpawnPoint[2], secondSpawnPoint[3], 0, 0)
		TreasureMapMenuComponent:setDefenderAggro(pMobile2, pPlayer)
		local pMobile3 = spawnMobile(mapData.planet, "pirate_armsman", 0, thirdSpawnPoint[1], thirdSpawnPoint[2], thirdSpawnPoint[3], 0, 0)
		TreasureMapMenuComponent:setDefenderAggro(pMobile3, pPlayer)
	elseif (mapType == 3) then
		local pMobile = spawnMobile(mapData.planet, "bounty_hunter_thug", 0, firstSpawnPoint[1], firstSpawnPoint[2], firstSpawnPoint[3], 0, 0)
		spatialChat(pMobile, "@treasure_map/treasure_map:bark_" .. mapStringName[mapType])
		TreasureMapMenuComponent:setDefenderAggro(pMobile, pPlayer)
	else
		spawnMobile(mapData.planet, "canyon_krayt_dragon", 0, x, z, y, 0, 0)
	end
end

function TreasureMapMenuComponent:setDefenderAggro(pCreature, pPlayer)
	ObjectManager.withCreatureAiAgent(pCreature, function(mobile)
		mobile:setDefender(pPlayer)
	end)
end

function TreasureMapMenuComponent:removeTreasureChest(pChest)
	ObjectManager.withSceneObject(pChest, function(chest)
		local chestOwnerID = readData(chest:getObjectID() .. ":ownerID")
		local pOwner = getSceneObject(chestOwnerID)
		ObjectManager.withCreaturePlayerObject(pOwner, function(owner)
			local waypointID = readData(chestOwnerID .. ":treasureMapExactWaypointID")
			owner:removeWaypoint(waypointID, true)
		end)

		deleteData(chestOwnerID .. ":treasureChestID")
		deleteData(chest:getObjectID() .. ":ownerID")
		chest:destroyObjectFromWorld()
		chest:destroyObjectFromDatabase(true)

		deleteData(chestOwnerID .. ":hasOpenedChest")
		deleteData(chestOwnerID .. ":treasureMapExactWaypointID")
	end)
end

function TreasureMapMenuComponent:doReadMap(pObject, pPlayer)
	local mapType = TreasureMapMenuComponent:getMapType(pObject)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(pObject, pPlayer, "@treasure_map/treasure_map:title_" .. mapStringName[mapType], "@treasure_map/treasure_map:text_" .. mapStringName[mapType], "@treasure_map/treasure_map:store_waypoint", "TreasureMapMenuComponent", "handleTreasureMapSuiCallback")
end

function TreasureMapMenuComponent:handleTreasureMapSuiCallback(pCreature, pSui, cancelPressed)
	if (cancelPressed or pCreature == nil) then
		return 0
	end

	local suiBox = LuaSuiBox(pSui)
	local pUsingObject = suiBox:getUsingObject()

	if (pUsingObject == nil) then
		return 0
	end

	local mapType = TreasureMapMenuComponent:getMapType(pUsingObject)

	ObjectManager.withCreatureAndPlayerObject(pCreature, function(creature, player)
		local mapData = treasureMapData[mapType]
		if (creature:getZoneName() ~= mapData.planet) then
			creature:sendSystemMessage("@treasure_map/treasure_map:wrong_planet") -- The coordinates stored in the map data do not appear to be for this planet.
			return 0
		end
		local currentWaypointID = readData(creature:getObjectID() .. ":treasureMapSearchAreaWaypointID")
		local pWaypoint = getSceneObject(currentWaypointID)

		if (pWaypoint ~= nil) then
			creature:sendSystemMessage("@treasure_map/treasure_map:sys_waypoint_exists") -- A waypoint to this location already exists in your datapad.
			return 0
		end

		local spawnPoint
		if (mapType == 4) then
			spawnPoint = getSpawnPoint(pCreature, mapData.x, mapData.y, 1, 50)
		else
			spawnPoint = getSpawnPoint(pCreature, mapData.x, mapData.y, 1, 2000)
		end

		local waypointID = player:addWaypoint(mapData.planet, "@treasure_map/treasure_map:waypoint_name", "", spawnPoint[1], spawnPoint[3], WAYPOINTGREEN, true, true, 0)
		local activeAreaID = self:spawnSearchArea(mapType, pCreature, spawnPoint[1], spawnPoint[3])
		writeData(creature:getObjectID() .. ":treasureMapSearchAreaWaypointID", waypointID)
		writeData(creature:getObjectID() .. ":treasureMapSearchAreaActiveAreaID", activeAreaID)
	end)
end

function TreasureMapMenuComponent:spawnSearchArea(mapType, pCreature, x, y)
	local mapData = treasureMapData[mapType]
	local z = getTerrainHeight(pCreature, x, y)
	local pActiveArea = spawnSceneObject(mapData.planet, "object/active_area.iff", x, z, y, 0, 0, 0, 0, 0)

	ObjectManager.withActiveArea(pActiveArea, function(activeArea)
		activeArea:setRadius(64)
	end)
	return ObjectManager.withSceneObject(pActiveArea, function(activeSceo)
		return activeSceo:getObjectID()
	end)
end

function TreasureMapMenuComponent:getMapType(pObject)
	return ObjectManager.withSceneObject(pObject, function(object)
		if (object:getTemplateObjectPath() == "object/tangible/treasure_map/treasure_map_pirate1.iff") then
			return 1
		elseif (object:getTemplateObjectPath() == "object/tangible/treasure_map/treasure_map_pirate2.iff") then
			return 2
		elseif (object:getTemplateObjectPath() == "object/tangible/treasure_map/treasure_map_bh.iff") then
			return 3
		elseif (object:getTemplateObjectPath() == "object/tangible/loot/quest/treasure_map_hedon.iff") then
			return 4
		else
			return 0
		end
	end)
end