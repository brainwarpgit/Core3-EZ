object_tangible_ship_components_weapon_wpn_slayn_light_ioncannon = object_tangible_ship_components_weapon_shared_wpn_slayn_light_ioncannon:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "wpn_slayn_light_ioncannon",

	attributes = {
		{"minDamage", 290},
		{"maxDamage", 390},
		{"shieldEffectiveness", 0.7},
		{"armorEffectiveness", 0.3},
		{"energyPerShot", 20.4},
		{"refireRate", 0.34},
		{"currentHitpoints", 150},
		{"maximumHitpoints", 150},
		{"maximumArmorHitpoints", 75},
		{"currentArmorHitpoints", 75},
		{"efficiency", 1},
		{"energyMaintenance", 2000},
		{"mass", 1000},
		{"reverseEngineeringLevel", 1},
	},

	modifiers = {
		{"minDamage", 0.12},
		{"maxDamage", 0.12},
		{"shieldEffectiveness", 0.05},
		{"armorEffectiveness", 0.05},
		{"energyPerShot", 0.17},
		{"refireRate", 0.05},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.17},
		{"mass", 0.17},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_wpn_slayn_light_ioncannon, "object/tangible/ship/components/weapon/wpn_slayn_light_ioncannon.iff")
