rifle_tusken = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_tusken.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",64,123,0},
		{"maxdamage",124,188,0},
		{"attackspeed",9.6,6.7,1},
		{"woundchance",5.4,11.7,1},
		{"zerorangemod",-60,-60,0},
		{"midrangemod",14,14,0},
		{"maxrangemod",-50,-50,0},
		{"midrange",60,60,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",17,9,0},
		{"attackactioncost",27,16,0},
		{"attackmindcost",61,36,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS + JUNKTUSKEN,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("rifle_tusken", rifle_tusken)
