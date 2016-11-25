--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor. 

rifle_spraystick = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/rifle/rifle_spraystick.iff",
	craftingValues = {
		{"mindamage",6,12,0},
		{"maxdamage",73,138,0},
		{"attackspeed",3.6,2.4,0},
		{"woundchance",9,19,0},
		{"hitpoints",750,750,0},
		{"attackhealthcost",18,7,0},
		{"attackactioncost",52,28,0},
		{"attackmindcost",52,28,0},
		{"roundsused",5,20,0},
		{"zerorangemod",-20,-20,0},
		{"maxrangemod",-60,-60,0},
		{"midrange",30,30,0},
		{"midrangemod",-5,5,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 1000,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("rifle_spraystick", rifle_spraystick)
