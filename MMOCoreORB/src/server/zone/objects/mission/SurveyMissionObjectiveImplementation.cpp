/*
 * SurveyMissionObjectiveImplementation.cpp
 *
 *  Created on: 22/06/2010
 *      Author: victor
 */

#include <stddef.h>
#include <algorithm>

#include "engine/core/ManagedReference.h"
#include "engine/core/ManagedWeakReference.h"
#include "engine/util/u3d/Vector3.h"
#include "server/chat/StringIdChatParameter.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/mission/MissionObject.h"
#include "server/zone/objects/mission/MissionObjective.h"
#include "server/zone/objects/mission/MissionObserver.h"
#include "server/zone/objects/mission/SurveyMissionObjective.h"
#include "server/zone/objects/resource/ResourceSpawn.h"
#include "system/lang/String.h"
#include "system/lang/ref/Reference.h"
#include "system/lang/ref/WeakReference.h"
#include "system/platform.h"
#include "templates/params/ObserverEventType.h"

namespace engine {
namespace core {
class ManagedObject;
}  // namespace core
namespace util {
class Observable;
}  // namespace util
}  // namespace engine

void SurveyMissionObjectiveImplementation::activate() {
	MissionObjectiveImplementation::activate();

	if (hasObservers()) {
		return;
	}

	ManagedReference<CreatureObject*> player = getPlayerOwner();
	if (player != NULL) {
		ManagedReference<MissionObserver*> observer = new MissionObserver(_this.getReferenceUnsafeStaticCast());
		addObserver(observer, true);

		player->registerObserver(ObserverEventType::SURVEY, observer);
	}
}

void SurveyMissionObjectiveImplementation::abort() {
	MissionObjectiveImplementation::abort();

	if (!hasObservers())
		return;

	ManagedReference<MissionObserver*> observer = getObserver(0);

	ManagedReference<CreatureObject*> player = getPlayerOwner();
	if (player != NULL) {
		player->dropObserver(ObserverEventType::SURVEY, observer);

		dropObserver(observer, true);
	}
}

void SurveyMissionObjectiveImplementation::complete() {
	MissionObjectiveImplementation::complete();
}

int SurveyMissionObjectiveImplementation::notifyObserverEvent(MissionObserver* observer, uint32 eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {
	if (eventType == ObserverEventType::SURVEY) {
		ManagedReference<CreatureObject*> player = getPlayerOwner();
		ManagedReference<MissionObject*> mission = this->mission.get();

		if (player == NULL || mission == NULL) {
			return 0;
		}

		ResourceSpawn* sampledSpawn = cast<ResourceSpawn*>( arg1);

		if (sampledSpawn == NULL) {
			return 0;
		}

		int sampledDensity = (int)arg2;
		if (sampledSpawn->getSurveyMissionSpawnFamilyName() == spawnFamily && (sampledDensity >= efficiency)) {
			Vector3 startPosition;
			startPosition.setX(mission->getStartPositionX());
			startPosition.setY(mission->getStartPositionY());
			float distance = startPosition.distanceTo(player->getWorldPosition());
			if (distance > 1024.0f) {
				complete();

				return 1;
			} else {
				StringIdChatParameter stringId("mission/mission_generic", "survey_too_close");
				stringId.setDI(1024);
				stringId.setDF(distance);
				player->sendSystemMessage(stringId);

				return 0;
			}
		} else {
			return 0;
		}
	}

	dropObserver(observer, true);

	updateToDatabase();

	return 1;
}
