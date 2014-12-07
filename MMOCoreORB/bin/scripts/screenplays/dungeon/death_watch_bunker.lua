local ObjectManager = require("managers.object.object_manager")

DeathWatchBunkerScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	passkey = {
		hall = "object/tangible/dungeon/death_watch_bunker/passkey_hall.iff",
		storage = "object/tangible/dungeon/death_watch_bunker/passkey_storage.iff",
		mine = "object/tangible/dungeon/death_watch_bunker/passkey_mine.iff"
	},

	buildingIds = {
		outside = 5996315,
		entrance = 5996316,
		areaA = 5996326,
		areaB = 5996338,
		mines = 5996352,
		armorArea = 5996374,
		droidEngineerArea = 5996370,
		tailorArea = 5996368
	},

	bunkerItems = {
		alumMineral = "object/tangible/loot/dungeon/death_watch_bunker/mining_drill_reward.iff",
		mandoHelmet = "object/tangible/wearables/armor/mandalorian/armor_mandalorian_helmet.iff",
		mandoRebreather = "object/tangible/wearables/goggles/rebreather.iff",
		filter = "object/tangible/dungeon/death_watch_bunker/filter.iff",
		enhancedFilter = "object/tangible/dungeon/death_watch_bunker/enhanced_filter.iff",
		alumGel = "object/tangible/dungeon/death_watch_bunker/gel_packet.iff",
		medicine = "object/tangible/dungeon/death_watch_bunker/crazed_miner_medicine.iff",
		drillBattery = "object/tangible/dungeon/death_watch_bunker/drill_battery.iff",
		drillBatteryClean = "object/tangible/dungeon/death_watch_bunker/drill_battery_clean.iff",
		jetPackBase = "object/tangible/loot/dungeon/death_watch_bunker/jetpack_base.iff",
		jetPackStabilizer = "object/tangible/loot/dungeon/death_watch_bunker/jetpack_stabilizer.iff",
		ductedFan = "object/tangible/loot/dungeon/death_watch_bunker/ducted_fan.iff",
		injectorTank = "object/tangible/loot/dungeon/death_watch_bunker/fuel_injector_tank.iff",
		dispersionUnit = "object/tangible/loot/dungeon/death_watch_bunker/fuel_dispersion_unit.iff",
		binaryLiquid = "object/tangible/loot/dungeon/death_watch_bunker/binary_liquid.iff",
		protectiveLiquid = "object/tangible/loot/dungeon/death_watch_bunker/emulsion_protection.iff"
	},

	targetItems = {
		--Armorsmith Crafting Terminal
		{ "object/tangible/wearables/armor/mandalorian/armor_mandalorian_chest_plate.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_shoes.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_bicep_l.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_bicep_r.iff" },
		--Droid Engineer Crafting Terminal
		{ "object/tangible/wearables/armor/mandalorian/armor_mandalorian_helmet.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_bracer_l.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_bracer_r.iff" },
		--Tailor Crafting Terminal
		{ "object/tangible/wearables/armor/mandalorian/armor_mandalorian_leggings.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_gloves.iff",
			"object/tangible/wearables/armor/mandalorian/armor_mandalorian_belt.iff" },
		-- Jetpack Crafting Terminal
		{ "object/tangible/deed/vehicle_deed/jetpack_deed.iff" },
	},

	doorData = {
		{ cellAccess = 5996316, lockTime = 10, doorType = 1 }, -- Entrance
		{ cellAccess = 5996326, lockTime = 10, doorType = 2 }, -- Area A
		{ cellAccess = 5996338, lockTime = 10, doorType = 2 }, -- Area B
		{ cellAccess = 5996352, lockTime = 10, doorType = 2 }, -- Mines
		{ cellAccess = 5996374, lockTime = 6, doorType = 3 }, -- Armorsmith area
		{ cellAccess = 5996370, lockTime = 6, doorType = 3 }, -- DE area
		{ cellAccess = 5996368, lockTime = 6, doorType = 3 } -- Tailor area
	},

	states = {
		2,--entrance unlocked
		4,--terminal a unlocked
		8,--terminal b unlocked
		16,--terminal mines unlocked
		32,--armorsmith door unlocked
		64,--droidengineer door unlocked
		128--tailor door unlocked
	},

	doorMessages = {
		{ unlock = "@dungeon/death_watch:access_granted", lock = "@dungeon/death_watch:terminal_locked" },
		{ unlock = "@dungeon/death_watch:access_granted", lock = "@dungeon/death_watch:terminal_locked" },
		{ unlock = "@dungeon/death_watch:access_granted", lock = "@dungeon/death_watch:terminal_locked" },
		{ unlock = "@dungeon/death_watch:access_granted", lock = "@dungeon/death_watch:terminal_locked" },
		{ unlock = "@dungeon/death_watch:unlock_door", lock = "@dungeon/death_watch:room_in_use" },
		{ unlock = "@dungeon/death_watch:unlock_door", lock = "@dungeon/death_watch:room_in_use" },
		{ unlock = "@dungeon/death_watch:unlock_door", lock = "@dungeon/death_watch:room_in_use" }
	},

	requiredDoorItems = {
		{ },
		{ "object/tangible/dungeon/death_watch_bunker/passkey_hall.iff" },
		{ "object/tangible/dungeon/death_watch_bunker/passkey_storage.iff" },
		{ "object/tangible/dungeon/death_watch_bunker/passkey_mine.iff" },

		--ARMORSMITHDOOR
		{	"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_chest_plate.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_boots.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bicep_l.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bicep_r.iff"
		},

		--DROIDENGINEERDOOR
		{	"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_helmet.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bracer_l.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_bracer_r.iff"
		},

		--TAILORDOOR
		{	"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_leggings.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_gloves.iff",
			"object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_belt.iff" },

		-- Jetpack Crafting Terminal
		{ "object/tangible/deed/vehicle_deed/jetpack_deed.iff" },
	},

	partStrings = { "@dungeon/death_watch:armorsmith_items", "@dungeon/death_watch:droid_engineer_items", "@dungeon/death_watch:tailored_items" },

	terminalSkills = { "", "", "", "", "crafting_armorsmith_master", "crafting_droidengineer_master", "crafting_tailor_master", "crafting_artisan_master" },

	terminalSkillMessage = { "@dungeon/death_watch:master_armorsmith_required", "@dungeon/death_watch:master_droidengineer_required", "@dungeon/death_watch:master_tailor_required", "@dungeon/death_watch:master_artisan_required" },

	missingSkillMessage = { "", "", "", "", "@dungeon/death_watch:not_enough_armorsmith_skill", "@dungeon/death_watch:not_enough_droidengineer_skill", "@dungeon/death_watch:not_enough_tailor_skill" },

	mineCells = { 	5996352, 5996353, 5996354, 5996356, 5996357, 5996358, 5996359, 5996360, 5996361, 5996362,
		5996363, 5996364, 5996365, 5996366, 5996369, 5996372, 5996375, 5996376, 5996377,
	},

	spawnGroups = { "", "terminalAnextSpawn", "terminalBnextSpawn", "terminalCnextSpawn" },

	spawnEvents = { "", "spawnNextA", "spawnNextB", "spawnNextC" }
}

