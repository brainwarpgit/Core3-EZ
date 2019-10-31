rifle_cdef = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_cdef.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",12,27,0},
		{"maxdamage",29,61,0},
		{"attackspeed",5.1,3.6,1},
		{"woundchance",3,4.8,1},
		{"zerorangemod",20,20,0},
		{"midrangemod",50,50,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",35,35,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",14,9,0},
		{"attackactioncost",25,19,0},
		{"attackmindcost",14,9,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 20,
	junkMaxValue = 40

}

addLootItemTemplate("rifle_cdef", rifle_cdef)
