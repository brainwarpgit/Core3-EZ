

weapon_scope_quest = {
	minimumLevel = 0,
	maximumLevel = 0,
	customObjectName = "",
	directObjectTemplate = "object/tangible/component/weapon/scope_weapon_advanced_quest.iff",
	craftingValues = {
		{"woundchance",20,20,1},
		{"midrangemod",25,25,0},
		{"attackhealthcost",25,25,0},
		{"attackactioncost",25,25,0},
		{"attackmindcost",20,20,0},
		{"useCount",2,10,0},
	},
	customizationStringNames = {},
	customizationValues = {}
}

addLootItemTemplate("weapon_scope_quest", weapon_scope_quest)