/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#ifndef SETBIOGRAPHYADMINCOMMAND_H_
#define SETBIOGRAPHYADMINCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class SetBiographyAdminCommand : public QueueCommand {
public:

	SetBiographyAdminCommand(const String& name, ZoneProcessServer* server)
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

#endif //SETBIOGRAPHYADMINCOMMAND_H_
