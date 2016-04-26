/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCEFEEDBACK2COMMAND_H_
#define FORCEFEEDBACK2COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/buffs/SingleUseBuff.h"

class ForceFeedback2Command : public JediQueueCommand {
public:

	ForceFeedback2Command(const String& name, ZoneProcessServer* server)
		: JediQueueCommand(name, server) {

		buffCRC = BuffCRC::JEDI_FORCE_FEEDBACK_2;

		overrideableCRCs.add(BuffCRC::JEDI_FORCE_FEEDBACK_1);

		singleUseEventTypes.add(ObserverEventType::FORCEBUFFHIT);

		skillMods.put("force_feedback", 95);

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (creature->hasBuff(BuffCRC::JEDI_FORCE_FEEDBACK_2)) {
			creature->removeBuff(BuffCRC::JEDI_FORCE_FEEDBACK_2);
			return SUCCESS;
		} else
			return doJediSelfBuffCommand(creature);
	}

};

#endif //FORCEFEEDBACK2COMMAND_H_
