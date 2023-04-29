object_tangible_ship_components_booster_bst_rss_special = object_tangible_ship_components_booster_shared_bst_rss_special:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "bst_rss_special",

	attributes = {
		{"currentEnergy", 1650},
		{"maximumEnergy", 1650},
		{"rechargeRate", 41.25},
		{"consumptionRate", 165},
		{"acceleration", 33},
		{"maxSpeed", 24.975},
		{"currentHitpoints", 517.5},
		{"maximumHitpoints", 517.5},
		{"maximumArmorHitpoints", 258.75},
		{"currentArmorHitpoints", 258.75},
		{"efficiency", 1},
		{"energyMaintenance", 525},
		{"mass", 3675},
		{"reverseEngineeringLevel", 4},
	},

	modifiers = {
		{"maximumEnergy", 0.1},
		{"rechargeRate", 0.1},
		{"consumptionRate", 0.1},
		{"acceleration", 0.04},
		{"maxSpeed", 0.03},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.15},
		{"mass", 0.15},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_booster_bst_rss_special, "object/tangible/ship/components/booster/bst_rss_special.iff")
