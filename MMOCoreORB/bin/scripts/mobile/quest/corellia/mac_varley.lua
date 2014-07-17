mac_varley = Creature:new {
	objectName = "@mob/creature_names:corsec_captain",
	socialGroup = "corsec",
	pvpFaction = "corsec",
	faction = "corsec",
	level = 22,
	chanceHit = 0.35,
	damageMin = 210,
	damageMax = 220,
	baseXp = 2219,
	baseHAM = 5900,
	baseHAMmax = 7200,
	armor = 0,
	resists = {10,10,10,10,10,10,10,-1,-1},
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

	templates = {"object/mobile/dressed_corsec_captain_human_male_01.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "denell_kel_vannon_mission_target_convotemplate",
	attacks = {}
}

CreatureTemplates:addCreatureTemplate(mac_varley, "mac_varley")