object_tangible_ship_components_weapon_capacitor_cap_freitek_xd2 = object_tangible_ship_components_weapon_capacitor_shared_cap_freitek_xd2:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "cap_freitek_xd2",

	attributes = {
		{"currentEnergy", 495},
		{"maxEnergy", 495},
		{"rechargeRate", 19.8},
		{"currentHitpoints", 345},
		{"maximumHitpoints", 345},
		{"maximumArmorHitpoints", 172.5},
		{"currentArmorHitpoints", 172.5},
		{"efficiency", 1},
		{"energyMaintenance", 1050},
		{"mass", 2125},
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

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_capacitor_cap_freitek_xd2, "object/tangible/ship/components/weapon_capacitor/cap_freitek_xd2.iff")
