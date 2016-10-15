/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef INTIMIDATE2COMMAND_H_
#define INTIMIDATE2COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "server/zone/packets/object/CombatSpam.h"
#include "server/chat/ChatMessage.h"
#include "CombatQueueCommand.h"

class Intimidate2Command : public CombatQueueCommand {
public:

	Intimidate2Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		Reference<TangibleObject*> targetObject = server->getZoneServer()->getObject(target).castTo<TangibleObject*>();

		if (targetObject == NULL || !targetObject->isCreatureObject())
			return INVALIDTARGET;

		ManagedReference<CreatureObject*> targetCreature = targetObject.castTo<CreatureObject*>();
		if (targetCreature->isSpecialTrooper() || targetCreature->isDroidSpecies() || targetCreature->isWalkerSpecies()) {
			creature->sendSystemMessage("@combat_effects:immune_to_effect");// "The Target is immune to such an effect."
			return GENERALERROR;
		}

		int res = doCombatAction(creature, target);

		if (res == TOOFAR && creature->isPlayerCreature()) {
			CombatSpam* msg = new CombatSpam(creature, targetObject, creature, NULL, 0, "cbt_spam", "intim_out_of_range", 0);
			creature->sendMessage(msg);
		}

		if (res == SUCCESS && creature->isPlayerCreature()) {
			ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

			if (ghost != NULL && !ghost->getCommandMessageString(STRING_HASHCODE("intimidate2")).isEmpty() && creature->checkCooldownRecovery("command_message")) {
				UnicodeString shout(ghost->getCommandMessageString(STRING_HASHCODE("intimidate2")));
				server->getChatManager()->broadcastChatMessage(creature, shout, 0, 0, 80, ghost->getLanguageID());
				creature->updateCooldownTimer("command_message", 30 * 1000);
			}
		}
		return res;
	}

};

#endif //INTIMIDATE2COMMAND_H_
