--frequency of sanity check in seconds
gcwCheckTimer = 3600

--Amount of time in seconds that a base will be vulnerable
vulnerabilityDuration = 10800

-- Amount of time in seconds between base vulnerabilities.
vulnerabilityFrequency = 172800

powerSwitchCount = 7

-- amount of time before waiting to reset vulnerability
resetTimer = 1209600

-- amount of time in seconds to wait when a slice fails
sliceCooldown = 120

dnaNucleotides = { "A", "G", "C", "T" }
dnaPairs = { "AT", "TA", "GC", "CG" }

totalDNASamples = 44

dnaStrandLength = 23

-- Amount of time in seconds that a base destruction takes after the countdown is initiated
destructionTimer = 600

-- maximum bases per planet
maxBases = 25

-- time in seconds that a player must be overt before aborting a facility shutdown
overtCooldown = 300

-- time in seconds to wait before reactivating the overload after the shutdown is aborted
reactivationTimer = 300

-- time that a player can maintain control of a turret before another player can take it
--(removed)turretInactivityTimer = 15

-- amount of time in seconds that a turret must wait after the last manual turret activity
-- X seconds after the last manual activity the turret will be able to auto fire
turretAutoFireTimeout = 20

maxBasesPerPlayer = 3

-- xp bonus for faction controlling a planet
bonusXP = 15

-- thresholds for scaling crackdown npc's difficulty, first threshold should always be 0.
difficutlyScalingThresholds = {0, 64}

-- discount percentage for side losing&winning the gcw.  negative value of increase in price (penality).  positive for a decrease (Bonus)

winnerBonus = 0
loserBonus = -30

-- Spawn turrets and minefields when base is placed 1=true 0=false
spawnDefenses = 1

-- Amount of time to delay vulnerability in seconds afer placing base
initialVulnerabilityDelay = 0

racialPenaltyEnabled = 1

-- assign points to each type of base
-- s01=Forward Outpost, s02 = Field Hospital , s03 = Tactical Center, s04 = Detach HQ
HQValues = {
	{"object/building/faction_perk/hq/hq_s01_imp_pvp.iff", 2},
	{"object/building/faction_perk/hq/hq_s01_imp.iff", 1},
	{"object/building/faction_perk/hq/hq_s02_imp_pvp.iff", 6},
	{"object/building/faction_perk/hq/hq_s02_imp.iff" , 3},
	{"object/building/faction_perk/hq/hq_s03_imp_pvp.iff" , 8},
	{"object/building/faction_perk/hq/hq_s03_imp.iff", 4},
	{"object/building/faction_perk/hq/hq_s04_imp_pvp.iff", 20},
	{"object/building/faction_perk/hq/hq_s04_imp.iff", 10},
	{"object/building/faction_perk/hq/hq_s01_rebel_pvp.iff", 2},
	{"object/building/faction_perk/hq/hq_s01_rebel.iff", 1},
	{"object/building/faction_perk/hq/hq_s02_rebel_pvp.iff", 6},
	{"object/building/faction_perk/hq/hq_s02_rebel.iff" , 3},
	{"object/building/faction_perk/hq/hq_s03_rebel_pvp.iff" , 8},
	{"object/building/faction_perk/hq/hq_s03_rebel.iff", 4},
	{"object/building/faction_perk/hq/hq_s04_rebel_pvp.iff", 20},
	{"object/building/faction_perk/hq/hq_s04_rebel.iff", 10},
	{"object/building/general/rori_hyperdrive_research_facility.iff", 2},
	{"object/building/general/bunker_imperial_weapons_research_facility_01.iff", 2},
	{"object/building/general/bunker_imperial_detainment_center_01.iff", 2},
	{"object/building/general/bunker_rebel_weapons_depot.iff", 2},

}

-- race (raceid, penalty_multiplier)
-- raceid found in creatureobject
--HUMAN = 0; RODIAN = 1; TRANDOSHAN = 2; MONCAL = 3; WOOKIE = 4; BOTHAN = 5; TWILEK = 6; ZABRAK = 7; ITHORIAN = 0x21; SULLUSTAN = 0x31;
imperial_racial_penalty = {
	{0, 1},
	{1, 3}, --rodian
	{2, 2}, -- trando
	{3, 3}, -- moncal
	{4, 3}, -- wookie
	{5, 2},  -- bothan
	{6, 1.5}, -- twilek
	{7, 2},  -- zabrack
	{33, 2}, --ithorian
	{49, 2}, -- sullustan

}

strongholdCities = {
	imperial = {"bela_vistal", "deeja_peak", "bestine"},
	rebel = {"vreni_island", "moenia", "anchorhead"}
}

terminalTemplates = {
	"object/tangible/hq_destructible/override_terminal.iff",
	"object/tangible/hq_destructible/power_regulator.iff",
	"object/tangible/hq_destructible/security_terminal.iff",
	"object/tangible/hq_destructible/uplink_terminal.iff"
}

