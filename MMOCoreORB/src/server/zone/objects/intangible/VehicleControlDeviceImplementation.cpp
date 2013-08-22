/*
 * VehicleControlDeviceImplementation.cpp
 *
 *  Created on: 10/04/2010
 *      Author: victor
 */

#include "VehicleControlDevice.h"
#include "VehicleControlObserver.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/VehicleObject.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/Zone.h"
#include "tasks/CallMountTask.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/objects/player/sessions/TradeSession.h"

void VehicleControlDeviceImplementation::generateObject(CreatureObject* player) {
	if (player->getParent() != NULL)
		return;

	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject == NULL)
		return;

	if (controlledObject->isInQuadTree())
		return;

	if (player->isInCombat() || player->isDead() || player->isIncapacitated())
		return;

	ManagedReference<TradeSession*> tradeContainer = dynamic_cast<TradeSession*>(player->getActiveSession(SessionFacadeType::TRADE));

	if (tradeContainer != NULL) {
		return;
	}

	if(player->getPendingTask("call_mount") != NULL) {
		StringIdChatParameter waitTime("pet/pet_menu", "call_delay_finish_vehicle");
		Time nextExecution;
		Core::getTaskManager()->getNextExecutionTime(player->getPendingTask("call_mount"), nextExecution);
		int timeLeft = (nextExecution.getMiliTime() / 1000) - System::getTime();
		waitTime.setDI(timeLeft);

		player->sendSystemMessage(waitTime);
		return;
	}

	ManagedReference<SceneObject*> datapad = player->getSlottedObject("datapad");

	if (datapad == NULL)
		return;

	int currentlySpawned = 0;

	for (int i = 0; i < datapad->getContainerObjectsSize(); ++i) {
		ManagedReference<SceneObject*> object = datapad->getContainerObject(i);

		if (object->isControlDevice()) {
			ControlDevice* device = cast<ControlDevice*>( object.get());

			ManagedReference<SceneObject*> vehicle = device->getControlledObject();

			if (vehicle != NULL && vehicle->isInQuadTree()) {
				if (++currentlySpawned > 2)
					player->sendSystemMessage("@pet/pet_menu:has_max_vehicle");

				return;
			}
		}
	}

	if(player->getCurrentCamp() == NULL && player->getCityRegion() == NULL) {

		Reference<CallMountTask*> callMount = new CallMountTask(_this.get(), player, "call_mount");

		StringIdChatParameter message("pet/pet_menu", "call_vehicle_delay");
		message.setDI(15);
		player->sendSystemMessage(message);

		player->addPendingTask("call_mount", callMount, 15 * 1000);

		if (vehicleControlObserver == NULL) {
			vehicleControlObserver = new VehicleControlObserver(_this.get());
			vehicleControlObserver->deploy();
		}

		player->registerObserver(ObserverEventType::STARTCOMBAT, vehicleControlObserver);

	} else {

		Locker clocker(controlledObject, player);
		spawnObject(player);
	}

}

void VehicleControlDeviceImplementation::spawnObject(CreatureObject* player) {

	ZoneServer* zoneServer = getZoneServer();

	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject == NULL)
		return;

	ManagedReference<TradeSession*> tradeContainer = dynamic_cast<TradeSession*>(player->getActiveSession(SessionFacadeType::TRADE));

	if (tradeContainer != NULL) {
		return;
	}

	controlledObject->initializePosition(player->getPositionX(), player->getPositionZ(), player->getPositionY());
	ManagedReference<CreatureObject*> vehicle = NULL;
	
	if (controlledObject->isCreatureObject())
	{
	
		vehicle = cast<CreatureObject*>(controlledObject.get());
		vehicle->setCreatureLink(player);
		vehicle->setControlDevice(_this.get());
		
	}
	
	Zone* zone = player->getZone();
	
	if (zone == NULL)
		return;

	//controlledObject->insertToZone(player->getZone());
	zone->transferObject(controlledObject, -1, true);
	controlledObject->inflictDamage(player, 0, System::random(50), true);
	
	if (vehicle != NULL && controlledObject->getServerObjectCRC() == 0x32F87A54) // Jetpack
	{
	
		controlledObject->setCustomizationVariable("/private/index_hover_height", 40, true); // Illusion of flying.
		player->executeObjectControllerAction(String("mount").hashCode(), controlledObject->getObjectID(), ""); // Auto mount.
		
	}

	updateStatus(1);

	if (vehicleControlObserver != NULL)
		player->dropObserver(ObserverEventType::STARTCOMBAT, vehicleControlObserver);
}

void VehicleControlDeviceImplementation::cancelSpawnObject(CreatureObject* player) {

	if(player->getPendingTask("call_mount")) {
		player->getPendingTask("call_mount")->cancel();
		player->removePendingTask("call_mount");
	}

	if (vehicleControlObserver != NULL)
		player->dropObserver(ObserverEventType::STARTCOMBAT, vehicleControlObserver);
}

void VehicleControlDeviceImplementation::storeObject(CreatureObject* player) {
	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject == NULL)
		return;

	/*if (!controlledObject->isInQuadTree())
		return;*/

	if (player->isRidingMount() && player->getParent() == controlledObject) {

		if (!player->checkCooldownRecovery("mount_dismount"))
			return;

		player->executeObjectControllerAction(String("dismount").hashCode());

		if (player->isRidingMount())
			return;
	}

	controlledObject->destroyObjectFromWorld(true);

	if (controlledObject->isCreatureObject())
		(cast<CreatureObject*>(controlledObject.get()))->setCreatureLink(NULL);

	updateStatus(0);
}

void VehicleControlDeviceImplementation::destroyObjectFromDatabase(bool destroyContainedObjects) {
	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject != NULL) {
		Locker locker(controlledObject);

		//ManagedReference<CreatureObject*> object = controlledObject.castTo<CreatureObject*>()->getLinkedCreature();
		ManagedReference<CreatureObject*> object = cast<CreatureObject*>(controlledObject->getSlottedObject("rider"));

		if (object != NULL) {
			Locker clocker(object, controlledObject);

			object->executeObjectControllerAction(String("dismount").hashCode());

			object = cast<CreatureObject*>(controlledObject->getSlottedObject("rider"));

			if (object != NULL) {
				controlledObject->removeObject(object, NULL, true);

				Zone* zone = getZone();

				if (zone != NULL)
					zone->transferObject(object, -1, false);
			}
		}

		controlledObject->destroyObjectFromDatabase(true);
	}

	IntangibleObjectImplementation::destroyObjectFromDatabase(destroyContainedObjects);
}

int VehicleControlDeviceImplementation::canBeDestroyed(CreatureObject* player) {
	ManagedReference<TangibleObject*> controlledObject = this->controlledObject.get();

	if (controlledObject != NULL) {
		if (controlledObject->isInQuadTree())
			return 1;
	}

	return IntangibleObjectImplementation::canBeDestroyed(player);
}
