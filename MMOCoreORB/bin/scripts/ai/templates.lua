includeFile("default.lua")
includeFile("pet.lua")
--TODO: write templates, put them in the base ai directory and get rid of current ai script directory structure
--includeAiFile("templates/example.lua")
--includeAiFile("templates/stationary.lua")
--includeAiFile("templates/stationarynoleash.lua")
--includeAiFile("templates/follow.lua")
--includeAiFile("templates/wait.lua")
--includeAiFile("templates/idlewander.lua")
--includeAiFile("templates/idlewait.lua")
--includeAiFile("templates/idlepet.lua")
--includeAiFile("templates/gettargetreactive.lua")
--includeAiFile("templates/manualescort.lua")
--includeAiFile("templates/selectattacksimple.lua")
--includeAiFile("templates/combatmovesimple.lua")
--includeAiFile("templates/gettargetpet.lua")
--includeAiFile("templates/selectattackpet.lua")
--includeAiFile("templates/combatmovepet.lua")

bitmaskLookup = {
{NONE, {
	{NONE, "rootDefault"},
	{IDLE, "wanderDefault"},
	{ATTACK, "attackDefault"},
	{EQUIP, "equipDefault"},
	{TARGET, "targetDefault"},
	{MOVE, "moveDefault"},
	{LOOKAT, "lookDefault"},
	{AGGRO, "aggroDefault"},
	{SCARE, "scareDefault"}
}},

{STATIC, {
	{IDLE, "succeedTest"}
}},

{PET, {
	{IDLE, "idlePet"},
	{TARGET, "targetPet"},
	{MOVE, "movePet"}
}},

{TEST, {
	{IDLE, "succeedTest"},
	{ATTACK, "failTest"},
	{EQUIP, "failTest"},
	{TARGET, "failTest"},
	{MOVE, "failTest"},
	{LOOKAT, "failTest"},
	{AGGRO, "failTest"},
	{SCARE, "failTest"}
}}
}

-- These are unused, leave them in for reference now until the other
-- table has been fully populated and all templates have been replicated.
idle = {
	{CREATURE_PET, "idlepetc"},
	{DROID_PET, "idlepetd"},
	{FACTION_PET, "idlepetf"},
	{STATIC + WANDER, "idlewanderstatic"},
	{STATIC, "idlewait"},
	{PACK, "idlewanderpack"},
	{NONE, "idlewander"},
}
