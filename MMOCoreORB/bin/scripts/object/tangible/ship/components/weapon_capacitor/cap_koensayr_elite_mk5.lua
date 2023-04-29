object_tangible_ship_components_weapon_capacitor_cap_koensayr_elite_mk5 = object_tangible_ship_components_weapon_capacitor_shared_cap_koensayr_elite_mk5:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "cap_koensayr_elite_mk5",

	attributes = {
		{"currentEnergy", 1043.17},
		{"maxEnergy", 1043.17},
		{"rechargeRate", 46.116},
		{"currentHitpoints", 1650.57},
		{"maximumHitpoints", 1650.57},
		{"maximumArmorHitpoints", 825.285},
		{"currentArmorHitpoints", 825.285},
		{"efficiency", 1},
		{"energyMaintenance", 1250},
		{"mass", 56400},
		{"reverseEngineeringLevel", 10},
	},

	modifiers = {
		{"maxEnergy", 0.23},
		{"rechargeRate", 0.2},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.22},
		{"mass", 0.13},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_capacitor_cap_koensayr_elite_mk5, "object/tangible/ship/components/weapon_capacitor/cap_koensayr_elite_mk5.iff")
