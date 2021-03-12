pirate_privateer = Creature:new {
  objectName = "@mob/creature_names:pirate",
  randomNameType = NAME_GENERIC,
  randomNameTag = true,
  customName = "a Privateer Pirate",
  socialGroup = "pirate",
  faction = "",
  level = 10,
  chanceHit = 0.28,
  damageMin = 90,
  damageMax = 110,
  baseXp = 430,
  baseHAM = 810,
  baseHAMmax = 990,
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
  creatureBitmask = PACK + KILLER,
  optionsBitmask = AIENABLED,
  diet = HERBIVORE,

  templates = {
    "object/mobile/dressed_criminal_pirate_human_male_01.iff",
    "object/mobile/dressed_criminal_pirate_human_female_01.iff",
    "thug"
  },
  lootGroups = {
    {
      groups = {
        {group = "junk", chance = 4000000},
        {group = "wearables_common", chance = 2000000},
        {group = "rifles", chance = 1000000},
        {group = "pistols", chance = 1000000},
        {group = "melee_weapons", chance = 1000000},
        {group = "carbines", chance = 1000000},
      }
    }
  },
  weapons = {"ranged_weapons"},
  conversationTemplate = "",
  reactionStf = "@npc_reaction/slang",
  attacks = merge(marksmannovice,brawlernovice)
}

CreatureTemplates:addCreatureTemplate(pirate_privateer, "pirate_privateer")
