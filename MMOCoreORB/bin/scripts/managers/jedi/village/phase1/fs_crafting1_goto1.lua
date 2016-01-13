local GoToLocation = require("quest.tasks.go_to_location")
local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")
local VillageJediManagerTownship = require("managers.jedi.village.village_jedi_manager_township")
local FsCrafting1Goto2 = require("managers.jedi.village.phase1.fs_crafting1_goto2")
require("utils.helpers")

FsCrafting1Goto1 = GoToLocation:new {
	-- Task properties
	taskName = "FsCrafting1Goto1",
	-- GoToLocation properties
	waypointDescription = "@quest/quest_journal/fs_quests_craft1:s_01",
	spawnPoint = { x = 5419, y = -4119 },
	spawnPlanet = "dathomir",
	spawnRadius = 8,
}

-- Event handler for the enter active area event.
-- The event will complete the task.
-- @param pCreatureObject pointer to the creature object of the player.
function FsCrafting1Goto1:onEnteredActiveArea(pCreatureObject)
	if (pCreatureObject == nil) then
		return 1
	end

	QuestManager.completeQuest(pCreatureObject, QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_01)

	self:finish(pCreatureObject)
	FsCrafting1Goto2:start(pCreatureObject)

	return 1
end

-- Event handler for the onSuccessfulSpawn.
-- The event will activate the quest.
-- @param pCreatureObject pointer to the creature object of the player.
function FsCrafting1Goto1:onSuccessfulSpawn(pCreatureObject)
	if (pCreatureObject == nil) then
		return
	end

	QuestManager.activateQuest(pCreatureObject, QuestManager.quests.FS_CRAFT_PUZZLE_QUEST_01)
end

function FsCrafting1Goto1:onLoggedIn(pCreatureObject)
	if (not self:hasTaskStarted(pCreatureObject)) then
		return 1
	end

	if (VillageJediManagerTownship:getCurrentPhase() ~= 1) then
		FsCrafting1:doPhaseChangeFail(pCreatureObject)
	end

	return 1
end

return FsCrafting1Goto1
