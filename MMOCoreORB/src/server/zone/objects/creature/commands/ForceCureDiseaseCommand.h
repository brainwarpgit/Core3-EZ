/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCECUREDISEASECOMMAND_H_
#define FORCECUREDISEASECOMMAND_H_

#include "ForceHealQueueCommand.h"

class ForceCureDiseaseCommand : public ForceHealQueueCommand {
public:

	ForceCureDiseaseCommand(const String& name, ZoneProcessServer* server)
		: ForceHealQueueCommand(name, server) {
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return defaultTime * speed;
	}

};

#endif //FORCECUREPOISONCOMMAND_H_
