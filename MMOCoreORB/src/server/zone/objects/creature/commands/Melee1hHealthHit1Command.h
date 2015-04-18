/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#ifndef MELEE1HHEALTHHIT1COMMAND_H_
#define MELEE1HHEALTHHIT1COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "CombatQueueCommand.h"


class Melee1hHealthHit1Command : public CombatQueueCommand {
public:

	Melee1hHealthHit1Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		ManagedReference<WeaponObject*> weapon = creature->getWeapon();

		if (!weapon->isOneHandMeleeWeapon()) {
			return INVALIDWEAPON;
		}

		return doCombatAction(creature, target);
	}

};

#endif //MELEE1HHEALTHHIT1COMMAND_H_
