axe_vibroaxe = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/axe/axe_vibroaxe.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",53,98,0},
		{"maxdamage",123,228,0},
		{"attackspeed",6.5,4.5,1},
		{"woundchance",6,14,1},
		{"zerorangemod",-26,-26,0},
		{"maxrangemod",-26,-26,0},
		{"midrangemod",-26,-26,0},
		{"midrange",3,3,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",85,46,0},
		{"attackactioncost",52,28,0},
		{"attackmindcost",20,11,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 500,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("axe_vibroaxe", axe_vibroaxe)
