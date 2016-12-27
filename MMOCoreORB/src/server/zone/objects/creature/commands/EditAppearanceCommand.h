/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef EDITAPPEARANCECOMMAND_H_
#define EDITAPPEARANCECOMMAND_H_

class EditAppearanceCommand : public QueueCommand {
public:

	EditAppearanceCommand(const String& name, ZoneProcessServer* server)
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

#endif //EDITAPPEARANCECOMMAND_H_
