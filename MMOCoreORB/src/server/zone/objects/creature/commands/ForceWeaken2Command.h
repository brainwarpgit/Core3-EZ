/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCEWEAKEN2COMMAND_H_
#define FORCEWEAKEN2COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "ForcePowersQueueCommand.h"

class ForceWeaken2Command : public ForcePowersQueueCommand {
public:

	ForceWeaken2Command(const String& name, ZoneProcessServer* server)
		: ForcePowersQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (isWearingArmor(creature)) {
			return NOJEDIARMOR;
		}

		ManagedReference<SceneObject*> targetObject = server->getZoneServer()->getObject(target);

		if (targetObject == NULL || !targetObject->isCreatureObject()) {
			return INVALIDTARGET;
		}

		int res = doCombatAction(creature, target);

		if (res == SUCCESS) {

			// Setup debuff.

			ManagedReference<CreatureObject*> creatureTarget = targetObject.castTo<CreatureObject*>();

			if (creatureTarget != NULL) {
				Locker clocker(creatureTarget, creature);

				ManagedReference<Buff*> buff = new Buff(creatureTarget, getNameCRC(), 120, BuffType::JEDI);

				Locker locker(buff);

				buff->setAttributeModifier(CreatureAttribute::HEALTH, -600);
				buff->setAttributeModifier(CreatureAttribute::ACTION, -600);
				buff->setAttributeModifier(CreatureAttribute::MIND, -600);

				int health = getHAM(CreatureAttribute::HEALTH);

					if (health < 0)
						setHAM(CreatureAttribute::HEALTH, 1);

				int action = getHAM(CreatureAttribute::ACTION);

					if (action < 0)
						setHAM(CreatureAttribute::ACTION, 1);

				int mind = getHAM(CreatureAttribute::MIND);

					if (mind < 0)
						setHAM(CreatureAttribute::MIND, 1);

				creatureTarget->addBuff(buff);
			}

		}

		return SUCCESS;
	}

};

#endif //FORCEWEAKEN2COMMAND_H_
