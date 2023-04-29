object_tangible_ship_components_armor_arm_corellian_standard_durasteel = object_tangible_ship_components_armor_shared_arm_corellian_standard_durasteel:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "arm_corellian_standard_durasteel",

	attributes = {
		{"currentHitpoints", 473.8},
		{"maximumHitpoints", 473.8},
		{"maximumArmorHitpoints", 473.8},
		{"currentArmorHitpoints", 473.8},
		{"efficiency", 1},
		{"energyMaintenance", 0},
		{"mass", 3783.94},
		{"reverseEngineeringLevel", 4},
	},

	modifiers = {
		{"maximumArmorHitpoints", 0.38},
		{"energyMaintenance", 0},
		{"mass", 0.318},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_armor_arm_corellian_standard_durasteel, "object/tangible/ship/components/armor/arm_corellian_standard_durasteel.iff")
