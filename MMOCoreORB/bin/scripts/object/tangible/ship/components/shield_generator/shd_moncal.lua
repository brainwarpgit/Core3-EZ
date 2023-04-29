object_tangible_ship_components_shield_generator_shd_moncal = object_tangible_ship_components_shield_generator_shared_shd_moncal:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "shd_moncal",

	attributes = {
		{"shieldRechargeRate", 4.37},
		{"shieldHitpointsMaximumFront", 575},
		{"shieldHitpointsMaximumBack", 575},
		{"currentHitpoints", 431.25},
		{"maximumHitpoints", 431.25},
		{"maximumArmorHitpoints", 215.625},
		{"currentArmorHitpoints", 215.625},
		{"efficiency", 1},
		{"energyMaintenance", 2681},
		{"mass", 6256.25},
		{"reverseEngineeringLevel", 4},
	},

	modifiers = {
		{"shieldRechargeRate", 0.28},
		{"shieldHitpointsMaximumFront", 0.341},
		{"shieldHitpointsMaximumBack", 0.341},
		{"maximumArmorHitpoints", 0.03},
		{"energyMaintenance", 0.3},
		{"mass", 0.2},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_shield_generator_shd_moncal, "object/tangible/ship/components/shield_generator/shd_moncal.iff")
