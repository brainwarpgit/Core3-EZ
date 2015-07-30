bases_oppressor-9_class_dark_trooper = Creature:new {
	objectName = "@mob/creature_names:an_oppressor-9_class_dark_trooper",
	randomNameType = NAME_DARKTROOPER,
	socialGroup = "imperial",
	faction = "imperial",
	level = 235,
	chanceHit = 0.4,
	damageMin = 805,
	damageMax = 1320,
	baseXp = 8465,
	baseHAM = 252000,
	baseHAMmax = 290000,
	armor = 3,
	resists = {40,25,25,50,50,50,50,25,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + OVERT,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 1.5,

	templates = {"object/mobile/dark_trooper.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 300000},
				{group = "junk", chance = 6300000},
				{group = "rifles", chance = 600000},
				{group = "holocron_dark", chance = 150000},
				{group = "holocron_light", chance = 150000},
				{group = "carbines", chance = 600000},
				{group = "pistols", chance = 600000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000},
				{group = "wearables_common", chance = 1000000}
			}
		}
	},
	weapons = {"dark_trooper_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	personalityStf = "@hireling/hireling_stormtrooper",	
	attacks = merge(riflemanmaster,marksmanmaster,fencermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(bases_oppressor-9_class_dark_trooper, "bases_oppressor-9_class_dark_trooper")
