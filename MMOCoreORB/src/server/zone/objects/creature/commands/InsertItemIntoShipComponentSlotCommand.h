/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#ifndef INSERTITEMINTOSHIPCOMPONENTSLOTCOMMAND_H_
#define INSERTITEMINTOSHIPCOMPONENTSLOTCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class InsertItemIntoShipComponentSlotCommand : public QueueCommand {
public:

	InsertItemIntoShipComponentSlotCommand(const String& name, ZoneProcessServer* server)
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

#endif //INSERTITEMINTOSHIPCOMPONENTSLOTCOMMAND_H_
