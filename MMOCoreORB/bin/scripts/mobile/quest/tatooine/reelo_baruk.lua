reelo_baruk = Creature:new {
	objectName = "@theme_park_name:reelo_baruk",
	socialGroup = "jabba",
	faction = "jabba",
	level = 20,
	chanceHit = 0.330000,
	damageMin = 190,
	damageMax = 200,
	baseXp = 1609,
	baseHAM = 5000,
	baseHAMmax = 6100,
	armor = 0,
	resists = {0,0,40,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,

	templates = {"object/mobile/reelo_baruk.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "theme_park_jabba_mission_giver_convotemplate",
	outfit = "reelo_baruk_outfit",
	attacks = {},
	optionsBitmask = INVULNERABLE + CONVERSABLE
}

CreatureTemplates:addCreatureTemplate(reelo_baruk, "reelo_baruk")
