/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef CRIPPLINGSHOTCOMMAND_H_
#define CRIPPLINGSHOTCOMMAND_H_

#include "CombatQueueCommand.h"

class CripplingShotCommand : public CombatQueueCommand {
public:

	CripplingShotCommand(const String& name, ZoneProcessServer* server)
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

#endif //CRIPPLINGSHOTCOMMAND_H_