registerScreenPlay("DeathWatchBunkerScreenPlay", true)

function DeathWatchBunkerScreenPlay:start()
	if (isZoneEnabled("endor")) then
		local pBunker = getSceneObject(5996314)

		if pBunker == nil then
			return 0
		end

		self:spawnObjects()
		self:spawnMobiles()
		self:setupPermissionGroups()

		createEvent(1000 * 30, "DeathWatchBunkerScreenPlay", "poisonEvent", pBunker)
		createObserver(ENTEREDBUILDING, "DeathWatchBunkerScreenPlay", "onEnterDWB", pBunker)
		createObserver(EXITEDBUILDING, "DeathWatchBunkerScreenPlay", "onExitDWB", pBunker)
	end
end

function DeathWatchBunkerScreenPlay:setupPermissionGroups()
	for i = 1, #self.doorData, 1 do
		local pCell = getSceneObject(self.doorData[i].cellAccess)
		if pCell ~= nil then
			ObjectManager.withSceneObject(pCell, function(cell)
				cell:setContainerInheritPermissionsFromParent(false)
				cell:clearContainerDefaultDenyPermission(WALKIN)
				cell:clearContainerDefaultAllowPermission(WALKIN)
				cell:setContainerAllowPermission("DeathWatchBunkerDoor" .. i, WALKIN)
				cell:setContainerDenyPermission("DeathWatchBunkerDoor" .. i, MOVEIN)
			end)
		end
	end
end

function DeathWatchBunkerScreenPlay:givePermission(pPlayer, permissionGroup)
	ObjectManager.withCreaturePlayerObject(pPlayer, function(ghost)
		ghost:addPermissionGroup(permissionGroup, true)
	end)
end

function DeathWatchBunkerScreenPlay:removePermission(pPlayer, permissionGroup)
	ObjectManager.withCreaturePlayerObject(pPlayer, function(ghost)
		if (ghost:hasPermissionGroup(permissionGroup)) then
			ghost:removePermissionGroup(permissionGroup, true)
		end
	end)
end

function DeathWatchBunkerScreenPlay:hasPermission(pPlayer, permissionGroup)
	return ObjectManager.withCreaturePlayerObject(pPlayer, function(ghost)
		return ghost:hasPermissionGroup(permissionGroup)
	end)
end

function DeathWatchBunkerScreenPlay:spawnMobiles()
	for i,v in ipairs(deathWatchStaticSpawns) do
		spawnMobile("endor", v[1], v[2], v[3], v[4], v[5], v[6], v[7])
	end
end

