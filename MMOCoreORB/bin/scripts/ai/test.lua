rootTest = {
	{id="root",       name="Selector",                     pid="none"},
	{id="attack",     name="TreeSocket",                   pid="root",		args="slot=COMBAT"},
	{id="wander",     name="TreeSocket",                   pid="root",		args="slot=IDLE"},
	{id="patrol",     name="GeneratePatrol",               pid="root",      args="numPoints=5:distFromHome=10"}
}
addAiTemplate("rootTest", rootTest)

attackTest = {
	{id="attack",     name="Sequence",                     pid="none"},
	{id="gettar",	  name="TreeSocket",				   pid="attack",	args="slot=TARGET"},
	{id="selwep",	  name="TreeSocket",				   pid="attack",	args="slot=WEAPON"},
	{id="selatt",	  name="TreeSocket",				   pid="attack",	args="slot=ATTACK"},
	{id="moveset",	  name="WriteBlackboard",			   pid="attack",	args="moveMode=RUN"},
	{id="commove",    name="TreeSocket",                   pid="attack",	args="slot=MOVE"}
}
addAiTemplate("attackTest", attackTest)

targetTest = {
	{id="gettar0",    name="Selector",                     pid="none"},
	{id="gettar1",    name="Sequence",                     pid="gettar0"},
	{id="gettar2",    name="ExitCombat",                   pid="gettar0",   args="clearDefenders=true"},
	{id="gettar3",    name="Sequence",                     pid="gettar1"},
	{id="gettar4",    name="AlwaysSucceed",                pid="gettar1"},
	{id="gettar5",    name="UntilSuccess",                 pid="gettar3"},
	{id="gettar6",    name="Selector",                     pid="gettar3"},
	{id="gettar7",    name="SetDefenderFromFollow",        pid="gettar3"},
	{id="gettar8",    name="Sequence",                     pid="gettar5"},
	{id="gettar9",    name="AlwaysSucceed",                pid="gettar8"},
	{id="gettar10",   name="Selector",                     pid="gettar8"},
	{id="gettar11",   name="Selector",                     pid="gettar9"},
	{id="gettar12",   name="GetFollowFromThreatMap",       pid="gettar11"},
	{id="gettar13",   name="GetFollowFromDefenders",       pid="gettar11"},
	{id="gettar14",   name="Not",                          pid="gettar10"},
	{id="gettar15",   name="Sequence",                     pid="gettar10"},
	{id="gettar16",   name="AlwaysFail",                   pid="gettar10"},
	{id="gettar17",   name="CheckHasFollow",               pid="gettar14"},
	{id="gettar18",   name="CheckFollowInRange",           pid="gettar15",  args="condition=128"},
	{id="gettar19",   name="CheckFollowAttackable",        pid="gettar15"},
	{id="gettar20",   name="Not",                          pid="gettar15"},
	{id="gettar21",   name="Selector",                     pid="gettar20"},
	{id="gettar22",   name="CheckFollowPosture",           pid="gettar21",  args="condition=14"}, -- TODO: parse posture enums (DEAD)
	{id="gettar23",   name="CheckFollowPosture",           pid="gettar21",  args="condition=13"}, -- TODO: parse posture enums (INCAPACITATED)
	{id="gettar25",   name="Sequence",                     pid="gettar16"},
	{id="gettar26",   name="DropFollowFromDefenders",      pid="gettar25"},
	{id="gettar27",   name="RestoreFollow",                pid="gettar25"},
	{id="gettar28",   name="CheckHasFollow",               pid="gettar6"},
	{id="gettar29",   name="AlwaysFail",                   pid="gettar6"},
	{id="gettar30",   name="RestoreFollow",                pid="gettar29"},
	{id="gettar31",   name="Sequence",                     pid="gettar4"},
	{id="gettar32",   name="CheckFollowHasState",          pid="gettar31",  args="condition=4"}, -- TODO: Need to parse PEACE and other enums
	{id="gettar33",   name="CheckRandomLevel",             pid="gettar31",  args="condition=1"},
	{id="gettar34",   name="Not",                          pid="gettar31"},
	{id="gettar35",   name="ExitCombat",                   pid="gettar31",  args="clearDefenders=true"},
	{id="gettar36",   name="CheckFollowAggression",        pid="gettar34"},
}
addAiTemplate("targetTest", targetTest)

