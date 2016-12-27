/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REPAIRBATTLEFIELDSTRUCTURECOMMAND_H_
#define REPAIRBATTLEFIELDSTRUCTURECOMMAND_H_

class RepairBattlefieldStructureCommand : public QueueCommand {
public:

	RepairBattlefieldStructureCommand(const String& name, ZoneProcessServer* server)
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

#endif //REPAIRBATTLEFIELDSTRUCTURECOMMAND_H_
