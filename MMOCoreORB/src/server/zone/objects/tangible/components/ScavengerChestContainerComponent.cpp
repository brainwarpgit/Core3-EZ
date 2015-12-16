#include "ScavengerChestContainerComponent.h"
#include "server/zone/objects/tangible/Container.h"
#include "server/zone/objects/tangible/eventperk/ScavengerChest.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/tangible/components/EventPerkDataComponent.h"

bool ScavengerChestContainerComponent::checkContainerPermission(SceneObject* sceneObject, CreatureObject* creature, uint16 permission) {
	ContainerPermissions* permissions = sceneObject->getContainerPermissions();

	if(!sceneObject->isEventPerkItem())
		return false;

	ManagedReference<ScavengerChest*> chest = cast<ScavengerChest*>(sceneObject);

	if (chest == NULL)
		return false;

	Locker guard(chest);

	EventPerkDataComponent* gameData = cast<EventPerkDataComponent*>(chest->getDataObjectComponent()->get());

	if (gameData == NULL)
		return false;

	EventPerkDeed* deed = gameData->getDeed();

	if (deed == NULL)
		return false;

	ManagedReference<CreatureObject*> owner = deed->getOwner().get();

	if (permission == ContainerPermissions::MOVEIN) {
		if (creature == owner) {
			return true;
		} else {
			creature->sendSystemMessage("@event_perk:chest_can_not_add");
			return false;
		}
	} else if (permission == ContainerPermissions::MOVEOUT) {
		if (creature == owner) {
			return true;
		} else if (chest->isOnLootedList(creature->getObjectID())) {
			creature->sendSystemMessage("@event_perk:chest_only_one_item");
			return false;
		}

		return true;
	} else if (permission == ContainerPermissions::OPEN) {
		return true;
	}

	return false;
}

int ScavengerChestContainerComponent::notifyObjectRemoved(SceneObject* sceneObject, SceneObject* object, SceneObject* destination) {
	ContainerPermissions* permissions = sceneObject->getContainerPermissions();

	if(!sceneObject->isEventPerkItem())
		return 0;

	ManagedReference<ScavengerChest*> chest = cast<ScavengerChest*>(sceneObject);

	if (chest == NULL)
		return 0;

	EventPerkDataComponent* gameData = cast<EventPerkDataComponent*>(chest->getDataObjectComponent()->get());

	if (gameData == NULL)
		return 0;

	EventPerkDeed* deed = gameData->getDeed();

	if (deed == NULL)
		return 0;

	ManagedReference<CreatureObject*> owner = deed->getOwner().get();

	if (destination == NULL)
		return 0;

	ManagedReference<SceneObject*> rootParent = destination->getParent();

	if (rootParent != NULL && rootParent->isCreatureObject()) {
		CreatureObject* creature = cast<CreatureObject*>(rootParent.get());

		if (creature != NULL && creature != owner)
			chest->addtoLootedList(creature->getObjectID());
	}

	return 0;
}


