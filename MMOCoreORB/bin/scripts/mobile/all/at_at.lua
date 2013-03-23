at_at = Creature:new {
	objectName = "@mob/creature_names:at_at",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 228,
	chanceHit = 197.5,
	damageMin = 1270,
	damageMax = 2250,
	baseXp = 21728,
	baseHAM = 208000,
	baseHAMmax = 254000,
	armor = 3,
	resists = {90,90,10,90,90,90,90,100,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = NONE,

	templates = {"object/mobile/atat.iff"},
	lootGroups = {},
	defaultAttack = "defaultdroidattack",
	defaultWeapon = "object/weapon/ranged/vehicle/vehicle_atst_ranged.iff",
}

CreatureTemplates:addCreatureTemplate(at_at, "at_at")