weaponTest = {
	{id="selwep0",    name="ParallelSequence",             pid="none"},
	{id="selwep1",    name="Sequence",                     pid="selwep0"},
	{id="selwep2",    name="EraseBlackboard",              pid="selwep0",   args="param=stagedWeapon"},
	{id="selwep3",    name="EraseBlackboard",              pid="selwep0",   args="param=followRange"},
	{id="selwep4",    name="UpdateRangeToFollow",          pid="selwep1"},
	{id="selwep5",    name="Selector",                     pid="selwep1"},
	{id="selwep6",    name="EquipStagedWeapon",            pid="selwep1"},
	{id="selwep7",    name="Sequence",                     pid="selwep5"},
	{id="selwep8",    name="Sequence",                     pid="selwep5"},
	{id="selwep9",    name="CheckFollowInWeaponRange",     pid="selwep7",   args="condition=WEAPON"},
	{id="selwep10",   name="CheckFollowClosestIdealRange", pid="selwep7",   args="condition=WEAPON"},
	{id="selwep11",   name="WriteBlackboard",              pid="selwep7",   args="stagedWeapon=WEAPON"},
	{id="selwep12",   name="CheckFollowInWeaponRange",     pid="selwep8",   args="condition=DEFAULT"},
	{id="selwep13",   name="CheckFollowClosestIdealRange", pid="selwep8",   args="condition=DEFAULT"},
	{id="selwep14",   name="WriteBlackboard",              pid="selwep8",   args="stagedWeapon=DEFAULT"},
}
addAiTemplate("weaponTest", weaponTest)

attackTest = {
	{id="selatt0",    name="Sequence",                     pid="none"},
	{id="selatt1",    name="NonDeterministicSelector",     pid="selatt0"},
	{id="selatt1.5",  name="SelectAttack",				   pid="selatt0"},
	{id="selatt2",    name="Selector",                     pid="selatt0"},
	{id="selatt3",    name="WriteBlackboard",              pid="selatt1",   args="attackType=DEFAULT"},
	{id="selatt4",    name="EraseBlackboard",              pid="selatt1",   args="param=attackType"},
	{id="selatt5",    name="EraseBlackboard",              pid="selatt1",   args="param=attackType"},
	{id="selatt6",    name="EraseBlackboard",              pid="selatt1",   args="param=attackType"},
	{id="selatt7",    name="EraseBlackboard",              pid="selatt1",   args="param=attackType"},
	{id="selatt8",    name="Sequence",                     pid="selatt2"},
	{id="selatt8.5",  name="WriteBlackboard",              pid="selatt2",	args="attackType=DEFAULT"},
	{id="selatt9",    name="SelectAttack",                 pid="selatt2"},
	{id="selatt10",   name="CheckAttackInRange",           pid="selatt8"},
	{id="selatt11",   name="CheckAttackIsValid",           pid="selatt8"},
}
addAiTemplate("attackTest", attackTest)

wanderTest = {
	{id="wander",     name="Sequence",		  pid="none"},
	{id="wander0",    name="Sequence",		  pid="wander"}, -- add an extra level here for runningChain tests
	{id="walkset",	  name="WriteBlackboard", pid="wander0", args="moveMode=WALK"},
	{id="walkmove",   name="TreeSocket",	  pid="wander0", args="slot=MOVE"},
	{id="wait0",      name="Wait",			  pid="wander0", args="duration=10"},
}
addAiTemplate("wanderTest", wanderTest)

moveTest = {
	{id="move0",  name="Selector",		   pid="none"}, -- TODO: the move logic can be moved more into the btrees...
	{id="move1",  name="Not",              pid="move0"},
	{id="move2",  name="Sequence",         pid="move0"},
	{id="move3",  name="AlwaysFail",       pid="move0"},
	{id="move4",  name="FindNextPosition", pid="move0"},
	{id="move5",  name="Sequence",         pid="move1"},
	{id="move6",  name="CheckRetreat",     pid="move2", args="condition=256"},
	{id="move7",  name="Leash",            pid="move2"},
	{id="move8",  name="Sequence",         pid="move3"},
	{id="move9",  name="CheckPosture",     pid="move5", args="condition=0"}, -- TODO: parse posture enums (UPRIGHT)
	{id="move10", name="CheckDestination", pid="move5", args="condition=0"},
	{id="move11", name="CheckSpeed",       pid="move8", args="condition=0"},
	{id="move12", name="CompleteMove",     pid="move8"}
}
addAiTemplate("moveTest", moveTest)

succeedTest = {
	{id="succeed", name="AlwaysSucceed", pid="none"},
	{id="dummy",   name="Dummy",		 pid="succeed"}
}
addAiTemplate("succeedTest", succeedTest)

failTest = {
	{id="fail",  name="AlwaysFail", pid="none"},
	{id="dummy", name="Dummy",		pid="fail"}
}
addAiTemplate("failTest", failTest)
