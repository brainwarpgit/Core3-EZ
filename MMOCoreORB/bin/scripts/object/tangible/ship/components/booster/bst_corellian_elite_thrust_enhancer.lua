object_tangible_ship_components_booster_bst_corellian_elite_thrust_enhancer = object_tangible_ship_components_booster_shared_bst_corellian_elite_thrust_enhancer:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "bst_corellian_elite_thrust_enhancer",

	attributes = {
		{"currentEnergy", 1464.1},
		{"maximumEnergy", 1464.1},
		{"rechargeRate", 36.6},
		{"consumptionRate", 146.41},
		{"acceleration", 29.28},
		{"maxSpeed", 22.77},
		{"currentHitpoints", 1100.38},
		{"maximumHitpoints", 1100.38},
		{"maximumArmorHitpoints", 550.19},
		{"currentArmorHitpoints", 550.19},
		{"efficiency", 1},
		{"energyMaintenance", 600},
		{"mass", 37440},
		{"reverseEngineeringLevel", 9},
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

ObjectTemplates:addTemplate(object_tangible_ship_components_booster_bst_corellian_elite_thrust_enhancer, "object/tangible/ship/components/booster/bst_corellian_elite_thrust_enhancer.iff")
