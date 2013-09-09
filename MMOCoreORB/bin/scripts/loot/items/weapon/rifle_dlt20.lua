--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

rifle_dlt20 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_dlt20.iff",
	craftingValues = {
		{"mindamage",61,87,0},
		{"maxdamage",94,149,0},
		{"attackspeed",8.4,6.1,0},
		{"woundchance",4.3,11.2,0},
		{"hitpoints",750,750,0},
		{"attackhealthcost",22,14,0},
		{"attackactioncost",43,23,0},
		{"attackmindcost",47,21,0},
		{"roundsused",15,45,0},
		{"zerorangemod",-70,-70,0},
		{"maxrangemod",-50,-50,0},
		{"midrange",45,45,0},
		{"midrangemod",21,39,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 10,
	junkDealerTypeNeeded = JUNKWEAPONS,
	junkMinValue = 2,
	junkMaxValue = 22

}

addLootItemTemplate("rifle_dlt20", rifle_dlt20)
