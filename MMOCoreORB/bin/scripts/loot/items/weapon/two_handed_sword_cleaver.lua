two_handed_sword_cleaver = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/2h_sword/2h_sword_cleaver.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",35,65,0},
		{"maxdamage",105,195,0},
		{"attackspeed",5.3,3.7,1},
		{"woundchance",19,35,1},
		{"zerorangemod",-19,-19,0},
		{"midrangemod",-19,-19,0},
		{"maxrangemod",-19,-19,0},
		{"midrange",5,5,0},
		{"maxrange",5,5,0},
		{"attackhealthcost",49,27,0},
		{"attackactioncost",46,25,0},
		{"attackmindcost",26,14,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("two_handed_sword_cleaver", two_handed_sword_cleaver)