-- { x, z, y, rotation, cell }
terminalSpawns = {
	-- Imperial Forward Outpost
	{ "hq_s01_imp",
		{
			{ -3.67, 0.13, 4.73, 180, 1 },
			{ -5.61, 0.13, 2.96, 90, 2 },
			{ -5.11, 0.13, 0.88, 0, 2 },
			{ -2.37, 0.13, 0.88, 0, 2 },
			{ 5.69, 0.13, 3.06, 270, 4 },
			{ 5.65, 0.13, -2.69, 270, 5 },
			{ 5.68, 0.13, -4.83, 270, 5 },
			{ -2.83, 0.13, -5.94, 0, 6 }
		}
	},
	-- Rebel Forward Outpost
	{ "hq_s01_rebel",
		{
			{ -2.38, 0.1, 0.6, 0, 2 },
			{ 0.59, 0.1, 2.4, 180, 3 },
			{ -1.2, 0.1, -0.69, 90, 3 },
			{ 5.92, 0.1, -0.3, -90, 4 },
			{ 2.85, 0.1, -0.89, 0, 4 },
			{ 4.13, 0.1, -6.17, 0, 5 },
			{ 5.92, 0.1, -2.57, -90, 5 },
			{ -5.93, 0.1, -4.02, 90, 6 },
			{ -5.93, 0.1, -2.1, 90, 6 },
		}
	},
	-- Imperial Field Hospital
	{ "hq_s02_imp",
		{
			{ 1.06, 0.25, 3.25, 270, 3 },
			{ -4.93, 0.25, -2.54, 90, 3 },
			{ -0.09, 0.25, -5.2, 0, 4 },
			{ -8.2, -6.75, -3.94, 90, 6 },
			{ -0.79, -6.75, -4.06, 270, 6 },
			{ -6.99, -6.77, -17.94, 0, 7 },
			{ 7.98, -6.77, -17.94, 0, 7 },
			{ 3.43, -6.75, 0.47, 180, 8 },
			{ 0.67, -13.75, -17.18, 0, 10 },
			{ -5.69, -13.75, -17.18, 0, 10 },
		}
	},
	-- Rebel Field Hospital
	{ "hq_s02_rebel",
		{
			{ -5.15, 0, 3.25, 90, 3 },
			{ -2.79, 0, -10.35, 0, 6 },
			{ -9.29, 0, -4.9, 180, 6 },
			{ -6.71, 0, -12, 180, 7 },
			{ 7.4, 0, -12, 180, 7 },
			{ 1.67, 0, -8.98, 90, 8 },
			{ 5.16, 0, -13.13, -90, 10 },
			{ -10.16, 0, -13.13, 90, 10 },
			{ 3.82, 0, -3.5, -90, 10 },
		}
	},
	-- Imperial Tactical Center
	{ "hq_s03_imp",
		{
			{ 0.06, 0.25, 1.58, 0, 2 },
			{ 3.47, 0.25, -5.7, 0, 3 },
			{ -0.11, 0.25, -2.82, 180, 3 },
			{ 4.54, -13.75, 1.95, 270, 6 },
			{ 4.34, -13.75, 10.44, 180, 7 },
			{ -7.32, -13.75, 10.44, 180, 7 },
			{ 3.26, -20.73, 1.3, 0, 9 },
			{ -5.22, -20.75, 16.75, 90, 10 },
			{ 8.22, -20.75, 16.75, 270, 10 },
		}
	},
	-- Rebel Tactical Center
	{ "hq_s03_rebel",
		{
			{ 0.14, 0.3, -2.61, 180, 3 },
			{ -4.83, -13.8, 4.12, 0, 7 },
			{ 8.14, -13.8, 7.3, -90, 7 },
			{ -1.2, -20.7, 12.45, 180, 9 },
			{ 5.36, -20.7, 7.69, -90, 9 },
			{ -5.3, -20.8, 31.78, 90, 10 },
			{ 8.27, -20.8, 34.2, -90, 10 },
			{ -5.3, -20.8, 34.26, 90, 10 },
		}
	},
	-- Imperial Detachment HQ
	{ "hq_s04_imp",
		{
			{ -1.08, 0.25, 3.22, 90, 2 },
			{ 4.96, 0.25, 3.07, 270, 2 },
			{ -0.5, 0.25, -2.77, 180, 3 },
			{ -3.48, 0.25, -5.7, 0, 3 },
			{ 6.22, -6.75, -10.44, 0, 5 },
			{ 0.21, -13.75, -1.81, 270, 7 },
			{ 10.78, -13.76, 13.69, 180, 8 },
			{ 18.41, -13.76, 8.56, 270, 9 },
			{ 18.41, -13.76, 5.43, 270, 9 },
			{ 13.77, -13.76, -4.1, 180, 10 },
		}
	},
	-- Rebel Detachment HQ
	{ "hq_s04_rebel",
		{
			{ 5.15, 0, -1.88, -90, 2 },
			{ 6.21, 0, -10.58, 0, 5 },
			{ 0.3, 0, -5.53, -90, 7 },
			{ 0.3, 0, -13.75, -90, 7 },
			{ 10.8, 0, 13.78, 180, 8 },
			{ 18.57, 0, 8.89, -90, 9 },
			{ 18.57, 0, 5.07, -90, 9 },
			{ 17.21, 0, -3.71, 180, 10 },
			{ 13.81, 0, -3.71, 180, 10 },
		}
	}
}

