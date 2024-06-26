local ObjectManager = require("managers.object.object_manager")

jowir_arlensa_missions =
	{
		{
			missionType = "confiscate",
			planetName = "tatooine",
			preReq = { type = "item", itemTemplate = "object/tangible/loot/quest/quest_item_goru_calling_card.iff", destroy = true },
			primarySpawns =
			{
				{ npcTemplate = "jowir_valarian_assassin", npcName = "Valarian Assassin" },
			},
			secondarySpawns =
			{
				{ npcTemplate = "valarian_assassin", npcName = "Valarian Assassin" },
				{ npcTemplate = "valarian_enforcer", npcName = "Valarian Enforcer" },
				{ npcTemplate = "valarian_enforcer", npcName = "Valarian Enforcer" },
				{ npcTemplate = "valarian_henchman", npcName = "Valarian Henchman" },
				{ npcTemplate = "valarian_scout", npcName = "Valarian Scout" },
			},
			itemSpawns =
			{
				{ itemTemplate = "object/tangible/loot/quest/quest_item_spice_jar.iff", itemName = "" }
			},
			rewards =
			{
				{ rewardType = "loot", lootGroup = "task_reward_jowir_arlensa" },
			}
		}
	}

palu_zerk_missions =
	{
		{
			missionType = "escort",
			planetName = "tatooine",
			primarySpawns =
			{
				{ npcTemplate = "feinu_zerk", npcName = "Feinu Zerk" }
			},
			secondarySpawns = {
				{ npcTemplate = "valarian_swooper_leader", npcName = "Valarian Swooper Leader" },
				{ npcTemplate = "valarian_thug", npcName = "Valarian Thug" },
				{ npcTemplate = "valarian_thug", npcName = "Valarian Thug" },
				{ npcTemplate = "valarian_thug", npcName = "Valarian Thug" },
			},
			itemSpawns = {},
			rewards =
			{
				{ rewardType = "loot", lootGroup = "task_reward_palu_zerk" },
			}
		},
	}

npcMapZicx =
	{
		{
			spawnData = { planetName = "rori", npcTemplate = "goru_rainstealer", x = -5431.4, z = 80, y = -2241.3, direction = 33, cellID = 0, position = STAND },
			worldPosition = { x = -5430, y = -2240 },
			stfFile = "@epic_quest/zicx_bug_bomb/rori_goru_rainstealer",
		},
		{
			spawnData = { planetName = "tatooine", npcTemplate = "jowir_arlensa", x = -5252.74, z = 75, y = -6553.42, direction = 46.6563, cellID = 0, position = STAND },
			worldPosition = { x = -5249, y = -6551 },
			npcNumber = 1,
			stfFile = "@spawning/static_npc/tato_zicx_jowir",
			missions = jowir_arlensa_missions
		},
		{
			spawnData = { planetName = "tatooine", npcTemplate = "palu_zerk", x = -5049.46, z = 75, y = -6585.53, direction = 60, cellID = 0, position = STAND },
			worldPosition = { x = -5048, y = -6586 },
			npcNumber = 2,
			stfFile = "@spawning/static_npc/tato_zicx_palu",
			missions = palu_zerk_missions
		}
	}

ZicxBugBomb = ThemeParkLogic:new {
	npcMap = npcMapZicx,
	className = "ZicxBugBomb",
	screenPlayState = "zicx_bug_bomb",
	requiredPlanets = { "rori", "tatooine" },
	distance = 200,
}

ZicxContainerComponent = {}

