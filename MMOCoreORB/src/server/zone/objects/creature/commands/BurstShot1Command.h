/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef BURSTSHOT1COMMAND_H_
#define BURSTSHOT1COMMAND_H_

#include "CombatQueueCommand.h"

class BurstShot1Command : public CombatQueueCommand {
public:

	BurstShot1Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		return doCombatAction(creature, target);
	}

};

#endif //BURSTSHOT1COMMAND_H_
