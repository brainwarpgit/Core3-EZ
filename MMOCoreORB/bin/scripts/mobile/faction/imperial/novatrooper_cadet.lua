novatrooper_cadet = Creature:new {
	objectName = "@mob/creature_names:stormtrooper_novatrooper_cadet",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 72,
	chanceHit = 0.7,
	damageMin = 495,
	damageMax = 700,
	baseXp = 6931,
	baseHAM = 12000,
	baseHAMmax = 15000,
	armor = 1,
	resists = {40,35,80,30,30,20,30,45,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_stormtrooper_black_gold.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 7650000},
				{group = "rifles", chance = 550000},
				{group = "pistols", chance = 550000},
                {group = "melee_weapons", chance = 550000},
                {group = "carbines", chance = 550000},
				{group = "clothing_attachments", chance = 25000},
				{group = "armor_attachments", chance = 25000}
			},
			lootChance = 2800000
		}						
	},
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(novatrooper_cadet, "novatrooper_cadet")