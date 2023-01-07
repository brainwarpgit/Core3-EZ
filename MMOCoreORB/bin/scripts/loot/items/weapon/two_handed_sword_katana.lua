--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

two_handed_sword_katana = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/2h_sword/2h_sword_katana.iff",
	craftingValues = {
		{"mindamage",11,20,0},
		{"maxdamage",112,208,0},
		{"attackspeed",4.6,3.1,1},
		{"woundchance",15,27,1},
		{"hitpoints",750,1500,0},
		{"zerorange",0,0,0},
		{"zerorangemod",-6,-6,0},
		{"midrange",5,5,0},
		{"midrangemod",-6,-6,0},
		{"maxrange",5,5,0},
		{"maxrangemod",-6,-6,0},
		{"attackhealthcost",27,15,0},
		{"attackactioncost",65,35,0},
		{"attackmindcost",33,18,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 750,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("two_handed_sword_katana", two_handed_sword_katana)