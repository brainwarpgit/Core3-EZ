
#ifndef PETSTAYCOMMAND_H_
#define PETSTAYCOMMAND_H_

#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "templates/params/ObserverEventType.h"
#include "server/zone/managers/creature/PetManager.h"

class PetStayCommand : public QueueCommand {
public:
	PetStayCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {
	}


	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		ManagedReference<PetControlDevice*> controlDevice = creature->getControlDevice().get().castTo<PetControlDevice*>();
		if (controlDevice == NULL)
			return GENERALERROR;

		ManagedReference<AiAgent*> pet = cast<AiAgent*>(creature);
		if( pet == NULL )
			return GENERALERROR;

		if (pet->hasRidingCreature())
			return GENERALERROR;

		CombatManager::instance()->attemptPeace(pet);

		pet->setOblivious();
		pet->storeFollowObject();

		Locker clocker(controlDevice, creature);
		controlDevice->setLastCommand(PetManager::STAY);

		pet->notifyObservers(ObserverEventType::STARTCOMBAT, pet->getLinkedCreature().get());

		return SUCCESS;
	}

};


#endif /* PETSTAYCOMMAND_H_ */
