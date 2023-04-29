object_tangible_ship_components_booster_bst_kse_elite_als_1 = object_tangible_ship_components_booster_shared_bst_kse_elite_als_1:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "bst_kse_elite_als_1",

	attributes = {
		{"currentEnergy", 2196.15},
		{"maximumEnergy", 2196.15},
		{"rechargeRate", 54.9},
		{"consumptionRate", 219.615},
		{"acceleration", 43.92},
		{"maxSpeed", 34.155},
		{"currentHitpoints", 1650.57},
		{"maximumHitpoints", 1650.57},
		{"maximumArmorHitpoints", 825.285},
		{"currentArmorHitpoints", 825.285},
		{"efficiency", 1},
		{"energyMaintenance", 600},
		{"mass", 45120},
		{"reverseEngineeringLevel", 10},
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

ObjectTemplates:addTemplate(object_tangible_ship_components_booster_bst_kse_elite_als_1, "object/tangible/ship/components/booster/bst_kse_elite_als_1.iff")
