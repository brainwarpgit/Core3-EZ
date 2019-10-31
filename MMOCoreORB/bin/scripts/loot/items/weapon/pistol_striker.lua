pistol_striker = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_striker.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",23,41,0},
		{"maxdamage",44,73,0},
		{"attackspeed",4.9,3.5,1},
		{"woundchance",4,11,1},
		{"zerorangemod",0,0,0},
		{"midrangemod",7,7,0},
		{"maxrangemod",-70,-70,0},
		{"midrange",20,20,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",18,11,0},
		{"attackactioncost",39,23,0},
		{"attackmindcost",26,17,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 625,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("pistol_striker", pistol_striker)
