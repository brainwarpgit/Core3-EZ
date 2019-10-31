rifle_dlt20a = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_dlt20a.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",56,89,0},
		{"maxdamage",94,153,0},
		{"attackspeed",8.1,5.9,1},
		{"woundchance",4.8,11.3,1},
		{"zerorangemod",-50,-50,0},
		{"midrangemod",14,14,0},
		{"maxrangemod",-50,-50,0},
		{"midrange",45,45,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",26,13,0},
		{"attackactioncost",41,29,0},
		{"attackmindcost",36,23,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("rifle_dlt20a", rifle_dlt20a)
