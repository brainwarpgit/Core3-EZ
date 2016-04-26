/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCERESISTDISEASECOMMAND_H_
#define FORCERESISTDISEASECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class ForceResistDiseaseCommand : public JediQueueCommand {
public:

	ForceResistDiseaseCommand(const String& name, ZoneProcessServer* server)
		: JediQueueCommand(name, server) {

		buffCRC = BuffCRC::JEDI_RESIST_DISEASE;

		skillMods.put("resistance_disease", 25);
		skillMods.put("absorption_disease", 25);

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (creature->hasBuff(BuffCRC::JEDI_RESIST_DISEASE)) {
			creature->removeBuff(BuffCRC::JEDI_RESIST_DISEASE);
			return SUCCESS;
		} else
			return doJediSelfBuffCommand(creature);
	}

};

#endif //FORCERESISTDISEASECOMMAND_H_
