/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef HEALHEALTHWOUNDOTHER1COMMAND_H_
#define HEALHEALTHWOUNDOTHER1COMMAND_H_


#include "ForceHealQueueCommand.h"

class HealHealthWoundOther1Command : public ForceHealQueueCommand {
public:
	HealHealthWoundOther1Command(const String& name, ZoneProcessServer* server)
		: ForceHealQueueCommand(name, server) {
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return defaultTime * speed;
	}

};

#endif /* HEALHEALTHWOUNDOTHER1COMMAND_H_ */
