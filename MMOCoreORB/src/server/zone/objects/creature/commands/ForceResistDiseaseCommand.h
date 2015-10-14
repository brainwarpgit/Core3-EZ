/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCERESISTDISEASECOMMAND_H_
#define FORCERESISTDISEASECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class ForceResistDiseaseCommand : public QueueCommand {
public:

	ForceResistDiseaseCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;


		if (isWearingArmor(creature)) {
			return NOJEDIARMOR;
		}

		uint32 buffcrc = BuffCRC::JEDI_RESIST_DISEASE;

		// Force cost of skill.
		int forceCost = 250;

		//Check for and deduct Force cost.
		ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();

		if (playerObject->getForcePower() <= forceCost) {
			creature->sendSystemMessage("@jedi_spam:no_force_power"); //"You do not have enough Force Power to peform that action.

			return GENERALERROR;
		}

		playerObject->setForcePower(playerObject->getForcePower() - forceCost);

		StringIdChatParameter startStringId("jedi_spam", "apply_forceresistdisease");
		StringIdChatParameter endStringId("jedi_spam", "remove_forceresistdisease");

		int duration = 900;

		ManagedReference<Buff*> buff = new Buff(creature, buffcrc, duration, BuffType::JEDI);

		Locker locker(buff);

		buff->setStartMessage(startStringId);
		buff->setEndMessage(endStringId);
		buff->setSkillModifier("resistance_disease", 25);
		buff->setSkillModifier("absorption_disease", 25);

		creature->addBuff(buff);
		creature->playEffect("clienteffect/pl_force_resist_disease_self.cef", "");

		return SUCCESS;
	}

};

#endif //FORCERESISTDISEASECOMMAND_H_
