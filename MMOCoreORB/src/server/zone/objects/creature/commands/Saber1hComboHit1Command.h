/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SABER1HCOMBOHIT1COMMAND_H_
#define SABER1HCOMBOHIT1COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "CombatQueueCommand.h"

class Saber1hComboHit1Command : public CombatQueueCommand {
public:

	Saber1hComboHit1Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (isWearingArmor(creature)) {
			return NOJEDIARMOR;
		}


		float mods[3] = {0.f, 0.f, 0.f};

		for (int i = 0; i < 3; i++)
			mods[System::random(2)] += 0.74f;

		UnicodeString args = "healthDamageMultiplier=" + String::valueOf(mods[0]) + ";actionDamageMultiplier=" + String::valueOf(mods[1]) + ";mindDamageMultiplier=" + String::valueOf(mods[2]) + ";";


		return doCombatAction(creature, target, args);
	}

};

#endif //SABER1HCOMBOHIT1COMMAND_H_
