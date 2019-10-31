knife_survival = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/knife/knife_survival.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",14,26,0},
		{"maxdamage",28,52,0},
		{"attackspeed",4.2,2.9,1},
		{"woundchance",5,11,1},
		{"zerorangemod",21,21,0},
		{"midrangemod",21,21,0},
		{"maxrangemod",21,21,0},
		{"midrange",3,3,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",9,5,0},
		{"attackactioncost",29,15,0},
		{"attackmindcost",7,4,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 500,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 20,
	junkMaxValue = 40

}

addLootItemTemplate("knife_survival", knife_survival)
