/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#ifndef BLINDATTACKCOMMAND_H_
#define BLINDATTACKCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "CombatQueueCommand.h"

class BlindAttackCommand : public CombatQueueCommand {
public:

	BlindAttackCommand(const String& name, ZoneProcessServer* server) : CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isAiAgent())
			return GENERALERROR;

		return doCombatAction(creature, target, arguments);
	}

};

#endif //BLINDATTACKCOMMAND_H_
