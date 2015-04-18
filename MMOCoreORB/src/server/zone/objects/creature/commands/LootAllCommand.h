/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#ifndef LOOTALL_H_
#define LOOTALL_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "CombatQueueCommand.h"

class LootAllCommand : public QueueCommand {
public:

	LootAllCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;


		return SUCCESS;
	}

};

#endif //LOOTALL_H_
