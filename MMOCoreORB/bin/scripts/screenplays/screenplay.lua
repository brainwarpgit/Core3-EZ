local ObjectManager = require("managers.object.object_manager")

function printf(...) io.write(string.format(unpack(arg))) end

function writeData(key, data)
	writeSharedMemory(string.format(key), data)
end

function writeStringData(key, data)
	writeStringSharedMemory(string.format(key), string.format(data))
end

function deleteData(key)
	deleteSharedMemory(string.format(key))
end

function deleteStringData(key)
	deleteStringSharedMemory(string.format(key))
end

function readData(key)
	return readSharedMemory(string.format(key))
end

function readStringData(key)
	return readStringSharedMemory(string.format(key))
end

ScreenPlay = Object:new {
	screenplayName = "",
	numerOfActs = 0,
	startingEvent = nil,

	lootContainers = {},
	lootLevel = 0,
	lootGroups = {},
	lootContainerRespawn = 1800 -- 30 minutes
}

function ScreenPlay:initializeLootContainers()
	for k,v in pairs(self.lootContainers) do
		local pContainer = getSceneObject(v)
		if (pContainer ~= nil) then
			createObserver(OPENCONTAINER, self.screenplayName, "spawnContainerLoot", pContainer)
			self:spawnContainerLoot(pContainer)

			local container = LuaSceneObject(pContainer)
			container:setContainerDefaultAllowPermission(MOVEOUT + OPEN)
			container:setContainerComponent("PlaceableLootContainerComponent")
		end
	end
end

function ScreenPlay:spawnContainerLoot(pContainer)
	local container = LuaSceneObject(pContainer)
	local time = getTimestamp()

	if (readData(container:getObjectID()) > time) then
		return
	end

	--If it has loot already, then exit.
	if (container:getContainerObjectsSize() > 0) then
		writeData(container:getObjectID(), time + self.lootContainerRespawn)
		return
	end

	createLootFromCollection(pContainer, self.lootGroups, self.lootLevel)

	writeData(container:getObjectID(), time + self.lootContainerRespawn)
end

Act = Object:new {

}

return ScreenPlay
