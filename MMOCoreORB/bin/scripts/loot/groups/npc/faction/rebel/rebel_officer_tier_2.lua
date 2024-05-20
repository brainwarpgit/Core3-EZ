--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

rebel_officer_tier_2 = {
	description = "",
	minimumLevel = 0,
	maximumLevel = -1,
	lootItems = {
		{groupTemplate = "armor_all", weight = 1000000},
		{groupTemplate = "armor_attachments", weight = 100000},
		{groupTemplate = "clothing_attachments", weight = 100000},
		{groupTemplate = "color_crystals", weight = 100000},
		{groupTemplate = "junk", weight = 5500000},
		{groupTemplate = "rebel_officer_common", weight = 400000},
		{groupTemplate = "weapons_all", weight = 900000},
		{groupTemplate = "wearables_all", weight = 800000},
		{groupTemplate = "resource_gemstone", weight = 200000},
		{groupTemplate = "resource_metal", weight = 200000},
		{groupTemplate = "resource_ore", weight = 200000},
		{groupTemplate = "resource_water", weight = 200000},
		{groupTemplate = "crafting_component", weight = 225000},
		{groupTemplate = "crafting_component_advanced", weight = 75000},
	}
}

addLootGroupTemplate("rebel_officer_tier_2", rebel_officer_tier_2)

--[[
mobiles:
	scripts/mobile/faction/rebel/fbase_rebel_army_captain_hard.lua	62
	scripts/mobile/faction/rebel/fbase_rebel_colonel_hard.lua	65
	scripts/mobile/faction/rebel/fbase_rebel_first_lieutenant_hard.lua	60
	scripts/mobile/faction/rebel/fbase_rebel_guard_captain.lua	45
]]--
