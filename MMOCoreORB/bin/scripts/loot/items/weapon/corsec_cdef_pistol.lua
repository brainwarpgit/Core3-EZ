--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

corsec_cdef_pistol = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_cdef_corsec.iff",
	craftingValues = {
		{"mindamage",15,30,0},
		{"maxdamage",32,61,0},
		{"attackspeed",5.6,3.8,1},
		{"woundchance",2,4,0},
		{"hitpoints",750,750,0},
		{"attackhealthcost",17,11,0},
		{"attackactioncost",28,19,0},
		{"attackmindcost",15,10,0},
		{"roundsused",5,20,0},
		{"zerorangemod",0,0,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",15,15,0},
		{"midrangemod",35,65,0},	
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 10,
	junkDealerTypeNeeded = JUNKWEAPONS,
	junkMinValue = 2,
	junkMaxValue = 22

}

addLootItemTemplate("corsec_cdef_pistol", corsec_cdef_pistol)
