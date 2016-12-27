/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef EYESHOTCOMMAND_H_
#define EYESHOTCOMMAND_H_

#include "CombatQueueCommand.h"

class EyeShotCommand : public CombatQueueCommand {
public:

	EyeShotCommand(const String& name, ZoneProcessServer* server)
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

#endif //EYESHOTCOMMAND_H_
