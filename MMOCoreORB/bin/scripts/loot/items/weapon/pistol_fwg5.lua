pistol_fwg5 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_fwg5.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",11,21,0},
		{"maxdamage",58,112,0},
		{"attackspeed",5.3,3.8,1},
		{"woundchance",5,11,1},
		{"zerorangemod",0,0,0},
		{"midrangemod",14,14,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",20,20,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",17,8,0},
		{"attackactioncost",44,27,0},
		{"attackmindcost",25,14,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 625,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("pistol_fwg5", pistol_fwg5)
