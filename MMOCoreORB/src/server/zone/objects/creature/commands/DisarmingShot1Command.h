/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef DISARMINGSHOT1COMMAND_H_
#define DISARMINGSHOT1COMMAND_H_

#include "CombatQueueCommand.h"

class DisarmingShot1Command : public CombatQueueCommand {
public:

	DisarmingShot1Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		int result = doCombatAction(creature, target);

		if (result == SUCCESS) {
			ZoneServer* zoneServer = creature->getZoneServer();

			if (zoneServer == nullptr)
				return result;

			ManagedReference<SceneObject*> targetObject = zoneServer->getObject(target);

			if (targetObject == nullptr || !targetObject->isCreatureObject())
				return result;

			CreatureObject* tarCreo = targetObject->asCreatureObject();

			if (tarCreo == nullptr || !tarCreo->isAiAgent()) {
				return result;
			}

			AiAgent* agent = tarCreo->asAiAgent();

			if (agent == nullptr || !agent->isNpc())
				return result;

			agent->unequipWeapons();
		}

		return result;
	}

};

#endif //DISARMINGSHOT1COMMAND_H_
