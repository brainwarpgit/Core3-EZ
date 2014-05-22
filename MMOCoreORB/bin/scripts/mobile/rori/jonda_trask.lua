jonda_trask = Creature:new {
  objectName = "",
  customName = "Jonda Trask",
  socialGroup = "",
  pvpFaction = "",
  faction = "",
  level = 100,
  chanceHit = 1,
  damageMin = 645,
  damageMax = 1000,
  baseXp = 9429,
  baseHAM = 24000,
  baseHAMmax = 30000,
  armor = 0,
  resists = {0,0,0,0,0,0,0,0,-1},
  meatType = "",
  meatAmount = 0,
  hideType = "",
  hideAmount = 0,
  boneType = "",
  boneAmount = 0,
  milk = 0,
  tamingChance = 0,
  ferocity = 0,
  pvpBitmask = NONE,
  creatureBitmask = NONE,
  optionsBitmask = 136,
  diet = HERBIVORE,

  templates = {
    "object/mobile/dressed_noble_bothan_female_01.iff",
    "object/mobile/dressed_noble_bothan_male_01.iff",
    "object/mobile/dressed_noble_fat_human_female_01.iff",
    "object/mobile/dressed_noble_fat_human_female_02.iff",
    "object/mobile/dressed_noble_fat_human_male_01.iff",
    "object/mobile/dressed_noble_fat_human_male_02.iff",
    "object/mobile/dressed_noble_fat_zabrak_male_01.iff",
    "object/mobile/dressed_noble_fat_zabrak_male_02.iff",
    "object/mobile/dressed_noble_human_female_01.iff",
    "object/mobile/dressed_noble_human_female_02.iff",
    "object/mobile/dressed_noble_human_female_03.iff",
    "object/mobile/dressed_noble_naboo_twilek_female_01.iff",
    "object/mobile/dressed_noble_naboo_twilek_female_02.iff"
  },
  lootGroups = {},
  weapons = {},
  conversationTemplate = "jaleela_bindoo_mission_target_convotemplate",
  attacks = {
  }
}

CreatureTemplates:addCreatureTemplate(jonda_trask, "jonda_trask")
