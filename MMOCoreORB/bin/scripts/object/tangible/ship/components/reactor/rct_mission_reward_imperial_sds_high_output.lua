object_tangible_ship_components_reactor_rct_mission_reward_imperial_sds_high_output = object_tangible_ship_components_reactor_shared_rct_mission_reward_imperial_sds_high_output:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "rct_mission_reward_imperial_sds_high_output",

	attributes = {
		{"energyGeneration", 19000},
		{"currentHitpoints", 1237.86},
		{"maximumHitpoints", 1237.86},
		{"maximumArmorHitpoints", 618.93},
		{"currentArmorHitpoints", 618.93},
		{"efficiency", 1},
		{"energyMaintenance", 0},
		{"mass", 14421},
		{"reverseEngineeringLevel", 6},
	},

	modifiers = {
		{"energyGeneration", 0.0001},
		{"maximumArmorHitpoints", 0.0001},
		{"energyMaintenance", 0},
		{"mass", 0.0001},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_reactor_rct_mission_reward_imperial_sds_high_output, "object/tangible/ship/components/reactor/rct_mission_reward_imperial_sds_high_output.iff")
