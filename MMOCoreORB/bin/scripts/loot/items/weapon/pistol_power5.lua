pistol_power5 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_power5.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",15,29,0},
		{"maxdamage",67,154,0},
		{"attackspeed",5.2,3.4,1},
		{"woundchance",6.2,12.4,1},
		{"zerorangemod",0,0,0},
		{"midrangemod",3,3,0},
		{"maxrangemod",-70,-70,0},
		{"midrange",10,10,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",23,11,0},
		{"attackactioncost",53,26,0},
		{"attackmindcost",21,12,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 625,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("pistol_power5", pistol_power5)
