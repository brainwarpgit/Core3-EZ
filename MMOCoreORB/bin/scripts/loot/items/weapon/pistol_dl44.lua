--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

pistol_dl44 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_dl44.iff",
	craftingValues = {
		{"mindamage",11,24,0},
		{"maxdamage",63,127,0},
		{"attackspeed",5.3,3.4,0},
		{"woundchance",4.2,8.6,0},
		{"hitpoints",750,750,0},
		{"attackhealthcost",20,11,0},
		{"attackactioncost",46,25,0},
		{"attackmindcost",21,11,0},
		{"roundsused",10,40,0},
		{"zerorangemod",-10,-10,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",8,8,0},
		{"midrangemod",18,88,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 800,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("pistol_dl44", pistol_dl44)
