--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

jagged_vibroblade = {
	minimumLevel = 0,
	maximumLevel = 0,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/knife/knife_vibroblade_quest.iff",
	craftingValues = {
		{"hitpoints",1000,1000,0},
		{"mindamage",15,15,0},
		{"maxdamage",90,90,0},
		{"attackspeed",3.2,3.2,1},
		{"woundchance",8,8,1},
		{"zerorangemod",5,5,0},
		{"midrangemod",5,5,0},
		{"maxrangemod",5,5,0},
		{"midrange",3,3,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",5,5,0},
		{"attackactioncost",15,15,0},
		{"attackmindcost",5,5,0},
	},
	skillMods = {
		{ "berserk", 5 }
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = -1,

	-- staticDotChance: The chance of this weapon object dropping with a static dot on it. Higher number means less chance. Set to 0 to always have a static dot.
	staticDotChance = 0,

	-- staticDotType: 1 = Poison, 2 = Disease, 3 = Fire, 4 = Bleed
	staticDotType = 4,

	-- staticDotValues: Object map that can randomly or statically generate a dot (used for weapon objects.)
	staticDotValues = {
		{"attribute", 0, 0}, -- See CreatureAttributes.h in src for numbers.
		{"strength", 75, 75},
		{"duration", 80, 80},
		{"potency", 60, 60},
		{"uses", 9999, 9999}
	}

}

addLootItemTemplate("jagged_vibroblade", jagged_vibroblade)
