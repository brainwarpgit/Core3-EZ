object_tangible_ship_components_armor_arm_corellian_supreme_durasteel = object_tangible_ship_components_armor_shared_arm_corellian_supreme_durasteel:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "arm_corellian_supreme_durasteel",

	attributes = {
		{"currentHitpoints", 1283.28},
		{"maximumHitpoints", 1283.28},
		{"maximumArmorHitpoints", 1283.28},
		{"currentArmorHitpoints", 1283.28},
		{"efficiency", 1},
		{"energyMaintenance", 0},
		{"mass", 19189.2},
		{"reverseEngineeringLevel", 8},
	},

	modifiers = {
		{"maximumArmorHitpoints", 0.38},
		{"energyMaintenance", 0},
		{"mass", 0.4},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_armor_arm_corellian_supreme_durasteel, "object/tangible/ship/components/armor/arm_corellian_supreme_durasteel.iff")
