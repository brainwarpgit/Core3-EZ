bestine_rumor10 = Creature:new {
	objectName = "@mob/creature_names:commoner_bothan_female",
	customName = "Sola Nosconda",
	randomNameTag = true,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 3,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = INVULNERABLE,
	diet = CARNIVORE,
	templates = {"object/mobile/dressed_bestine_rumor10.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(bestine_rumor10, "bestine_rumor10")
