fbase_stormtrooper_extreme = Creature:new {
	objectName = "@mob/creature_names:fbase_stormtrooper_extreme",
	randomNameType = NAME_STORMTROOPER,
	socialGroup = "imperial",
	faction = "imperial",
	level = 140,
	chanceHit = 5.0,
	damageMin = 845,
	damageMax = 1400,
	baseXp = 14000,
	baseHAM = 64000,
	baseHAMmax = 90000,
	armor = 2,
	resists = {110,110,140,35,35,35,35,-1,-1},
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
	diet = HERBIVORE,
	scale = 1.05,

	templates = {"object/mobile/dressed_stormtrooper_m.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 3400000},
				{group = "rifles", chance = 1200000},
				{group = "pistols", chance = 1200000},
				{group = "melee_weapons", chance = 1200000},
				{group = "carbines", chance = 1200000},
				{group = "clothing_attachments", chance = 250000},
				{group = "armor_attachments", chance = 250000},
				{group = "stormtrooper_common", chance = 700000},
				{group = "wearables_common", chance = 500000}
			}
		}
	},
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/stormtrooper",
	personalityStf = "@hireling/hireling_stormtrooper",		
	attacks = merge(brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(fbase_stormtrooper_extreme, "fbase_stormtrooper_extreme")
