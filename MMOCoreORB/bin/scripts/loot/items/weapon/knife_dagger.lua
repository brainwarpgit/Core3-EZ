knife_dagger = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/knife/knife_dagger.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",11,26,0},
		{"maxdamage",14,26,0},
		{"attackspeed",3.9,2.7,1},
		{"woundchance",6,12,1},
		{"zerorangemod",17,17,0},
		{"midrangemod",17,17,0},
		{"maxrangemod",17,17,0},
		{"midrange",3,3,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",8,4,0},
		{"attackactioncost",38,20,0},
		{"attackmindcost",8,4,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 500,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 20,
	junkMaxValue = 60

}

addLootItemTemplate("knife_dagger", knife_dagger)
