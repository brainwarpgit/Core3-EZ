turon_idala = Creature:new {
	objectName = "@mob/creature_names:naboo_police",
	customName = "Turon Adala",
	socialGroup = "naboo_security_force",
	faction = "naboo_security_force",
	level = 16,
	chanceHit = 0.31,
	damageMin = 170,
	damageMax = 180,
	baseXp = 1102,
	baseHAM = 2900,
	baseHAMmax = 3500,
	armor = 0,
	resists = {15,15,15,15,15,15,15,-1,-1},
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
	creatureBitmask = PACK,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_naboo_police.iff",
		"object/mobile/dressed_royal_officer_human_male_01.iff"},
	conversationTemplate = "pooja_naberrie_mission_target_convotemplate",
  	weapons = {"rebel_weapons_medium"},
  	attacks = merge(marksmannovice,brawlernovice)
}

CreatureTemplates:addCreatureTemplate(turon_idala, "turon_idala")
