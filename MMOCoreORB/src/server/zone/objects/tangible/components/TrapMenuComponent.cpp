/*
 * TrapMenuComponent.cpp
 *
 *  Created on: 10/30/2011
 *      Author: kyle
 */

#include <stddef.h>
#include <algorithm>

#include "TrapMenuComponent.h"
#include "engine/core/ManagedReference.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/ai/DroidObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/tangible/components/TangibleObjectMenuComponent.h"
#include "server/zone/objects/tangible/components/droid/DroidTrapModuleDataComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "system/lang/String.h"
#include "system/lang/ref/Reference.h"
#include "system/thread/Locker.h"

namespace server {
namespace zone {
namespace objects {
namespace tangible {
class TangibleObject;
}  // namespace tangible
}  // namespace objects
}  // namespace zone
}  // namespace server

void TrapMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (!sceneObject->isTangibleObject())
		return;

	TangibleObject* tano = cast<TangibleObject*>(sceneObject);
	if(tano == NULL)
		return;

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
	// load trap menu needs add
	if (player != NULL){
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		for (int i = 0; i < ghost->getActivePetsSize(); ++i) {
			ManagedReference<AiAgent*> object = ghost->getActivePet(i);
			if (object != NULL) {
				if(object->isDroidObject()) {
					DroidObject* droid = cast<DroidObject*>(object.get());
					if (droid != NULL) {
						if (droid->isTrapDroid()) {
							menuResponse->addRadialMenuItem(25, 3, "@pet/droid_modules:add_trap_to_droid" );
							return;
						}
					}
				}
			}
		}
	}
}

int TrapMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {

	if(!sceneObject->isASubChildOf(player))
		return 0;

	if (!sceneObject->isTangibleObject())
		return 0;

	if(selectedID == 20) {
		player->sendCommand(STRING_HASHCODE("throwtrap"), String::valueOf(sceneObject->getObjectID()), player->getTargetID());

		return 1;
	}
	if (selectedID == 25) {
		// call droid loading.
		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();
		for (int i = 0; i < ghost->getActivePetsSize(); ++i) {
			ManagedReference<AiAgent*> object = ghost->getActivePet(i);
			if (object != NULL) {
				if(object->isDroidObject()) {
					DroidObject* droid = cast<DroidObject*>(object.get());
					if (droid != NULL) {
						if (droid->isTrapDroid()) {
							Locker lock(droid);
							auto module = droid->getModule("trap_module").castTo<DroidTrapModuleDataComponent*>();
							if (module != NULL) {
								module->handleInsertTrap(player,cast<TangibleObject*>(sceneObject));
								return 0;
							}
						}
					}
				}
			}
		}

	}

	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}

