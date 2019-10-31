polearm_staff_wood_reinforced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/polearm/lance_staff_wood_s2.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",41,52,0},
		{"maxdamage",86,111,0},
		{"attackspeed",5.8,4,1},
		{"woundchance",7,7,1},
		{"zerorangemod",7,7,0},
		{"midrangemod",7,7,0},
		{"maxrangemod",7,7,0},
		{"midrange",3,3,0},
		{"maxrange",5,5,0},
		{"attackhealthcost",20,14,0},
		{"attackactioncost",38,27,0},
		{"attackmindcost",15,11,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 500,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("polearm_staff_wood_reinforced", polearm_staff_wood_reinforced)
