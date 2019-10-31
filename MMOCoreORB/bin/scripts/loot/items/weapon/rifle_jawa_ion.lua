rifle_jawa_ion = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_jawa_ion.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",47,96,0},
		{"maxdamage",100,188,0},
		{"attackspeed",9.1,6.3,1},
		{"woundchance",2.4,4.2,1},
		{"zerorangemod",-50,-50,0},
		{"midrangemod",-5,-5,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",40,40,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",23,14,0},
		{"attackactioncost",47,28,0},
		{"attackmindcost",61,37,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS+JUNKJAWA,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("rifle_jawa_ion", rifle_jawa_ion)
