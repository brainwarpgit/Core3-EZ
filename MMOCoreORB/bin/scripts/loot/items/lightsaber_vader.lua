--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

lightsaber_vader = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Darth Vader's Lightsaber",
	directObjectTemplate = "object/weapon/melee/sword/sword_lightsaber_vader.iff",
	craftingValues = {
		{"hitpoints",1000,1000,0},
		{"mindamage",500,1000,0},
		{"maxdamage",1000,2000,0},
		{"attackspeed",5,2,1},
		{"woundchance",4,5,1},
		{"zerorangemod",20,20,0},
		{"midrangemod",15,15,0},
		{"maxrangemod",5,5,0},
		{"midrange",3,3,0},
		{"maxrange",5,5,0},
		{"forcecost",99,66,0},
		{"attackhealthcost",50,20,0},
		{"attackactioncost",50,20,0},
		{"attackmindcost",50,20,0},
	},
	customizationStringNames = {},
	customizationValues = {},
	
	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 30,
	junkMaxValue = 55
}

addLootItemTemplate("lightsaber_vader", lightsaber_vader)