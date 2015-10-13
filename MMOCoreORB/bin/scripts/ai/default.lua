rootDefault = {
	{id="root",		name="Selector",			pid="none"},
	{id="attack",	name="Sequence",			pid="root"},
	{id="gettar",	name="TreeSocket",			pid="attack",	args={slot=TARGET}},
	{id="selwep",	name="TreeSocket",			pid="attack",	args={slot=EQUIP}},
	{id="selatt",	name="TreeSocket",			pid="attack",	args={slot=ATTACK}},
	{id="moveset",	name="WriteBlackboard",		pid="attack",	args={key="moveMode", val=RUN}},
	{id="commove",	name="AlwaysSucceed",		pid="attack"},
	{id="commove0",	name="TreeSocket",			pid="commove",	args={slot=MOVE}},
	{id="aware",	name="TreeSocket",			pid="root",		args={slot=AWARE}},
	{id="idle",		name="TreeSocket",			pid="root",		args={slot=IDLE}}
}
addAiTemplate("rootDefault", rootDefault)

awareDefault = {
	{id="aware",	name="Selector",			pid="none"},
	{id="aware0",	name="LookForTarget",		pid="aware"},
	{id="aware.1",	name="Sequence",			pid="aware0"},
	{id="aware.2",	name="CalculateAggroMod",	pid="aware.1"},
	{id="aware.3",	name="CheckFollowInRange",	pid="aware.1"},
	{id="aware1",	name="Selector",			pid="aware.1"},
	{id="aware2",	name="Sequence",			pid="aware1"},
	{id="aware3",	name="TreeSocket",			pid="aware1",	args={slot=LOOKAT}},
	{id="aware4",	name="Selector",			pid="aware2"},
	{id="aware5",	name="Selector",			pid="aware2"},
	{id="aware6",	name="CheckFollowState",	pid="aware4",	args={condition=WATCHING}},
	{id="aware7",	name="CheckFollowState",	pid="aware4",	args={condition=STALKING}},
	{id="aware8",	name="TreeSocket",			pid="aware5",	args={slot=AGGRO}},
	{id="aware9",	name="TreeSocket",			pid="aware5",	args={slot=SCARE}},
	{id="aware10",	name="AlwaysFail",			pid="aware"},
	{id="aware11",	name="EraseBlackboard",		pid="aware10",	args={param="aggroMod"}},
}
addAiTemplate("awareDefault", awareDefault)

targetDefault = {
	{id="gettar0",	name="Selector",				pid="none"},
	{id="gettar1",	name="Sequence",				pid="gettar0"},
	{id="gettar2",	name="ExitCombat",				pid="gettar0",	args={clearDefenders=true}},
	{id="gettar3",	name="Sequence",				pid="gettar1"},
	{id="gettar4",	name="AlwaysSucceed",			pid="gettar1"},
	{id="gettar9",	name="AlwaysSucceed",			pid="gettar3"},
	{id="gettar10",	name="Selector",				pid="gettar3"},
	{id="gettar7",	name="SetDefenderFromFollow",	pid="gettar3"},
	{id="gettar11",	name="Selector",				pid="gettar9"},
	{id="gettar12",	name="GetFollowFromThreatMap",	pid="gettar11"},
	{id="gettar13",	name="GetFollowFromDefenders",	pid="gettar11"},
	{id="gettar15",	name="CheckTargetIsValid",		pid="gettar10"},
	{id="gettar16",	name="AlwaysFail",				pid="gettar10"},
	{id="gettar25",	name="Sequence",				pid="gettar16"},
	{id="gettar26",	name="DropFollowFromDefenders",	pid="gettar25"},
	{id="gettar27",	name="RestoreFollow",			pid="gettar25"},
	{id="gettar31",	name="Sequence",				pid="gettar4"},
	{id="gettar32",	name="CheckFollowHasState",		pid="gettar31",	args={condition=PEACE}},
	{id="gettar33",	name="CheckRandomLevel",		pid="gettar31",	args={condition=1}},
	{id="gettar34",	name="Not",						pid="gettar31"},
	{id="gettar35",	name="ExitCombat",				pid="gettar31",	args={clearDefenders=true}},
	{id="gettar36",	name="CheckFollowAggression",	pid="gettar34"}
}
addAiTemplate("targetDefault", targetDefault)

equipDefault = {
	{id="selwep0",	name="ParallelSequence",				pid="none"},
	{id="selwep1",	name="Sequence",						pid="selwep0"},
	{id="selwep2",	name="EraseBlackboard",					pid="selwep0",	args={param="stagedWeapon"}},
	{id="selwep3",	name="EraseBlackboard",					pid="selwep0",	args={param="followRange"}},
	{id="selwep4",	name="UpdateRangeToFollow",				pid="selwep1"},
	{id="selwep5",	name="Selector",						pid="selwep1"},
	{id="selwep6",	name="EquipStagedWeapon",				pid="selwep1"},
	{id="selwep7",	name="Sequence",						pid="selwep5"},
	{id="selwep8",	name="Sequence",						pid="selwep5"},
	{id="selwep9",	name="CheckFollowInWeaponRange",		pid="selwep7",	args={condition=WEAPON}},
	{id="selwep10",	name="CheckFollowClosestIdealRange",	pid="selwep7",	args={condition=WEAPON}},
	{id="selwep11",	name="WriteBlackboard",					pid="selwep7",	args={key="stagedWeapon", val=WEAPON}},
	{id="selwep12",	name="CheckFollowInWeaponRange",		pid="selwep8",	args={condition=DEFAULT}},
	{id="selwep13",	name="CheckFollowClosestIdealRange",	pid="selwep8",	args={condition=DEFAULT}},
	{id="selwep14",	name="WriteBlackboard",					pid="selwep8",	args={key="stagedWeapon", val=DEFAULT}}
}
addAiTemplate("equipDefault", equipDefault)

