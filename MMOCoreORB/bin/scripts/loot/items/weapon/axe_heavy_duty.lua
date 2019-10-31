axe_heavy_duty = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/axe/axe_heavy_duty.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",25,46,0},
		{"maxdamage",98,182,0},
		{"attackspeed",6.5,4.5,1},
		{"woundchance",11,20,1},
		{"zerorangemod",0,0,0},
		{"midrangemod",0,0,0},
		{"maxrangemod",0,0,0},
		{"midrange",3,3,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",78,42,0},
		{"attackactioncost",40,22,0},
		{"attackmindcost",13,7,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45 

}

addLootItemTemplate("axe_heavy_duty", axe_heavy_duty)
