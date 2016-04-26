/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCEABSORB2COMMAND_H_
#define FORCEABSORB2COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"


class ForceAbsorb2Command : public JediQueueCommand {
public:

	ForceAbsorb2Command(const String& name, ZoneProcessServer* server)
		: JediQueueCommand(name, server) {

		buffCRC = BuffCRC::JEDI_FORCE_ABSORB_2;

		overrideableCRCs.add(BuffCRC::JEDI_FORCE_ABSORB_1);

		singleUseEventTypes.add(ObserverEventType::FORCEBUFFHIT);

		skillMods.put("force_absorb", 2); // this is the same as force abosrb 1?
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (creature->hasBuff(BuffCRC::JEDI_FORCE_ABSORB_2)) {
			creature->removeBuff(BuffCRC::JEDI_FORCE_ABSORB_2);
			return SUCCESS;
		} else
			return doJediSelfBuffCommand(creature);
	}

};

#endif //FORCEABSORB2COMMAND_H_