function ZicxContainerComponent:transferObject(pContainer, pObj, slot)
	local pPlayer = ZicxBugBomb:getObjOwner(pObj)

	if (pPlayer == nil) then
		return 0
	end

	local objectTemplate = SceneObject(pObj):getTemplateObjectPath()

	if (not CreatureObject(pPlayer):hasScreenPlayState(1, "zicx_bug_bomb_goruNpc") or CreatureObject(pPlayer):hasScreenPlayState(8, "zicx_bug_bomb_goruNpc")) then
		return 0
	elseif (objectTemplate == "object/tangible/loot/quest/quest_item_zicx_bug_jar.iff") then
		if (not CreatureObject(pPlayer):hasScreenPlayState(4, "zicx_bug_bomb_goruNpc")) then
			spatialChat(pContainer, "@epic_quest/zicx_bug_bomb/rori_goru_rainstealer:get_the_bile")
		else
			spatialChat(pContainer, "@epic_quest/zicx_bug_bomb/rori_goru_rainstealer:give_a_minute")
		end
		CreatureObject(pPlayer):setScreenPlayState(2, "zicx_bug_bomb_goruNpc")
	elseif (objectTemplate == "object/tangible/loot/quest/quest_item_sarlacc_bile_jar.iff") then
		if (not CreatureObject(pPlayer):hasScreenPlayState(2, "zicx_bug_bomb_goruNpc")) then
			spatialChat(pContainer, "@epic_quest/zicx_bug_bomb/rori_goru_rainstealer:get_the_bugs")
		else
			spatialChat(pContainer, "@epic_quest/zicx_bug_bomb/rori_goru_rainstealer:give_a_minute")
		end
		CreatureObject(pPlayer):setScreenPlayState(4, "zicx_bug_bomb_goruNpc")
	else
		spatialChat(pContainer, "@epic_quest/zicx_bug_bomb/rori_goru_rainstealer:what_is_this")
		return 0
	end
	SceneObject(pObj):destroyObjectFromWorld()
	SceneObject(pObj):destroyObjectFromDatabase()
	return 0
end

function ZicxContainerComponent:canAddObject(pContainer, pObj, slot)
	local pPlayer = ZicxBugBomb:getObjOwner(pObj)

	if (pPlayer == nil) then
		return -1
	end

	if (CreatureObject(pPlayer):hasScreenPlayState(1, "zicx_bug_bomb_goruNpc") and not CreatureObject(pPlayer):hasScreenPlayState(8, "zicx_bug_bomb_goruNpc")) then
		return true
	else
		return -1
	end
end

function ZicxBugBomb:getObjOwner(pObj)
	if (pObj == nil) then
		return nil
	end

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


function ZicxContainerComponent:removeObject(pContainer, pObj, slot)
	return -1
end

-- Custom spawnNpcs to handle setting npcs as containers for quest item turnin
function ZicxBugBomb:spawnNpcs()
	local planetName = self.planetName
	for i = 1, # self.npcMap do
		local npcSpawnData = self.npcMap[i].spawnData

		if (npcSpawnData.planetName ~= nil and npcSpawnData.planetName ~= "") then
			planetName = npcSpawnData.planetName
		end

		local pNpc = spawnMobile(planetName, npcSpawnData.npcTemplate, 1, npcSpawnData.x, npcSpawnData.z, npcSpawnData.y, npcSpawnData.direction, npcSpawnData.cellID)

		if (pNpc ~= nil) then
			if npcSpawnData.position == SIT then
				CreatureObject(pNpc):setState(SITTINGONCHAIR)
			end

			if (npcSpawnData.npcTemplate == "goru_rainstealer") then
				SceneObject(pNpc):setContainerComponent("ZicxContainerComponent")
			end

			AiAgent(pNpc):addObjectFlag(AI_STATIONARY)
		end
	end
end

registerScreenPlay("ZicxBugBomb", true)

zicx_bug_bomb_mission_giver_conv_handler = mission_giver_conv_handler:new {
	themePark = ZicxBugBomb
}

zicx_bug_bomb_mission_target_conv_handler = mission_target_conv_handler:new {
	themePark = ZicxBugBomb
}

epic_quest_zicx_bug_bomb_goru = GoruConvoHandler:new {
	themePark = ZicxBugBomb
}
