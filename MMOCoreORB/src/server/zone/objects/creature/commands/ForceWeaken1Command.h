/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCEWEAKEN1COMMAND_H_
#define FORCEWEAKEN1COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "ForcePowersQueueCommand.h"
#include "server/zone/objects/creature/buffs/ForceWeakenDebuff.h"

class ForceWeaken1Command : public ForcePowersQueueCommand {
public:

	ForceWeaken1Command(const String& name, ZoneProcessServer* server)
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

		ManagedReference<CreatureObject*> creatureTarget = targetObject.castTo<CreatureObject*>();
		if (creatureTarget->hasBuff(STRING_HASHCODE("forceweaken2"))) {
			return NOSTACKJEDIBUFF;
		}

		int res = doCombatAction(creature, target);

		if (res == SUCCESS) {

			// Setup debuff.

			if (creatureTarget != NULL) {
				Locker clocker(creatureTarget, creature);

				ManagedReference<Buff*> buff = new Buff(creatureTarget, getNameCRC(), 90, BuffType::JEDI);

				int currentHealth = creatureTarget->getHAM(CreatureAttribute::HEALTH);
				int currentAction = creatureTarget->getHAM(CreatureAttribute::ACTION);
				int currentMind = creatureTarget->getHAM(CreatureAttribute::MIND);

				Locker locker(buff);

				if (currentHealth > 25000) {
					int currentStr = creatureTarget->getHAM(CreatureAttribute::STRENGTH);
					int currentCon = creatureTarget->getHAM(CreatureAttribute::CONSTITUTION);
					int currentQui = creatureTarget->getHAM(CreatureAttribute::QUICKNESS);
					int currentStam = creatureTarget->getHAM(CreatureAttribute::STAMINA);
					int currentFoc = creatureTarget->getHAM(CreatureAttribute::FOCUS);
					int currentWill = creatureTarget->getHAM(CreatureAttribute::WILLPOWER);

					if (creatureTarget->isKneeling() || creatureTarget->isSitting()) {
						buff->setAttributeModifier(CreatureAttribute::HEALTH, ((currentHealth + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::STRENGTH, ((currentStr + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, ((currentCon + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::ACTION, ((currentAction + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::QUICKNESS, ((currentQui + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::STAMINA, ((currentStam + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::MIND, ((currentMind + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::FOCUS, ((currentFoc + (System::random(50) * 18.25)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::WILLPOWER, ((currentWill + (System::random(50) * 18.25)) * 0.05) * -1);
					} else if (creatureTarget->isProne() || creatureTarget->isKnockedDown()) {
						buff->setAttributeModifier(CreatureAttribute::HEALTH, ((currentHealth + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::STRENGTH, ((currentStr + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, ((currentCon + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::ACTION, ((currentAction + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::QUICKNESS, ((currentQui + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::STAMINA, ((currentStam + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::MIND, ((currentMind + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::FOCUS, ((currentFoc + (System::random(50) * 24.5)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::WILLPOWER, ((currentWill + (System::random(50) * 24.5)) * 0.05) * -1);
					} else if (creatureTarget->isStanding() || creatureTarget->isRidingMount()) {
						buff->setAttributeModifier(CreatureAttribute::HEALTH, ((currentHealth + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::STRENGTH, ((currentStr + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, ((currentCon + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::ACTION, ((currentAction + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::QUICKNESS, ((currentQui + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::STAMINA, ((currentStam + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::MIND, ((currentMind + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::FOCUS, ((currentFoc + (System::random(50) * 12)) * 0.05) * -1);
						buff->setAttributeModifier(CreatureAttribute::WILLPOWER, ((currentWill + (System::random(50) * 12)) * 0.05) * -1);
					}
				} else if (currentHealth <= 25000) {
					if (creatureTarget->isKneeling() || creatureTarget->isSitting()) {
						buff->setAttributeModifier(CreatureAttribute::HEALTH, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::STRENGTH, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::ACTION, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::QUICKNESS, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::STAMINA, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::MIND, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::FOCUS, (100 + (System::random(50) * 4.25)) * -1);
						buff->setAttributeModifier(CreatureAttribute::WILLPOWER, (100 + (System::random(50) * 4.25)) * -1);
					} else if (creatureTarget->isProne() || creatureTarget->isKnockedDown()) {
						buff->setAttributeModifier(CreatureAttribute::HEALTH, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::STRENGTH, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::ACTION, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::QUICKNESS, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::STAMINA, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::MIND, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::FOCUS, (100 + (System::random(50) * 4.5)) * -1);
						buff->setAttributeModifier(CreatureAttribute::WILLPOWER, (100 + (System::random(50) * 4.5)) * -1);
					} else if (creatureTarget->isStanding() || creatureTarget->isRidingMount()) {
						buff->setAttributeModifier(CreatureAttribute::HEALTH, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::STRENGTH, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::CONSTITUTION, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::ACTION, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::QUICKNESS, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::STAMINA, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::MIND, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::FOCUS, (100 + (System::random(50) * 4)) * -1);
						buff->setAttributeModifier(CreatureAttribute::WILLPOWER, (100 + (System::random(50) * 4)) * -1);
					}
				}

				//ForceWeakenTask *task = new ForceWeakenTask(creatureTarget);
				//if (!creatureTarget->hasBuff(STRING_HASHCODE("forceweaken1"))) {
					// debuff of HAMs should be between 200-500 per.
					//int randTick = System::random(30);
					//int debuffHam = 200 + (randTick * 10);
					//creatureTarget->addMaxHAM(CreatureAttribute::HEALTH, -debuffHam, true);
					//creatureTarget->addMaxHAM(CreatureAttribute::ACTION, -debuffHam, true);
					//creatureTarget->addMaxHAM(CreatureAttribute::MIND, -debuffHam, true);
					//task->schedule(90);
			//	}

				if (!creatureTarget->hasBuff(STRING_HASHCODE("forceweaken1"))) {
					int duration = 90;
					int randTick = System::random(30);
					int debuffHam = 50 + (randTick * 10);// debuff of HAMs should be between 50-350 per weaken1, 100-400 w2
					String buffname = "jedi.buff.forceweaken1b";
					ManagedReference<Buff*> hamDebuff = new ForceWeakenDebuff(creatureTarget, buffname, buffname.hashCode(), debuffHam, duration);

					Locker locker(hamDebuff);

					creatureTarget->addBuff(hamDebuff);
				}

				creatureTarget->addBuff(buff);

			}

		}

		return res;
	}

};

#endif //FORCEWEAKEN1COMMAND_H_
