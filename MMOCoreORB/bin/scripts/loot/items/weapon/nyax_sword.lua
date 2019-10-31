nyax_sword = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/melee/sword/sword_curved_nyax.iff",
	craftingValues = {
		{"hitpoints",750,750,0},
		{"mindamage",25,50,0},
		{"maxdamage",105,200,0},
		{"attackspeed",4.3,3,1},
		{"woundchance",15,29,1},
		{"zerorangemod",7,7,0},
		{"midrangemod",7,7,0},
		{"maxrangemod",7,7,0},
		{"midrange",3,3,0},
		{"maxrange",4,4,0},
		{"attackhealthcost",51,27,0},
		{"attackactioncost",39,21,0},
		{"attackmindcost",33,18,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 500,

	-- staticDotChance: The chance of this weapon object dropping with a static dot on it. Higher number means less chance. Set to 0 to always have a static dot.
	staticDotChance = 0,

	-- staticDotType: 1 = Poison, 2 = Disease, 3 = Fire, 4 = Bleed
	staticDotType = 1,

	-- staticDotValues: Object map that can randomly or statically generate a dot (used for weapon objects.)
	staticDotValues = {
		{"attribute", 0, 0}, -- See CreatureAttributes.h in src for numbers.
		{"strength", 110, 110},
		{"duration", 30, 240},
		{"potency", 1, 100},
		{"uses", 250, 9999}
	},
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 20,
	junkMaxValue = 60

}

addLootItemTemplate("nyax_sword", nyax_sword)
