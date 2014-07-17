slooni_slave = Creature:new {
	objectName = "@mob/creature_names:slave_twilek_female",
	generateRandomName = true,
	socialGroup = "townsperson",
	pvpFaction = "townsperson",
	faction = "townsperson",
	level = 7,
	chanceHit = 0.26,
	damageMin = 55,
	damageMax = 65,
	baseXp = 147,
	baseHAM = 270,
	baseHAMmax = 330,
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
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {"object/mobile/twilek_female.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "slooni_jong_mission_target_convotemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(slooni_slave, "slooni_slave")