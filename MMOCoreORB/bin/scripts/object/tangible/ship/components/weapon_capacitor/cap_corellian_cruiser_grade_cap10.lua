object_tangible_ship_components_weapon_capacitor_cap_corellian_cruiser_grade_cap10 = object_tangible_ship_components_weapon_capacitor_shared_cap_corellian_cruiser_grade_cap10:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "cap_corellian_cruiser_grade_cap10",

	attributes = {
		{"currentEnergy", 732.05},
		{"maxEnergy", 732.05},
		{"rechargeRate", 29.28},
		{"currentHitpoints", 1100.38},
		{"maximumHitpoints", 1100.38},
		{"maximumArmorHitpoints", 550.19},
		{"currentArmorHitpoints", 550.19},
		{"efficiency", 1},
		{"energyMaintenance", 1200},
		{"mass", 46800},
		{"reverseEngineeringLevel", 9},
	},

	modifiers = {
		{"maxEnergy", 0.23},
		{"rechargeRate", 0.2},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.22},
		{"mass", 0.13},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_capacitor_cap_corellian_cruiser_grade_cap10, "object/tangible/ship/components/weapon_capacitor/cap_corellian_cruiser_grade_cap10.iff")
