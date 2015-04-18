/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#ifndef GETMAPLOCATIONSCOMMAND_H_
#define GETMAPLOCATIONSCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class GetMapLocationsCommand : public QueueCommand {
public:

	GetMapLocationsCommand(const String& name, ZoneProcessServer* server)
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

#endif //GETMAPLOCATIONSCOMMAND_H_
