rifle_lightning = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_lightning.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",27,410,0},
		{"maxdamage",296,730,0},
		{"attackspeed",6.3,4.7,1},
		{"woundchance",8.0,16.0,1},
		{"zerorangemod",-25,-25,0},
		{"midrangemod",-33,-33,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",30,30,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",43,28,0},
		{"attackactioncost",62,38,0},
		{"attackmindcost",36,24,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 20,
	junkMaxValue = 60

}

addLootItemTemplate("rifle_lightning", rifle_lightning)
