object_tangible_ship_components_shield_generator_shd_incom_mark5 = object_tangible_ship_components_shield_generator_shared_shd_incom_mark5:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "shd_incom_mark5",

	attributes = {
		{"shieldRechargeRate", 1.52},
		{"shieldHitpointsMaximumFront", 200},
		{"shieldHitpointsMaximumBack", 200},
		{"currentHitpoints", 150},
		{"maximumHitpoints", 150},
		{"maximumArmorHitpoints", 75},
		{"currentArmorHitpoints", 75},
		{"efficiency", 1},
		{"energyMaintenance", 2556},
		{"mass", 1320},
		{"reverseEngineeringLevel", 1},
	},

	modifiers = {
		{"shieldRechargeRate", 0.26},
		{"shieldHitpointsMaximumFront", 0.341},
		{"shieldHitpointsMaximumBack", 0.341},
		{"maximumArmorHitpoints", 0.03},
		{"energyMaintenance", 0.3},
		{"mass", 0.2},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_shield_generator_shd_incom_mark5, "object/tangible/ship/components/shield_generator/shd_incom_mark5.iff")
