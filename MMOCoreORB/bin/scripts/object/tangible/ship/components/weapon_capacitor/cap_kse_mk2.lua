object_tangible_ship_components_weapon_capacitor_cap_kse_mk2 = object_tangible_ship_components_weapon_capacitor_shared_cap_kse_mk2:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "cap_kse_mk2",

	attributes = {
		{"currentEnergy", 660},
		{"maxEnergy", 660},
		{"rechargeRate", 22},
		{"currentHitpoints", 345},
		{"maximumHitpoints", 345},
		{"maximumArmorHitpoints", 172.5},
		{"currentArmorHitpoints", 172.5},
		{"efficiency", 1},
		{"energyMaintenance", 1250},
		{"mass", 2625},
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

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_capacitor_cap_kse_mk2, "object/tangible/ship/components/weapon_capacitor/cap_kse_mk2.iff")
