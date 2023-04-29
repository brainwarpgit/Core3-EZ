object_tangible_ship_components_booster_bst_corellian_advanced_thrust_enhancer = object_tangible_ship_components_booster_shared_bst_corellian_advanced_thrust_enhancer:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "bst_corellian_advanced_thrust_enhancer",

	attributes = {
		{"currentEnergy", 1331},
		{"maximumEnergy", 1331},
		{"rechargeRate", 33.28},
		{"consumptionRate", 133.1},
		{"acceleration", 26.62},
		{"maxSpeed", 20.51},
		{"currentHitpoints", 934.43},
		{"maximumHitpoints", 934.43},
		{"maximumArmorHitpoints", 467.215},
		{"currentArmorHitpoints", 467.215},
		{"efficiency", 1},
		{"energyMaintenance", 575},
		{"mass", 14352},
		{"reverseEngineeringLevel", 7},
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

ObjectTemplates:addTemplate(object_tangible_ship_components_booster_bst_corellian_advanced_thrust_enhancer, "object/tangible/ship/components/booster/bst_corellian_advanced_thrust_enhancer.iff")
