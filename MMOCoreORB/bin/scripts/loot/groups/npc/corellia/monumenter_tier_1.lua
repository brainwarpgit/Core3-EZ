--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

monumenter_tier_1 = {
	description = "",
	minimumLevel = 0,
	maximumLevel = -1,
	lootItems = {
		{groupTemplate = "junk", weight = 3600000},
		{groupTemplate = "melee_weapons", weight = 850000},
		{groupTemplate = "ranged_weapons", weight = 2600000},
		{groupTemplate = "wearables_common", weight = 1700000},
		{groupTemplate = "resource_gemstone", weight = 250000},
		{groupTemplate = "resource_metal", weight = 250000},
		{groupTemplate = "resource_ore", weight = 250000},
		{groupTemplate = "resource_water", weight = 250000},
		{groupTemplate = "crafting_component", weight = 250000},
	}
}

addLootGroupTemplate("monumenter_tier_1", monumenter_tier_1)

--[[
mobiles:
	scripts/mobile/corellia/monumenter_bandit.lua	11
	scripts/mobile/corellia/monumenter_marauder.lua	13
	scripts/mobile/corellia/monumenter_smuggler.lua	12
]]--
