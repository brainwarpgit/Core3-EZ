rifle_spraystick = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_spraystick.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",6,12,0},
		{"maxdamage",73,138,0},
		{"attackspeed",3.6,2.4,1},
		{"woundchance",9,19,1},
		{"zerorangemod",-20,-20,0},
		{"midrangemod",0,0,0},
		{"maxrangemod",-60,-60,0},
		{"midrange",30,30,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",18,7,0},
		{"attackactioncost",52,28,0},
		{"attackmindcost",52,28,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("rifle_spraystick", rifle_spraystick)