function DeathWatchBunkerScreenPlay:spawnObjects()
	local spawnedSceneObject = LuaSceneObject(nil)
	local spawnedPointer

	-- Door Acces Terminal Outside
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -18.016,-12,-8.55806, 5996315, 1, 0, 0, 0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:access1", spawnedSceneObject:getObjectID())
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 1)

	-- Door Access Terminal A
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -84.4526,-20,-50.504,5996323,-0.707107,0,0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:access2", spawnedSceneObject:getObjectID())
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 2)

	-- Door Access Terminal B
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -8.3714,-32,-95.3985,5996331,-0.707107,0,0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:access3", spawnedSceneObject:getObjectID())
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 3)

	-- Door Access Terminal Mines
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", 26.1493,-64,-95.4288,5996347,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:access4", spawnedSceneObject:getObjectID())
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 4)

	-- Voice Recognition Terminal
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/terminal_free_s1.iff",74.7941,-54,-143.444,5996348,-0.707107,0,0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Voice Control Terminal")

	-- Armorsmith Access Terminal
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -232.11,-60,-219.996,5996373,0.707107,0,0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Armorsmith Crafting Room Entry Terminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 5)

	-- Droid Engineer Crafting Room Entry Terminal
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -230.09,-60,-124.003,5996367,0.707107,0,0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Droid Engineer Crafting Room Entry Terminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 6)

	-- Master Armorsmith Crafting Droid
	local spawn = deathWatchSpecialSpawns["armorsmithdroid"]

	spawnedPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Crafting Droid")
	spawnedSceneObject:setContainerComponent("deathWatchCraftingDroid")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 1)

	local droidId = spawnedSceneObject:getObjectID()

	-- Armorsmith Crafting Terminal (Biceps, Chest, Boots)
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/terminal_free_s1.iff",-246.097,-60,-245.163,5996374,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Mandalorian Engineering Unit")
	spawnedSceneObject:setObjectMenuComponent("deathWatchMandalorianCraftingTerminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droidId)


	-- Master Droid Engineer Crafting Droid
	spawn = deathWatchSpecialSpawns["droidengineerdroid"]
	spawnedPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Crafting Droid")
	spawnedSceneObject:setContainerComponent("deathWatchCraftingDroid")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 2)

	droidId = spawnedSceneObject:getObjectID()

	-- Master Droid Engineer Crafting Terminal (Bracer, Helmet)
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/terminal_free_s1.iff",-234.536,-40,-84.8062,5996370,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Mandalorian Engineering Unit")
	spawnedSceneObject:setObjectMenuComponent("deathWatchMandalorianCraftingTerminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 2)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droidId)


	-- Master Tailor Crafting Droid
	spawn = deathWatchSpecialSpawns["tailordroid"]
	spawnedPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Crafting Droid")
	spawnedSceneObject:setContainerComponent("deathWatchCraftingDroid")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 3)

	droidId = spawnedSceneObject:getObjectID()

	-- Tailor Crafting Terminal (Pants, Gloves, Belt)
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/terminal_free_s1.iff",-141.981,-60,-74.3199,5996368,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Mandalorian Engineering Unit")
	spawnedSceneObject:setObjectMenuComponent("deathWatchMandalorianCraftingTerminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 3)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droidId)

	-- Jetpack Crafting Droid
	spawn = deathWatchSpecialSpawns["jetpackdroid"]
	spawnedPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Jetpack Crafting Droid")
	spawnedSceneObject:setContainerComponent("deathWatchJetpackCraftingDroid")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 4)

	droidId = spawnedSceneObject:getObjectID()

	-- Master Artisan Crafting Terminal (Jetpack)
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/terminal_free_s1.iff",-265.425,-50.0002,-84.957,5996370,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Mandalorian Engineering Unit")
	spawnedSceneObject:setObjectMenuComponent("deathWatchMandalorianCraftingTerminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:craftingterminal", 4)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:droid", droidId)

	-- Tailor Access Terminal
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/door_control_terminal.iff", -151.045,-60,-98.8703,5996365,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Tailor Crafting Room Entry Terminal")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:accessEnabled", 1)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 7)

	--Write Data for Foreman
	writeData(5996314 .. ":dwb:haldo_busy", 0)

	-- Spawn Haldo
	local halnum = getRandomNumber(1,3)
	spawn = deathWatchSpecialSpawns["haldo" .. halnum]
	spawnedPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(5996314 .. ":dwb:haldo", spawnedSceneObject:getObjectID())
	createObserver(OBJECTDESTRUCTION, "DeathWatchBunkerScreenPlay", "haldoKilled", spawnedPointer)
	--createObserver(DAMAGERECEIVED, "DeathWatchBunkerScreenPlay", "haldoDamage", spawnPointer)

	-- Water Pressure Valve Control A
	spawnedPointer = spawnSceneObject("endor","object/tangible/terminal/terminal_water_pressure.iff",55.5855,-32,-92.8,5996340,1,0,0,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setObjectMenuComponent("deathWatchWaterValve")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 1)
	writeData(5996314 .. ":dwb:valve1", 0)

	-- Water Pressure Valve Control B
	spawnedPointer = spawnSceneObject("endor","object/tangible/terminal/terminal_water_pressure.iff",42.2316,-32,-72.5555,5996340,-0.707107,0,-0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setObjectMenuComponent("deathWatchWaterValve")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 2)
	writeData(5996314 .. ":dwb:valve2", 0)

	-- Water Pressure Valve Control C
	spawnedPointer = spawnSceneObject("endor","object/tangible/terminal/terminal_water_pressure.iff",73.7982,-32,-76.4291,5996340,0.707107,0,-0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setObjectMenuComponent("deathWatchWaterValve")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 3)
	writeData(5996314 .. ":dwb:valve3", 0)

	-- Water Pressure Valve Control D
	spawnedPointer = spawnSceneObject("endor","object/tangible/terminal/terminal_water_pressure.iff",56.0941,-32,-61.251,5996340,0,0,-1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setObjectMenuComponent("deathWatchWaterValve")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:terminal", 4)
	writeData(5996314 .. ":dwb:valve4", 0)

	-- Rebreather Filter Dispenser
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/filter_dispenser.iff",-12.8382,-52,-147.565,5996378,0,0,1,0)
	--createObserver(OBJECTRADIALUSED, "DeathWatchBunkerScreenPlay", "dispenser", spawnedPointer)

	-- Rebreather Workbench
	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/death_watch_bunker/workbench.iff",-16.2596,-52,-147.091,5996378,0,0,1,0)
	--createObserver(OBJECTRADIALUSED, "DeathWatchBunkerScreenPlay", "workbench", spawnedPointer)

	-- Loot Boxes
	spawnedPointer = spawnSceneObject("endor", "object/tangible/container/general/tech_chest.iff", -3.10801,-12,36.7064,5996318,0,0,-1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	spawnedSceneObject:setCustomObjectName("Chest")
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 1)
	createEvent(1000, "DeathWatchBunkerScreenPlay", "refillContainer", spawnedPointer)
	createObserver(OBJECTRADIALUSED, "DeathWatchBunkerScreenPlay", "boxLooted", spawnedPointer)

	spawnedPointer = spawnSceneObject("endor", "object/tangible/dungeon/coal_bin_container.iff",6.01353,-32,-102.05,5996337,0.707107,0,0.707107,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 2)
	createEvent(1000, "DeathWatchBunkerScreenPlay", "refillContainer", spawnedPointer)
	createObserver(OBJECTRADIALUSED, "DeathWatchBunkerScreenPlay", "boxLooted", spawnedPointer)

	spawnedPointer = spawnSceneObject("endor", "object/tangible/container/loot/placable_loot_crate_tech_armoire.iff", -2.78947,-32,-27.1899,5996335,0,0,1,0)
	spawnedSceneObject:_setObject(spawnedPointer)
	writeData(spawnedSceneObject:getObjectID() .. ":dwb:lootbox", 3)
	createEvent(1000, "DeathWatchBunkerScreenPlay", "refillContainer", spawnedPointer)
	createObserver(OBJECTRADIALUSED, "DeathWatchBunkerScreenPlay", "boxLooted", spawnedPointer)
end

function DeathWatchBunkerScreenPlay:onEnterDWB(sceneObject, creatureObject)
	ObjectManager.withCreatureObject(creatureObject, function(creature)
		if (creature:isAiAgent()) then
			return 0
		end

		if creature:hasScreenPlayState(2, "death_watch_bunker") == 0 then
			self:lockAll(creatureObject)
		else
			createEvent(10 * 1000, "DeathWatchBunkerScreenPlay", "lockCellsOnly", creatureObject)
		end
	end)
end

function DeathWatchBunkerScreenPlay:onExitDWB(sceneObject, creatureObject, long)
	ObjectManager.withCreatureObject(creatureObject, function(creature)
		if (creature:isAiAgent() == true) then
			return 0
		end

		if long == self.buildingIds.outside or long == 0 then
			creature:sendSystemMessage("@dungeon/death_watch:relock")

			creature:removeScreenPlayState(2, "death_watch_bunker")
			creature:removeScreenPlayState(4, "death_watch_bunker")
			creature:removeScreenPlayState(8, "death_watch_bunker")
			creature:removeScreenPlayState(16, "death_watch_bunker")
			creature:removeScreenPlayState(32, "death_watch_bunker")
			creature:removeScreenPlayState(64, "death_watch_bunker")
			creature:removeScreenPlayState(128, "death_watch_bunker")

			self:lockAll(creatureObject)
		end
	end)
end

function DeathWatchBunkerScreenPlay:diedWhileCrafting(pCreature, pAttacker, long)
	if pCreature == nil then
		return 1
	end

	local isCrafting = readData(CreatureObject(pCreature):getObjectID() .. ":dwb:currentlycrafting")

	if iscrafting == 0 then
		return 1
	else
		local id = readData(CreatureObject(pCreature):getObjectID() .. ":dwb:terminal")
		if id ~= 0 then
			local pTerminal = getSceneObject(id)
			if pTerminal ~= nil then
				CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:died_during_crafting")
				self:stopCraftingProcess(pCreature, pTerminal, false, false)
			end
		end
	end
	return 1
end

function DeathWatchBunkerScreenPlay:enableAccess(pSceneObject)
	writeData(SceneObject(pSceneObject):getObjectID() .. ":dwb:accessEnabled", 1)
end

function DeathWatchBunkerScreenPlay:respawnHaldo(creatureObject)
	local halNum = getRandomNumber(1,3)
	local spawn = deathWatchSpecialSpawns["haldo" .. halNum]
	local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	writeData(5996314 .. ":dwb:haldo", SceneObject(spawnPointer):getObjectID())
	createObserver(OBJECTDESTRUCTION, "DeathWatchBunkerScreenPlay", "haldoKilled", spawnPointer)
	--createObserver(DAMAGERECEIVED, "DeathWatchBunkerScreenPlay", "haldoDamage", spawnPointer)
end

function DeathWatchBunkerScreenPlay:lockCellsOnly(pCreature)
	if pCreature == nil then
		return 0
	end

	ObjectManager.withCreatureObject(pCreature, function(creature)
		if creature:hasScreenPlayState(2, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor1")
		end

		if creature:hasScreenPlayState(4, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor2")
		end

		if creature:hasScreenPlayState(8, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor3")
		end

		if creature:hasScreenPlayState(16, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor4")
		end

		if creature:hasScreenPlayState(32, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor5")
		end

		if creature:hasScreenPlayState(64, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor6")
		end

		if creature:hasScreenPlayState(128, "death_watch_bunker") == 0 then
			self:removePermission(pCreature, "DeathWatchBunkerDoor7")
		end
	end)
end

function DeathWatchBunkerScreenPlay:boxLooted(pSceneObject, pCreature, selectedID)
	if selectedID ~= 16 then
		return 0
	end

	if readData(SceneObject(pSceneObject):getObjectID() .. ":dwb:spawned") == 1 then
		return 0
	else
		local boxId = readData(SceneObject(pSceneObject):getObjectID() .. ":dwb:lootbox")
		writeData(SceneObject(pSceneObject):getObjectID() .. ":dwb:spawned", 1)

		--spawn enemies
		if boxId == 1 then
			local spawn = deathWatchSpecialSpawns["lootbox1mob1"]
			spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		elseif boxId == 2 then
			local spawn = deathWatchSpecialSpawns["lootbox2mob1"]
			spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		elseif boxId == 3 then
			local spawn = deathWatchSpecialSpawns["lootbox3mob1"]
			spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
			local spawn = deathWatchSpecialSpawns["lootbox3mob2"]
			spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		end

		createEvent(240 * 1000, "DeathWatchBunkerScreenPlay", "refillContainer", pSceneObject)
	end
end

function DeathWatchBunkerScreenPlay:refillContainer(pSceneObject)
	if (pSceneObject == nil) then
		return
	end

	writeData(SceneObject(pSceneObject):getObjectID() .. ":dwb:spawned", 0)

	if (SceneObject(pSceneObject):getContainerObjectsSize() == 0) then
		createLoot(pSceneObject, "death_watch_bunker_lootbox", 1, false)
		if getRandomNumber(100) > 95 then
			createLoot(pSceneObject, "death_watch_bunker_lootbox", 1, false)
		end
	end
end

function DeathWatchBunkerScreenPlay:poisonEvent(pSceneObject)
	for i,v in ipairs(self.mineCells) do
		local pCell = getSceneObject(v)
		if pCell ~= nil then
			local cellSize = SceneObject(pCell):getContainerObjectsSize()

			for j = 0, cellSize - 1, 1 do
				local pObject = SceneObject(pCell):getContainerObject(j)

				if pObject ~= nil then
					if (SceneObject(pObject):isCreatureObject()) then
						if (not CreatureObject(pObject):isAiAgent() and not self:hasRebreather(pObject) == 1) then
							self:doPoison(pObject)
						end
					end
				end
			end
		end
	end
	createEvent(1000 * (50 + getRandomNumber(0,20)) , "DeathWatchBunkerScreenPlay", "poisonEvent", pSceneObject)
end

function DeathWatchBunkerScreenPlay:timeWarning(pCreature)
	if pCreature == nil then
		return
	end
	
	if (CreatureObject(pCreature):isGrouped()) then
		local groupSize = CreatureObject(pCreature):getGroupSize()

		for i = 0, groupSize - 1, 1 do
			local pMember = CreatureObject(pCreature):getGroupMember(i)
			if pMember ~= nil then
				if CreatureObject(pMember):getParentID() > 5996313 and CreatureObject(pMember):getParentID() < 5996380 then
					CreatureObject(pMember):sendGroupMessage("@dungeon/death_watch:thirty_seconds")
				end
			end
		end
	else
		CreatureObject(pCreature):sendGroupMessage("@dungeon/death_watch:thirty_seconds")
	end
end

function DeathWatchBunkerScreenPlay:removeFromBunker(pCreature)
	if (pCreature == nil) then
		return 0
	end

	if (CreatureObject(pCreature):isGrouped()) then
		local groupSize = CreatureObject(pCreature):getGroupSize()

		for i = 0, groupSize - 1, 1 do
			local pMember = CreatureObject(pCreature):getGroupMember(i)
			if pMember ~= nil then
				if CreatureObject(pMember):getParentID() > 5996313 and CreatureObject(pMember):getParentID() < 5996380 then
					createEvent(500, "DeathWatchBunkerScreenPlay", "teleportPlayer", pMember)
				end
			end
		end
	else
		createEvent(500, "DeathWatchBunkerScreenPlay", "teleportPlayer", pCreature)
	end
end

function DeathWatchBunkerScreenPlay:teleportPlayer(pCreature)
	if (pCreature == nil) then
		return 0
	end
	CreatureObject(pCreature):teleport(-4657, 14.4, 4322.3, 0)
	self:lockAll(pCreature)
end

function DeathWatchBunkerScreenPlay:haldoTimer(pCreature)
	writeData(5996314 .. ":dwb:haldo_busy", 0)
	ObjectManager.withCreatureObject(pCreature, function(creature)
		if creature:hasScreenPlayState(4, "death_watch_foreman_stage") == 0 then
			creature:removeScreenPlayState(1, "death_watch_foreman_stage")
			creature:removeScreenPlayState(2, "death_watch_foreman_stage")
			creature:removeScreenPlayState(4, "death_watch_foreman_stage")
			creature:sendSystemMessage("@dungeon/death_watch:haldo_failed")
			creature:setScreenPlayState(1, "death_watch_foreman_stage_failed")
			createEvent(1000 * 60 * 20, "DeathWatchBunkerScreenPlay", "unlockHaldo", pCreature)
		end
	end)
end

function DeathWatchBunkerScreenPlay:pumpTimer(pCreature)
	ObjectManager.withCreatureObject(pCreature, function(creature)
		if creature:hasScreenPlayState(64, "death_watch_foreman_stage") == 0 then
			creature:removeScreenPlayState(32, "death_watch_foreman_stage")
			creature:setScreenPlayState(3, "death_watch_foreman_stage_failed")
			creature:sendSystemMessage("@dungeon/death_watch:water_pressure_failed")
		end
	end)
end

function DeathWatchBunkerScreenPlay:unlockHaldo(pCreature)
	if (pCreature == nil) then
		return 0
	end
	CreatureObject(pCreature):removeScreenPlayState(1, "death_watch_foreman_stage_failed")
end

function DeathWatchBunkerScreenPlay:destroyIngredient(pIngredient)
	if pIngredient ~= nil then
		SceneObject(pIngredient):destroyObjectFromWorld()
		SceneObject(pIngredient):destroyObjectFromDatabase()
	end
end

--------------------------------------------------------------
--   Key Spawn Events                                        -
--------------------------------------------------------------
function DeathWatchBunkerScreenPlay:spawnNextA(pCreature)
	local nextSpawn = readData(5996314 .. ":dwb:terminalAnextSpawn")

	if nextSpawn == 0 then
		return 0
	elseif nextSpawn == 1 then
		writeData(5996314 .. ":dwb:terminalAnextSpawn", 2)
		local spawn = deathWatchSpecialSpawns["rageon_vart_assist1"]
		createEvent((getRandomNumber(0, 10) + 30) * 1000, "DeathWatchBunkerScreenPlay", "spawnNextA", pCreature)
		local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spatialMoodChat(spawnPointer, "@dungeon/death_watch:call_back_up", 102)
	elseif nextSpawn == 2 then
		writeData(5996314 .. ":dwb:terminalAnextSpawn", 3)
		local spawn = deathWatchSpecialSpawns["rageon_vart_assist2"]
		createEvent((getRandomNumber(0, 10) + 30) * 1000, "DeathWatchBunkerScreenPlay", "spawnNextA", pCreature)
		local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spatialMoodChat(spawnPointer, "@dungeon/death_watch:call_back_up", 40)
	else
		writeData(5996314 .. ":dwb:terminalAnextSpawn", 0)
		local spawn = deathWatchSpecialSpawns["rageon_vart"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	end
end

function DeathWatchBunkerScreenPlay:spawnNextB(pCreature)
	local nextSpawn = readData(5996314 .. ":dwb:terminalBnextSpawn")

	if nextSpawn == 0 then
		return 0
	elseif nextSpawn == 1 then
		writeData(5996314 .. ":dwb:terminalBnextSpawn", 2)
		local spawn = deathWatchSpecialSpawns["klin_nif_assist1"]
		createEvent((getRandomNumber(0, 10) + 30) * 1000, "DeathWatchBunkerScreenPlay", "spawnNextB", pCreature)
		local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spatialMoodChat(spawnPointer, "@dungeon/death_watch:call_back_up", 31)
	elseif nextSpawn == 2 then
		writeData(5996314 .. ":dwb:terminalBnextSpawn", 3)
		local spawn = deathWatchSpecialSpawns["klin_nif_assist2"]
		createEvent((getRandomNumber(0, 10) + 30) * 1000, "DeathWatchBunkerScreenPlay", "spawnNextB", pCreature)
		local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spatialMoodChat(spawnPointer, "@dungeon/death_watch:call_back_up", 67)
	else
		writeData(5996314 .. ":dwb:terminalBnextSpawn", 0)
		local spawn = deathWatchSpecialSpawns["klin_nif"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	end
end

function DeathWatchBunkerScreenPlay:spawnNextC(creatureObject)
	local nextSpawn = readData(5996314 .. ":dwb:terminalCnextSpawn")
	if nextSpawn == 0 then
		return 0
	elseif nextSpawn == 1 then
		writeData(5996314 .. ":dwb:terminalCnextSpawn", 2)
		local spawn = deathWatchSpecialSpawns["fenri_dalso_assist1"]
		createEvent((getRandomNumber(0, 10) + 30) * 1000, "DeathWatchBunkerScreenPlay", "spawnNextC", creatureObject)
		local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spatialMoodChat(spawnPointer, "@dungeon/death_watch:call_back_up", 37)
	elseif nextSpawn == 2 then
		writeData(5996314 .. ":dwb:terminalCnextSpawn", 3)
		local spawn = deathWatchSpecialSpawns["fenri_dalso_assist2"]
		createEvent((getRandomNumber(0, 10) + 30) * 1000, "DeathWatchBunkerScreenPlay", "spawnNextC", creatureObject)
		local spawnPointer = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spatialMoodChat(spawnPointer, "@dungeon/death_watch:call_back_up", 21)
	else
		writeData(5996314 .. ":dwb:terminalCnextSpawn", 0)
		local spawn = deathWatchSpecialSpawns["fenri_dalso_add1"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawn = deathWatchSpecialSpawns["fenri_dalso_add2"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawn = deathWatchSpecialSpawns["fenri_dalso_add3"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawn = deathWatchSpecialSpawns["fenri_dalso_add4"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawn = deathWatchSpecialSpawns["fenri_dalso"]
		spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
	end
end

--   DeathWatchBunkerScreenPlay whether a creature has sufficient skill to access a particular crafting room
function DeathWatchBunkerScreenPlay:hasRequiredSkill(room, pCreature)
	if (room < 1 or room > 8) then
		return false
	end

	return CreatureObject(pCreature):hasSkill(self.terminalSkills[room])
end

-- Checks whether a creature has an Alum Mineral
function DeathWatchBunkerScreenPlay:hasAlumMineral(pCreature)
	if pCreature == nil then
		return false
	end

	local pInventory = SceneObject(pCreature):getSlottedObject("inventory")

	if (pInventory == nil) then
		return false
	end

	return getContainerObjectByTemplate(pInventory, self.bunkerItems.alumMineral, true) ~= nil
end

-- Checks whether a creature has all necessary items to access a particular crafting room  -
function DeathWatchBunkerScreenPlay:findRequiredItem(room, pCreature)
	if (pCreature == nil) then
		return nil
	end

	if (room < 1 or room > 7) then
		return nil
	end

	local pInventory = SceneObject(pCreature):getSlottedObject("inventory")

	if (pInventory == nil) then
		return nil
	end

	local table = self.requiredDoorItems[room]

	for i,v in ipairs(table) do
		local pObj = getContainerObjectByTemplate(pInventory, v, true)
		if (pObj ~= nil) then
			return pObj
		end
	end
	return nil
end

--   Checks whether a creature has sufficient protection against alum mine poison  -
function DeathWatchBunkerScreenPlay:hasRebreather(pSceneObject)
	local pRebreather = SceneObject(pSceneObject):getSlottedObject("eyes")

	if (pRebreather == nil) then
		return 0
	end

	local headSlot = SceneObject(pRebreather):getTemplateObjectPath()

	if (headSlot == self.bunkerItems.mandoRebreather) then
		return SceneObject(pSceneObject):getCustomObjectName() == "Advanced Rebreather"
	elseif (headSlot == self.bunkerItems.mandoHelmet) then
		return 1
	end
	return 0
end

--   Inflict poison damage on a creature
function DeathWatchBunkerScreenPlay:doPoison(pCreature)
	if pCreature == nil then
		return 0
	end

	CreatureObject(pCreature):inflictDamage(pCreature, 0, 100, 0)
	CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:bad_air")
end

--   Lock all restricted cells to a creature  -
function DeathWatchBunkerScreenPlay:lockAll(pCreature)
	if pCreature == nil then
		return 0
	end

	for i = 1, #self.doorData, 1 do
		self:removePermission(pCreature, "DeathWatchBunkerDoor" .. i)
	end
end

function DeathWatchBunkerScreenPlay:spawnDefenders(number, pCreature)
	if number < 1 or number > 4 then
		return 0
	end

	if number == 1 then
		local spawn = deathWatchSpecialSpawns["entrance1"]
		local spawnPointer1 = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])
		spawn = deathWatchSpecialSpawns["entrance2"]
		local spawnPointer2 = spawnMobile("endor", spawn[1], spawn[2], spawn[3], spawn[4], spawn[5], spawn[6], spawn[7])

		if pCreature ~= nil then
			CreatureObject(spawnPointer1):engageCombat(pCreature)
			CreatureObject(spawnPointer2):engageCombat(pCreature)
		end
	else
		writeData(5996314 .. ":dwb:" .. self.spawnGroups[number], 1)
		createEvent(2 * 1000, "DeathWatchBunkerScreenPlay", self.spawnEvents[number], pCreature)
	end
end

function DeathWatchBunkerScreenPlay:unlockForGroup(number, pCreature, cells)
	ObjectManager.withCreatureObject(pCreature, function(creature)
		-- screenplaystates for login/logout
		if (creature:isGrouped()) then
			local groupSize = creature:getGroupSize()

			for i = 0, groupSize - 1, 1 do
				local pMember = creature:getGroupMember(i)
				if pMember ~= nil then
					local groupMember = LuaCreatureObject(pMember)

					local parentID = groupMember:getParentID()

					if (cells and parentID > 5996313 and parentID < 5996380) or ((not cells) and groupMember:getZoneName() == "endor") then
						groupMember:setScreenPlayState(self.states[number], "death_watch_bunker")
						self:givePermission(pMember, "DeathWatchBunkerDoor" .. number)
						groupMember:sendSystemMessage(self.doorMessages[number].unlock)
					end
				end
			end
		else
			creature:setScreenPlayState(self.states[number], "death_watch_bunker")
			self:givePermission(pCreature, "DeathWatchBunkerDoor" .. number)
			creature:sendSystemMessage(self.doorMessages[number].unlock)
		end
	end)
end

function DeathWatchBunkerScreenPlay:checkDoor(pSceneObject, pCreature)
	if pCreature == nil or pSceneObject == nil then
		return
	end

	ObjectManager.withCreatureObject(pCreature, function(creature)
		local doorEnabled = readData(SceneObject(pSceneObject):getObjectID() .. ":dwb:accessEnabled")
		local doorNumber = readData(SceneObject(pSceneObject):getObjectID() .. ":dwb:terminal")

		local doorType = self.doorData[doorNumber].doorType

		if doorType == 1 then
			local state = creature:hasScreenPlayState(1, "death_watch_bunker")
			if state == 0 then
				if (doorEnabled == 0) then
					creature:sendSystemMessage(self.doorMessages[doorNumber].lock)
					return
				end

				creature:sendGroupMessage("@dungeon/death_watch:airlock_backup")
				self:spawnDefenders(doorNumber, pCreature)
			else
				self:unlockForGroup(doorNumber, pCreature, false)
				return
			end
		elseif doorType == 2 then
			local requiredItem = self:findRequiredItem(doorNumber, pCreature)
			if (requiredItem == nil) then
				if (doorEnabled == 0) then
					creature:sendSystemMessage(self.doorMessages[doorNumber].lock)
					return
				end

				creature:sendGroupMessage("@dungeon/death_watch:denied_access")
				self:spawnDefenders(doorNumber, pCreature)
			else
				self:unlockForGroup(doorNumber, pCreature, true)
				SceneObject(requiredItem):destroyObjectFromWorld()
				SceneObject(requiredItem):destroyObjectFromDatabase()
				return
			end
		elseif doorType == 3 then
			if (doorEnabled == 0) then
				creature:sendSystemMessage(self.doorMessages[doorNumber].lock)
				return
			end

			if (self:findRequiredItem(doorNumber, pCreature) == nil or self:hasAlumMineral(pCreature) == false) then
				creature:sendSystemMessage("@dungeon/death_watch:not_enough_ingredients")
				return
			end

			if (self:hasRequiredSkill(doorNumber, pCreature) == false) then
				creature:sendSystemMessage(self.missingSkillMessage[doorNumber])
				return
			end

			self:unlockForGroup(doorNumber, pCreature, true)

			local pCell = getSceneObject(self.doorData[doorNumber].cellAccess)
			if pCell == nil then
				return
			end

			createEvent(1000 * 60 * 5, "DeathWatchBunkerScreenPlay", "removeFromBunker", pCreature)
			createEvent(1000 * 60 * 4.5, "DeathWatchBunkerScreenPlay", "timeWarning", pCreature)
			createEvent(1000 * 60 * 5.5, "DeathWatchBunkerScreenPlay", "despawnCell", pCell)
		end

		writeData(SceneObject(pSceneObject):getObjectID() .. ":dwb:accessEnabled", 0)
		createEvent(1000 * 60 * self.doorData[doorNumber].lockTime, "DeathWatchBunkerScreenPlay", "enableAccess", pSceneObject)
	end)
end

function DeathWatchBunkerScreenPlay:despawnCell(pCell)
	if pCell == nil then
		return
	end

	local cellSize = SceneObject(pCell):getContainerObjectsSize()
	for i = 0, cellSize - 1, 1 do
		local pObject = SceneObject(pCell):getContainerObject(i)
		if pObject ~= nil then
			if SceneObject(pObject):isCreatureObject() then
				local template = object:getTemplateObjectPath()

				if string.find(template, "death_watch") ~= nil or string.find(template, "battle_droid") ~= nil then
					createEvent(1000, "DeathWatchBunkerScreenPlay", "despawnCreature", pObject)
				end
			end
		end
	end
end

function DeathWatchBunkerScreenPlay:despawnCreature(pObject)
	if pObject ~= nil then
		SceneObject(pObject):destroyObjectFromWorld()
	end
end

function DeathWatchBunkerScreenPlay:startForemanQuestStage(number, pCreature)
	if pCreature == nil then
		return
	end

	if number == 1 then
		writeData(5996314 .. ":dwb:haldo_busy", 1)
		writeData(5996314 .. ":dwb:haldo_player", CreatureObject(pCreature):getObjectID())
		createEvent(1000 * 60 * 60, "DeathWatchBunkerScreenPlay", "haldoTimer", pCreature)
	elseif number == 2 then
		createEvent(1000 * 60 * 60, "DeathWatchBunkerScreenPlay", "pumpTimer", pCreature)
	end
end

function DeathWatchBunkerScreenPlay:storeTime(pCreature)
	if pCreature ~= nil then
		local time = os.time()
		writeScreenPlayData(pCreature, "DeathWatchBunkerScreenPlay", "time", time)
	end
end

function DeathWatchBunkerScreenPlay:checkTime(pCreature)
	if pCreature == nil then
		return false
	end

	local currentTime = os.time()
	local receivedTime = readScreenPlayData(pCreature, "DeathWatchBunkerScreenPlay", "time")

	if receivedTime == "" then
		return false
	end

	local seconds = os.difftime(currentTime, receivedTime)

	if (seconds > 216000) then --more then 60 hours passed
		return true
	end

	return false
end

function DeathWatchBunkerScreenPlay:cancelCrafting(pTerm)
	if pTerm == nil then
		return
	end

	local isCrafting = readData(SceneObject(pTerm):getObjectID() .. ":dwb:currentlycrafting")

	if isCrafting > 0 and isCrafting < 4 then
		local id = readData(SceneObject(pTerm):getObjectID() .. ":dwb:user")
		if id ~= 0 then
			local pCreature = getSceneObject(id)
			if pCreature ~= nil then
				CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:took_too_long")
				self:stopCraftingProcess(pCreature, pTerm, false, true)
			end
		end
	end
end

function DeathWatchBunkerScreenPlay:stopCraftingProcess(pCreature, pTerm, successful, teleport)
	if pCreature == nil or pTerm == nil then
		return
	end

	ObjectManager.withSceneObject(pTerm, function(terminal)
		local number = readData(terminal:getObjectID() .. ":dwb:craftingterminal")
		local target = readData(terminal:getObjectID() .. ":dwb:targetitemindex")

		writeData(CreatureObject(pCreature):getObjectID() .. ":dwb:currentlycrafting", 0)
		writeData(terminal:getObjectID() .. ":dwb:currentlycrafting", 0)

		if successful == true then
			local creo = LuaSceneObject(pCreature)
			local pInventory = creo:getSlottedObject("inventory")

			if (pInventory == nil) then
				return 0
			end

			local targetItems = self.targetItems[number]
			local reward = giveItem(pInventory, targetItems[target], -1)
			CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:crafting_finished")

			if (reward == nil) then
				return 0
			end
		end

		writeData(CreatureObject(pCreature):getObjectID() .. ":dwb:terminal", 0)
		writeData(terminal:getObjectID() .. ":dwb:user", 0)
		writeData(terminal:getObjectID() .. ":dwb:targetitemindex", 0)


		if number == 4 then
			writeData(terminal:getObjectID() .. ":dwb:alummineral", 0)
			writeData(terminal:getObjectID() .. ":dwb:jetpackbase", 0)
			writeData(terminal:getObjectID() .. ":dwb:jetpackstabilizer", 0)
			writeData(terminal:getObjectID() .. ":dwb:ductedfan", 0)
			writeData(terminal:getObjectID() .. ":dwb:injectortank", 0)
			writeData(terminal:getObjectID() .. ":dwb:dispersionunit", 0)
		else
			writeData(terminal:getObjectID() .. ":dwb:alummineral", 0)
			writeData(terminal:getObjectID() .. ":dwb:binary", 0)
			writeData(terminal:getObjectID() .. ":dwb:protective", 0)
			writeData(terminal:getObjectID() .. ":dwb:bharmorpart", 0)
		end

		if teleport == true then
			createEvent(5000, "DeathWatchBunkerScreenPlay", "teleportPlayer", pCreature)
		end
	end)
end

function DeathWatchBunkerScreenPlay:sendUseTerminalMessage(pCreature)
	if pCreature ~= nil then
		CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:use_terminal")
	end
end

function DeathWatchBunkerScreenPlay:startCraftingProcess(pCreature, pTerminal)
	if pCreature == nil or pTerminal == nil then
		return
	end

	createEvent(1000 * 30, "DeathWatchBunkerScreenPlay", "cancelCrafting", pTerminal)
	createEvent(1000, "DeathWatchBunkerScreenPlay", "sendUseTerminalMessage", pCreature)
	writeData(CreatureObject(pCreature):getObjectID() .. ":dwb:currentlycrafting", 1)
	createObserver(OBJECTDESTRUCTION, "DeathWatchBunkerScreenPlay", "diedWhileCrafting", pCreature)
end

function DeathWatchBunkerScreenPlay:nextCraftingStep(pTerm)
	if pTerm == nil then
		return
	end

	writeData(SceneObject(pTerm):getObjectID() .. ":dwb:currentlycrafting", 3)
	local creoId = readData(SceneObject(pTerm):getObjectID() .. ":dwb:user")
	if creoId ~= 0 then
		local pCreature = getSceneObject(creoId)
		if pCreature ~= nil then
			CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:use_terminal")
		end
	end
end

function DeathWatchBunkerScreenPlay:finishCraftingStep(pTerm)
	if pTerm == nil then
		return
	end

	local creoId = readData(SceneObject(pTerm):getObjectID() .. ":dwb:user")
	if creoId ~= 0 then
		local pCreature = getSceneObject(creoId)
		if pCreature ~= nil then
			CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:crafting_finished")
			self:stopCraftingProcess(pCreature, pTerm, true, true)
		end
	end
end

function DeathWatchBunkerScreenPlay:getObjOwner(pObj)
	local pPlayerInv = SceneObject(pObj):getParent()

	if (pPlayerInv == nil) then
		return nil
	end

	local parent = SceneObject(pPlayerInv):getParent()

	if (parent == nil) then
		return nil
	end

	if (SceneObject(parent):isCreatureObject()) then
		return parent
	end

	return nil
end

function DeathWatchBunkerScreenPlay:craftingConfirmCallback(pCreature, pSui, cancelPressed)
	local suiBox = LuaSuiBox(pSui)
	local pUsingObject = suiBox:getUsingObject()

	if (pUsingObject == nil) then
		return 0
	end

	local step = readData(SceneObject(pUsingObject):getObjectID() .. ":dwb:currentlycrafting")

	if step == 1 then
		writeData(SceneObject(pUsingObject):getObjectID() .. ":dwb:currentlycrafting", 2)
		CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:alum_process_begun")
		createEvent(5 * 1000, "DeathWatchBunkerScreenPlay", "nextCraftingStep", pUsingObject)
	elseif step == 3 then
		writeData(SceneObject(pUsingObject):getObjectID() .. ":dwb:currentlycrafting", 4)
		CreatureObject(pCreature):sendSystemMessage("@dungeon/death_watch:aeration_process_begun")
		createEvent(5 * 1000, "DeathWatchBunkerScreenPlay", "finishCraftingStep", pUsingObject)
	end

	return 0
end