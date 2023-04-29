object_tangible_ship_components_reactor_rct_z95_basic_b = object_tangible_ship_components_reactor_rct_z95_basic:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "",

	attributes = {
		{"energyGeneration", 10000},
		{"currentHitpoints", 135},
		{"maximumHitpoints", 135},
		{"maximumArmorHitpoints", 67.5},
		{"currentArmorHitpoints", 67.5},
		{"efficiency", 1},
		{"energyMaintenance", 0},
		{"mass", 1320},
		{"reverseEngineeringLevel", 1},
	},

	modifiers = {
		{"energyGeneration", 0.2},
		{"maximumArmorHitpoints", 0.07},
		{"energyMaintenance", 0},
		{"mass", 0.3},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_reactor_rct_z95_basic_b, "object/tangible/ship/components/reactor/rct_z95_basic_b.iff")
