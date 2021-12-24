/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef DECLINECOMMAND_H_
#define DECLINECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/chat/StringIdChatParameter.h"


class DeclineCommand : public QueueCommand {
public:

	DeclineCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		uint64 inviterID = creature->getGroupInviterID();
		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(inviterID);

		if (object == nullptr || !object->isPlayerCreature())
			return GENERALERROR;

		CreatureObject* inviter = cast<CreatureObject*>( object.get());

		creature->updateGroupInviterID(0);

		bool galaxyWide = ConfigManager::instance()->getBool("Core3.PlayerManager.galaxyWideGrouping", false);

		StringIdChatParameter stringId;
		stringId.setStringId("group", "decline_leader");

		if (galaxyWide) {
			stringId.setTT(creature->getDisplayedName());
		} else {
			stringId.setTT(creature->getObjectID());
		}

		inviter->sendSystemMessage(stringId);
		creature->sendSystemMessage("@group:decline_self");

		return SUCCESS;
		/*DECLINE DUEL CODE
				CombatManager* combatManager = server->getCombatManager();
				if (combatManager == nullptr)
					return false;

				 uint64 target = packet->parseLong();
				 combatManager->declineDuel(player, target);*/
	}

};

#endif //DECLINECOMMAND_H_

