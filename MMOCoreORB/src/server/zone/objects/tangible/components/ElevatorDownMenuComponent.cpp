/*
 * ElevatorDownMenuComponent.h
 *
 *  Created on: 06/24/2012
 *      Author: swgemu
 */

#include "ElevatorDownMenuComponent.h"

#include "server/zone/objects/tangible/components/ElevatorMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
class CreatureObject;
}  // namespace creature
namespace scene {
class SceneObject;
}  // namespace scene
}  // namespace objects
}  // namespace zone
}  // namespace server

void ElevatorDownMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* creature) const {
	menuResponse->addRadialMenuItem(199, 3, "@elevator_text:down");
}

int ElevatorDownMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* creature, byte selectedID) const {
	if (selectedID != 199)
		return 0;

	return ElevatorMenuComponent::handleObjectMenuSelect(sceneObject, creature, selectedID);
}

