/*
 * SquadLeaderBuffObserverImplementation.cpp
 *
 *  Created on: Mar 18, 2015
 *      Author: dannuic
 */

#include "server/zone/objects/creature/buffs/SquadLeaderBuffObserver.h"
#include "server/zone/objects/creature/buffs/SquadLeaderBuff.h"

#include "server/zone/objects/scene/SceneObjectType.h"

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"

#include "server/zone/objects/group/GroupObject.h"

int SquadLeaderBuffObserverImplementation::notifyObserverEvent(unsigned int eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {
	if (eventType != ObserverEventType::PARENTCHANGED && eventType != ObserverEventType::BHTEFCHANGED)
		return 0;

	ManagedReference<SquadLeaderBuff* > strongBuff = buff.get();

	if (strongBuff == NULL)
		return 1;

	ManagedReference<CreatureObject*> player = strongBuff->getPlayer();
	if (player == NULL)
		return 1;

	ManagedReference<CreatureObject*> leader = strongBuff->getLeader();

	if (leader == NULL || player->getGroup() == NULL || player->getGroup()->getLeader() != leader) {
		Core::getTaskManager()->executeTask([=] () {
			Locker locker(player);
			Locker clocker(strongBuff, player);
			player->removeBuff(strongBuff->getBuffCRC());
		}, "SquadLeaderObserverRemoveBuffLambda");
		return 1;
	}

	Reference<SquadLeaderBuffObserver*> thisObserver = _this.getReferenceUnsafeStaticCast();

	Core::getTaskManager()->executeTask([=] () {
		thisObserver->handleObserverEvent(eventType, player, leader, strongBuff);
	}, "HandleSquadLeaderObserverEventLambda");

	return 0;
}

void SquadLeaderBuffObserverImplementation::handleObserverEvent(unsigned int eventType, CreatureObject* player, CreatureObject* leader, SquadLeaderBuff* slBuff) {
	Locker locker(player);
	Locker clocker(slBuff, player);

	auto ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	if (eventType == ObserverEventType::PARENTCHANGED) {
		if (player->getRootParent() == leader->getRootParent()) {
			if (!slBuff->isActive() && !ghost->hasBhTef()) {
				slBuff->activate();
			}
		} else if (slBuff->isActive()) {
			slBuff->deactivate();
		}
	} else if (eventType == ObserverEventType::BHTEFCHANGED) {
		if (ghost->hasBhTef()) {
			if (slBuff->isActive()) {
				slBuff->deactivate();
			}
		} else if (!slBuff->isActive() && player->getRootParent() == leader->getRootParent()) {
			slBuff->activate();
		}
	}
}
