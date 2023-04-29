object_tangible_ship_components_droid_interface_ddi_sds_imperial_3 = object_tangible_ship_components_droid_interface_shared_ddi_sds_imperial_3:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "ddi_sds_imperial_3",

	attributes = {
		{"commandSpeed", 16.5},
		{"currentHitpoints", 934.43},
		{"maximumHitpoints", 934.43},
		{"maximumArmorHitpointsMod", 0.05},
		{"maximumArmorHitpoints", 467.215},
		{"currentArmorHitpoints", 467.215},
		{"efficiency", 1},
		{"energyMaintenance", 500},
		{"mass", 7800},
		{"reverseEngineeringLevel", 7},
	},

	modifiers = {
		{"commandSpeed", 0.05},
		{"energyMaintenance", 0.05},
		{"mass", 0.05},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_droid_interface_ddi_sds_imperial_3, "object/tangible/ship/components/droid_interface/ddi_sds_imperial_3.iff")
