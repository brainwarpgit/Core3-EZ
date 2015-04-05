/*
Copyright (C) 2007 <SWGEmu>

This File is part of Core3.

This program is free software; you can redistribute
it and/or modify it under the terms of the GNU Lesser
General Public License as published by the Free Software
Foundation; either version 2 of the License,
or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for
more details.

You should have received a copy of the GNU Lesser General
Public License along with this program; if not, write to
the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

Linking Engine3 statically or dynamically with other modules
is making a combined work based on Engine3.
Thus, the terms and conditions of the GNU Lesser General Public License
cover the whole combination.

In addition, as a special exception, the copyright holders of Engine3
give you permission to combine Engine3 program with free software
programs or libraries that are released under the GNU LGPL and with
code included in the standard release of Core3 under the GNU LGPL
license (or modified versions of such code, with unchanged license).
You may copy and distribute such a system following the terms of the
GNU LGPL for Engine3 and the licenses of the other code concerned,
provided that you include the source code of that other code when
and as the GNU LGPL requires distribution of source code.

Note that people who make modified versions of Engine3 are not obligated
to grant this special exception for their modified versions;
it is their choice whether to do so. The GNU Lesser General Public License
gives permission to release a modified version without this exception;
this exception also makes it possible to release a modified version
which carries forward this exception.
*/

#ifndef LOOTCOMMAND_H_
#define LOOTCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/group/GroupLootTask.h"

class LootCommand : public QueueCommand {
public:

	LootCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<AiAgent*> ai = server->getZoneServer()->getObject(target).castTo<AiAgent*>();

		if (ai == NULL)
			return INVALIDTARGET;

		Locker locker(ai, creature);

		if (!ai->isDead())
			return GENERALERROR;

		//Get the corpse's inventory.
		SceneObject* creatureInventory = ai->getSlottedObject("inventory");
		if (creatureInventory == NULL)
			return GENERALERROR;

		//Determine the loot rights.
		bool looterIsOwner = (creatureInventory->getContainerPermissions()->getOwnerID() == creature->getObjectID());
		bool groupIsOwner = (creatureInventory->getContainerPermissions()->getOwnerID() == creature->getGroupID());

		if (!looterIsOwner && !groupIsOwner) {
			StringIdChatParameter noPermission("error_message","no_corpse_permission"); //You do not have permission to access this corpse.
			creature->sendSystemMessage(noPermission);
			return GENERALERROR;
		}

		bool lootAll = arguments.toString().beginsWith("all");

		//Handle group looting rules.
		if (groupIsOwner) {
			ManagedReference<GroupObject*> group = creature->getGroup();
			if (group == NULL)
				return GENERALERROR;

			GroupLootTask* task = new GroupLootTask(group, creature, ai, lootAll);
			task->execute();
			return SUCCESS;
		}

		//Allow player to loot the corpse.
		if (lootAll) {
			PlayerManager* playerManager = server->getZoneServer()->getPlayerManager();
			playerManager->lootAll(creature, ai);
		} else {
			ai->notifyObservers(ObserverEventType::LOOTCREATURE, creature, 0);
			creatureInventory->openContainerTo(creature);
		}

		return SUCCESS;
	}

};

#endif //LOOTCOMMAND_H_
