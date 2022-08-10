--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

polearm_vibro_axe = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/polearm/polearm_vibro_axe.iff",
	craftingValues = {
		{"mindamage",49,91,0},
		{"maxdamage",196,364,0},
		{"attackspeed",6.5,4.5,1},
		{"woundchance",23,43,1},
		{"hitpoints",750,1500,0},
		{"zerorange",0,0,0},
		{"zerorangemod",-45,-45,0},
		{"midrange",7,7,0},
		{"midrangemod",-45,-45,0},
		{"maxrange",7,7,0},
		{"maxrangemod",-45,-45,0},
		{"attackhealthcost",78,45,0},
		{"attackactioncost",65,35,0},
		{"attackmindcost",29,15,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 500,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("polearm_vibro_axe", polearm_vibro_axe)
