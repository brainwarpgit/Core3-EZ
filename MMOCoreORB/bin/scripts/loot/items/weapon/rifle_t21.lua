rifle_t21 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_t21.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",60,110,0},
		{"maxdamage",170,360,0},
		{"attackspeed",12.7,7.4,1},
		{"woundchance",11,25,1},
		{"zerorangemod",-90,-90,0},
		{"midrangemod",-32,-32,0},
		{"maxrangemod",0,0,0},
		{"midrange",60,60,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",62,31,0},
		{"attackactioncost",53,26,0},
		{"attackmindcost",115,57,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 30,
	junkMaxValue = 55

}

addLootItemTemplate("rifle_t21", rifle_t21)
