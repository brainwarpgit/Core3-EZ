--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

bh_armor_helmet = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/wearables/armor/bounty_hunter/armor_bounty_hunter_helmet.iff",
	craftingValues = {
		{"armor_rating",1,1,0},
		{"armor_special_type",0,0,0},
		{"armor_effectiveness",10,50,0},
		{"armor_integrity",20000,70000,0},
		{"armor_health_encumbrance",25,15,0},
		{"armor_action_encumbrance",22,13,0},
		{"armor_mind_encumbrance",300,180,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	junkDealerTypeNeeded = JUNKGENERIC,
	junkMinValue = 55,
	junkMaxValue = 110
}

addLootItemTemplate("bh_armor_helmet", bh_armor_helmet)
