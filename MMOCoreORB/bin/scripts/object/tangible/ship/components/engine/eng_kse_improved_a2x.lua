object_tangible_ship_components_engine_eng_kse_improved_a2x = object_tangible_ship_components_engine_shared_eng_kse_improved_a2x:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "eng_kse_improved_a2x",

	attributes = {
		{"maxSpeed", 52.5},
		{"maxPitch", 56.25},
		{"maxRoll", 56.25},
		{"maxYaw", 56.25},
		{"currentHitpoints", 187.5},
		{"maximumHitpoints", 187.5},
		{"maximumArmorHitpoints", 93.75},
		{"currentArmorHitpoints", 93.75},
		{"efficiency", 1},
		{"energyMaintenance", 1500},
		{"mass", 1575},
		{"reverseEngineeringLevel", 2},
	},

	modifiers = {
		{"maxSpeed", 0.1},
		{"maxPitch", 0.07},
		{"maxRoll", 0.07},
		{"maxYaw", 0.07},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.14},
		{"mass", 0.14},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_engine_eng_kse_improved_a2x, "object/tangible/ship/components/engine/eng_kse_improved_a2x.iff")
