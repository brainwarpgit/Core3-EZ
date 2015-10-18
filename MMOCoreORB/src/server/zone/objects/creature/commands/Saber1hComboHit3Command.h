/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SABER1HCOMBOHIT3COMMAND_H_
#define SABER1HCOMBOHIT3COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "CombatQueueCommand.h"

class Saber1hComboHit3Command : public CombatQueueCommand {
public:

	Saber1hComboHit3Command(const String& name, ZoneProcessServer* server)
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

		// Divide the damage by number of pools hit, 3.
		damageMultiplier *= 0.33f;

		return doCombatAction(creature, target);
	}

};

#endif //SABER1HCOMBOHIT3COMMAND_H_
