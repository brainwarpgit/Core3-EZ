object_tangible_ship_components_weapon_capacitor_cap_qualdex_miser_elite = object_tangible_ship_components_weapon_capacitor_shared_cap_qualdex_miser_elite:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "cap_qualdex_miser_elite",

	attributes = {
		{"currentEnergy", 467.5},
		{"maxEnergy", 467.5},
		{"rechargeRate", 18.7},
		{"currentHitpoints", 327.75},
		{"maximumHitpoints", 327.75},
		{"maximumArmorHitpoints", 163.875},
		{"currentArmorHitpoints", 163.875},
		{"efficiency", 1},
		{"energyMaintenance", 1000},
		{"mass", 2500},
		{"reverseEngineeringLevel", 3},
	},

	modifiers = {
		{"maxEnergy", 0.23},
		{"rechargeRate", 0.2},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.22},
		{"mass", 0.13},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_capacitor_cap_qualdex_miser_elite, "object/tangible/ship/components/weapon_capacitor/cap_qualdex_miser_elite.iff")
