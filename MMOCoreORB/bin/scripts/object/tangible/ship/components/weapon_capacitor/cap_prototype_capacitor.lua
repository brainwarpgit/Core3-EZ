object_tangible_ship_components_weapon_capacitor_cap_prototype_capacitor = object_tangible_ship_components_weapon_capacitor_shared_cap_prototype_capacitor:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "cap_z95_basic",

	attributes = {
		{"currentEnergy", 500},
		{"maxEnergy", 500},
		{"rechargeRate", 20},
		{"currentHitpoints", 150},
		{"maximumHitpoints", 150},
		{"maximumArmorHitpoints", 75},
		{"currentArmorHitpoints", 75},
		{"efficiency", 1},
		{"energyMaintenance", 1000},
		{"mass", 1000},
		{"reverseEngineeringLevel", 1},
	},

	modifiers = {
		{"maxEnergy", 0.23},
		{"rechargeRate", 0.2},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.22},
		{"mass", 0.13},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_capacitor_cap_prototype_capacitor, "object/tangible/ship/components/weapon_capacitor/cap_prototype_capacitor.iff")