attackDefault = {
	{id="selatt0",		name="Sequence",					pid="none"},
	{id="selatt1",		name="NonDeterministicSelector",	pid="selatt0"},
	{id="selatt1.5",	name="SelectAttack",				pid="selatt0"},
	{id="selatt2",		name="Selector",					pid="selatt0"},
	{id="selatt3",		name="WriteBlackboard",				pid="selatt1",	args={key="attackType", val=DEFAULT}},
	{id="selatt4",		name="EraseBlackboard",				pid="selatt1",	args={param="attackType"}},
	{id="selatt5",		name="EraseBlackboard",				pid="selatt1",	args={param="attackType"}},
	{id="selatt6",		name="EraseBlackboard",				pid="selatt1",	args={param="attackType"}},
	{id="selatt7",		name="EraseBlackboard",				pid="selatt1",	args={param="attackType"}},
	{id="selatt8",		name="Sequence",					pid="selatt2"},
	{id="selatt8.5",	name="WriteBlackboard",				pid="selatt2",	args={key="attackType", val=DEFAULT}},
	{id="selatt9",		name="SelectAttack",				pid="selatt2"},
	{id="selatt10",		name="CheckAttackInRange",			pid="selatt8"},
	{id="selatt11",		name="CheckAttackIsValid",			pid="selatt8"}
}
addAiTemplate("attackDefault", attackDefault)

wanderDefault = {
	{id="wander",	name="Selector",		pid="none"},
	{id="wander0",	name="Sequence",		pid="wander"},
	{id="walkset",	name="WriteBlackboard",	pid="wander0",	args={key="moveMode", val=WALK}},
	{id="walkmove",	name="TreeSocket",		pid="wander0",	args={slot=MOVE}},
	{id="wait0",	name="Wait",			pid="wander0",	args={duration=10}},
	{id="patrol",	name="GeneratePatrol",	pid="wander",	args={numPoints=5, distFromHome=10}}
}
addAiTemplate("wanderDefault", wanderDefault)

moveDefault = {
	{id="move0",	name="Selector",			pid="none"}, -- TODO: the move logic can be moved more into the btrees...
	{id="move1",	name="Not",					pid="move0"},
	{id="move2",	name="Sequence",			pid="move0"},
	{id="move3",	name="AlwaysFail",			pid="move0"},
	{id="move4",	name="FindNextPosition",	pid="move0"},
	{id="move5",	name="Sequence",			pid="move1"},
	{id="move6",	name="CheckRetreat",		pid="move2",	args={condition=256}},
	{id="move7",	name="Leash",				pid="move2"},
	{id="move8",	name="Sequence",			pid="move3"},
	{id="move9",	name="CheckPosture",		pid="move5",	args={condition=UPRIGHT}},
	{id="move10",	name="CheckDestination",	pid="move5",	args={condition=0}},
	{id="move11",	name="CheckSpeed",			pid="move8",	args={condition=0}},
	{id="move12",	name="CompleteMove",		pid="move8"}
}
addAiTemplate("moveDefault", moveDefault)

-- This is for Creatures and not NPCs
lookDefault = {
	{id="look0",	name="Sequence",			pid="none"},
	{id="look1",	name="Selector",			pid="look0"},
	{id="look2",	name="CheckFollowSpeed",	pid="look0",	args={condition=FAST}},
	{id="look3",	name="CheckFollowLOS",		pid="look0"},
	{id="look4",	name="SetFollowState",		pid="look0",	args={state=WATCHING}},
	{id="look4.5",	name="SetAlert",			pid="look0",	args={duration=10.0, show=true}},
	{id="look5",	name="CheckFollowState",	pid="look1",	args={condition=OBLIVIOUS}},
	{id="look6",	name="CheckFollowState",	pid="look1",	args={condition=PATROLLING}}
}
addAiTemplate("lookDefault", lookDefault)

aggroDefault = {
	{id="aggro0",	name="Sequence",				pid="none"},
	{id="aggro1",	name="CheckFollowAggression",	pid="aggro0"},
	{id="aggro2",	name="CheckFollowLOS",			pid="aggro0"},
	{id="aggro3",	name="SetDefenderFromFollow",	pid="aggro0"}
}
addAiTemplate("aggroDefault", aggroDefault)

-- This is for Creatures and not NPCs
scareDefault = {
	{id="scare0",	name="Sequence",					pid="none"},
	{id="scare1",	name="CheckOutdoors",				pid="scare0"},
	{id="scare2",	name="CheckFollowLevel",			pid="scare0"},
	{id="scare3",	name="CheckFollowBackAggression",	pid="scare0"},
	{id="scare4",	name="CheckFollowSpeed",			pid="scare0",	args={condition=FAST}},
	{id="scare5",	name="CheckFollowFacing",			pid="scare0"},
	{id="scare6",	name="CheckFollowLOS",				pid="scare0"},
	{id="scare7",	name="RunAway",						pid="scare0",	args={dist=64}},
	{id="scare8",	name="SetAlert",					pid="scare0",	args={duration=10.0, show=false}}
}
addAiTemplate("scareDefault", scareDefault)

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
