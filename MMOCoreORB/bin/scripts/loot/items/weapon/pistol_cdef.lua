pistol_cdef = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_cdef.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",15,30,0},
		{"maxdamage",32,61,0},
		{"attackspeed",5.6,3.8,1},
		{"woundchance",2,4,1},
		{"zerorangemod",20,20,0},
		{"midrangemod",35,35,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",15,15,0},
		{"maxrange",64,64,0},
		{"attackhealthcost",17,11,0},
		{"attackactioncost",28,19,0},
		{"attackmindcost",15,10,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 625,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 20,
	junkMaxValue = 40

}

addLootItemTemplate("pistol_cdef", pistol_cdef)
