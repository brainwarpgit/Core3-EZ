object_tangible_ship_components_weapon_wpn_corellian_ag1g_laser = object_tangible_ship_components_weapon_shared_wpn_corellian_ag1g_laser:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "wpn_corellian_ag1g_laser",

	attributes = {
		{"minDamage", 1790.8},
		{"maxDamage", 2769},
		{"shieldEffectiveness", 0.625},
		{"armorEffectiveness", 0.625},
		{"energyPerShot", 33.945},
		{"refireRate", 0.425},
		{"currentHitpoints", 1168.04},
		{"maximumHitpoints", 1168.04},
		{"maximumArmorHitpoints", 584.018},
		{"currentArmorHitpoints", 584.018},
		{"efficiency", 1},
		{"energyMaintenance", 2100},
		{"mass", 31395},
		{"reverseEngineeringLevel", 8},
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

ObjectTemplates:addTemplate(object_tangible_ship_components_weapon_wpn_corellian_ag1g_laser, "object/tangible/ship/components/weapon/wpn_corellian_ag1g_laser.iff")
