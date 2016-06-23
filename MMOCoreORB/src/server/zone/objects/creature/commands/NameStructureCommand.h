/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef NAMESTRUCTURECOMMAND_H_
#define NAMESTRUCTURECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/player/sui/callbacks/NameStructureSuiCallback.h"

class NameStructureCommand : public QueueCommand {
public:

	NameStructureCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<PlayerManager*> playerManager = server->getPlayerManager();

		ManagedReference<SceneObject*> obj = playerManager->getInRangeStructureWithAdminRights(creature, target);

		ManagedReference<SceneObject*> currenttarget = server->getZoneServer()->getObject(target);

		if (creature->getTargetID() == 0 || !currenttarget->isStructureObject()) {
			creature->sendSystemMessage("You must TARGET the actual STRUCTURE before you can execute that command upon it.");
			return INVALIDTARGET;
		}

		if (obj->getObjectID() != creature->getTargetID()) {
			creature->sendSystemMessage("You must move closer to the currently targeted structure before performing that action.");
			return GENERALERROR;
		}

		if (obj == NULL || !obj->isStructureObject()) {
			creature->sendSystemMessage("@player_structure:command_no_building"); //You must be in a building or near an installation to use that command.
			return INVALIDTARGET;
		}

		StructureObject* structure = cast<StructureObject*>(obj.get());

		Locker _lock(structure, creature);

		if (!structure->isOwnerOf(creature)) {
			creature->sendSystemMessage("@player_structure:rename_must_be_owner"); //You must be the owner to rename a structure.
			return GENERALERROR;
		}

		if (structure->isGCWBase()) {
			creature->sendSystemMessage("@player_structure:no_rename_hq"); //You may not rename a factional headquarters.
			return INVALIDTARGET;
		}

		if (structure->isTurret() || structure->isMinefield()) {
			return INVALIDTARGET;
		}

		//Validate the name.
		NameManager* nameManager = server->getNameManager();

		String name = arguments.toString();

		if (name.isEmpty() || nameManager->isProfane(name) || name.length() > 128) {
			creature->sendSystemMessage("@player_structure:obscene"); //That name was rejected by the name filter. Try a different name.
			return INVALIDPARAMETERS;
		}

		structure->setCustomObjectName(name, true);

		if (structure->isBuildingObject() && (cast<BuildingObject*>(structure))->getSignObject() != NULL) {
			StringIdChatParameter params("@player_structure:prose_sign_name_updated"); //Sign name successfully updated to '%TO'.
			params.setTO(name);
			creature->sendSystemMessage(params);
		}

		creature->sendSystemMessage("@player_structure:structure_renamed"); //Structure renamed.

		return SUCCESS;
	}

};

#endif //NAMESTRUCTURECOMMAND_H_
