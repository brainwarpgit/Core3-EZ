#include "server/zone/objects/tangible/eventperk/ShuttleBeacon.h"
#include "server/zone/Zone.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/templates/tangible/EventPerkDeedTemplate.h"
#include "server/zone/objects/tangible/tasks/RemoveEventPerkItemTask.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/objects/area/ActiveArea.h"
#include "server/zone/managers/planet/PlanetManager.h"
#include "server/zone/managers/structure/StructureManager.h"
#include "server/zone/objects/player/sui/callbacks/ShuttleBeaconSuiCallback.h"
#include "engine/task/ScheduledTask.h"

void ShuttleBeaconImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	activateRemoveEvent();
}

void ShuttleBeaconImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	ManagedReference<CreatureObject*> perkOwner = getOwner().get();
	ManagedReference<SceneObject*> beaconParent = getParentRecursively(SceneObjectType::PLAYERCREATURE);

	if (perkOwner == NULL || beaconParent == NULL || perkOwner != beaconParent)
		return;

	menuResponse->addRadialMenuItem(20, 3, "@event_perk:call_shuttle");
}

int ShuttleBeaconImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	ManagedReference<CreatureObject*> perkOwner = getOwner().get();
	ManagedReference<SceneObject*> beaconParent = getParentRecursively(SceneObjectType::PLAYERCREATURE);

	if (perkOwner == NULL || beaconParent == NULL || perkOwner != beaconParent || selectedID != 20)
		return 0;

	int shuttleStatus = getShuttleStatus();


	if (shuttleStatus == 0) {
		if (shuttle != NULL) {
			player->sendSystemMessage("@event_perk:already_have_shuttle");
			return 0;
		}

		callShuttle(player);
	} else if (shuttleStatus == 1) {
		if (!readyToTakeOff) {
			player->sendSystemMessage("@event_perk:shuttle_not_take_off");
			return 0;
		}

		//dismissShuttle();
	}

	return 0;
}

void ShuttleBeaconImplementation::callShuttle(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	int shuttleStatus = getShuttleStatus();

	if (shuttleStatus == 1 && shuttle != NULL)
		return;

	ManagedReference<SuiListBox*> listbox = new SuiListBox(player, SuiWindowType::SHUTTLE_BEACON);
    listbox->setCallback(new ShuttleBeaconSuiCallback(server->getZoneServer()));
	listbox->setPromptTitle("@event_perk:shuttle_beacon_t"); // Select Shuttle Landing Type
	listbox->setPromptText("@event_perk:shuttle_beacon_d"); // Select the type of shuttle landing you would like to call. Contacting the shuttle again after it lands will order the shuttle to leave.
	listbox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	listbox->setForceCloseDistance(32.f);
	listbox->setCancelButton(true, "@cancel");

	listbox->addMenuItem("@event_perk:shuttle_lambda_shuttle");
	listbox->addMenuItem("@event_perk:shuttle_shuttle");
	listbox->addMenuItem("@event_perk:shuttle_transport_drop_down");
	listbox->addMenuItem("@event_perk:shuttle_transport_fly_in");

	ghost->addSuiBox(listbox);
	player->sendMessage(listbox->generateMessage());
}

void ShuttleBeaconImplementation::spawnShuttle(CreatureObject* player, int type) {
	if (player == NULL || shuttle != NULL)
		return;

	ManagedReference<ZoneServer*> zoneServer = getZoneServer();

	if (zoneServer == NULL)
		return;

	if (!canSpawnShuttle(player)) {
		player->sendSystemMessage("@event_perk:shuttle_not_called"); // A shuttle could not be called.
		return;
	}

	uint32 shuttleTemplate;

	switch (type) {
	case 3: shuttleTemplate = 0xB120E676; break; // object/creature/npc/theme_park/event_transport_theed_hangar.iff
	case 2: shuttleTemplate = 0xD3D6FBA1; break; // object/creature/npc/theme_park/event_transport.iff
	case 1: shuttleTemplate = 0x62A585E7; break; // object/creature/npc/theme_park/player_shuttle.iff
	case 0: shuttleTemplate = 0xCB59CE5C; break; // object/creature/npc/theme_park/lambda_shuttle.iff
	default: return;
	}

	ManagedReference<SceneObject*> object = zoneServer->createObject(shuttleTemplate, 0);

	if (object == NULL)
		return;

	CreatureObject* newShuttle = cast<CreatureObject*>( object.get());

	if (newShuttle == NULL)
		return;

	Locker locker(newShuttle);

	float direction = player->getDirectionAngle();

	if (shuttleType < 3)
		direction += 180;

	newShuttle->initializePosition(getPositionX(), getPositionZ(), getPositionY());
	newShuttle->setDirection(Math::deg2rad(direction));
	zone->transferObject(newShuttle, -1, true);

	if (type == 1)
		newShuttle->setPosture(CreaturePosture::PRONE, true, true);

	shuttle = newShuttle;

	ManagedReference<ShuttleBeacon*> tempBeacon = _this.getReferenceUnsafeStaticCast();

	if (tempBeacon == NULL)
		return;

	SCHEDULE_TASK_2(tempBeacon, player, 250, {
		Locker locker(tempBeacon_p);
		tempBeacon_p->landShuttle(player_p);
	});
}

void ShuttleBeaconImplementation::landShuttle(CreatureObject* player) {
	if (shuttle == NULL)
		return;

	ManagedReference<CreatureObject*> strongShuttle = shuttle.get();

	if (strongShuttle == NULL)
		return;

	ManagedReference<ShuttleBeacon*> tempBeacon = _this.getReferenceUnsafeStaticCast();

	if (tempBeacon == NULL)
		return;

	readyToTakeOff = false;

	if (shuttleType == 0 || shuttleType == 2) {
		strongShuttle->setPosture(CreaturePosture::PRONE, true, true);
	} else if (shuttleType == 1) {
		strongShuttle->setPosture(CreaturePosture::UPRIGHT, true, true);
	} else if (shuttleType == 4) {
		strongShuttle->setPosture(CreaturePosture::CROUCHED, true, true);
	} else {
		return;
	}

	player->sendSystemMessage("@event_perk:shuttle_is_landing"); // A shuttle could not be called.

	SCHEDULE_TASK_1(tempBeacon, 40000, {

		Locker locker(tempBeacon_p);
		tempBeacon_p->setReadyToTakeOff(true);
	});
}

void ShuttleBeaconImplementation::takeOff(CreatureObject* player) {
	if (shuttle == NULL)
		return;

	ManagedReference<CreatureObject*> strongShuttle = shuttle.get();

	if (strongShuttle == NULL)
		return;

	if (!readyToTakeOff) {
		player->sendSystemMessage("@event_perk:shuttle_not_take_off"); // The shuttle is not yet ready for take off.
		return;
	}

	if (shuttleType == 1) {
		strongShuttle->setPosture(CreaturePosture::PRONE, true, true);
	} else {
		strongShuttle->setPosture(CreaturePosture::UPRIGHT, true, true);
	}

	shuttleStatus = 0;
	player->sendSystemMessage("@event_perk:shuttle_is_leaving"); // Transmission Recieved: Shuttle is leaving the area.
/*
	SCHEDULE_TASK_2(tempBeacon, player, 20000, {

		Locker locker(tempBeacon_p);
		tempBeacon_p->destroyShuttle(player_p);
	});
	*/
}

void ShuttleBeaconImplementation::destroyShuttle(CreatureObject* player) {
	if (shuttle == NULL)
		return;

	ManagedReference<CreatureObject*> strongShuttle = shuttle.get();

	if (strongShuttle == NULL)
		return;

	strongShuttle->destroyObjectFromWorld(true);
	strongShuttle->destroyObjectFromDatabase();

	player->sendSystemMessage("@event_perk:shuttle_next_is_ready"); // Shuttle Beacon: You may now call another shuttle.
}

bool ShuttleBeaconImplementation::canSpawnShuttle(CreatureObject* player) {
	Zone* zone = player->getZone();

	if (zone == NULL)
		return false;

	PlanetManager* planetManager = zone->getPlanetManager();

	if (planetManager == NULL)
		return false;

	if (zone->getZoneName().contains("space_"))
		return false;

	if (!isASubChildOf(player))
		return false;

	ManagedReference<SceneObject*> parent = player->getParent().get();

	if (parent != NULL && parent->isCellObject())
		return false;

	if (player->isInCombat())
		return false;

	if (player->isSwimming())
		return false;

	ManagedReference<CityRegion*> city = player->getCityRegion().get();

	if (city != NULL) {
		if (city->isClientRegion())
			return false;

		if (city->isZoningEnabled() && !city->hasZoningRights(player->getObjectID()))
			return false;
	}

	int x = player->getWorldPositionX();
	int y = player->getWorldPositionY();
	int nearbyPerks = 0;

	CloseObjectsVector* vec = (CloseObjectsVector*) player->getCloseObjects();

	if (vec == NULL)
		return false;

	SortedVector<QuadTreeEntry*> closeObjects;
	vec->safeCopyTo(closeObjects);

	for (int i = 0; i < closeObjects.size(); ++i) {
		SceneObject* obj = cast<SceneObject*>(closeObjects.get(i));

		if (obj == NULL)
			continue;

		SharedObjectTemplate* objectTemplate = obj->getObjectTemplate();

		if (objectTemplate == NULL)
			continue;

		float radius = objectTemplate->getNoBuildRadius();

		if (obj->isLairObject() && player->isInRange(obj, radius))
			return false;

		if (obj->isCampStructure() && player->isInRange(obj, radius))
			return false;

		if (radius > 0 && player->isInRange(obj, radius))
			return false;

		if (objectTemplate->isSharedStructureObjectTemplate()) {
			if (StructureManager::instance()->isInStructureFootprint(cast<StructureObject*>(obj), x, y, 0))
				return false;
		}

		if (obj->isEventPerk() && player->isInRange(obj, 32) && ++nearbyPerks > 2)
			return false;
	}

	SortedVector<ManagedReference<ActiveArea* > > activeAreas;
	zone->getInRangeActiveAreas(x, y, &activeAreas, true);

	for (int i = 0; i < activeAreas.size(); ++i) {
		ActiveArea* area = activeAreas.get(i);

		if (area->isNoBuildArea())
			return false;
	}

	if (planetManager->isInRangeWithPoi(x, y, 100))
		return false;

	return true;
}

void ShuttleBeaconImplementation::destroyObjectFromDatabase(bool destroyContainedObjects) {
	ManagedReference<CreatureObject*> strongShuttle = shuttle.get();

	if (strongShuttle != NULL) {
		Locker locker(strongShuttle);
		strongShuttle->destroyObjectFromWorld(true);
		strongShuttle->destroyObjectFromDatabase();
	}

	ManagedReference<CreatureObject*> strongOwner = owner.get();

	if (strongOwner != NULL) {
		Locker clocker(strongOwner, _this.getReferenceUnsafeStaticCast());

		PlayerObject* ghost = strongOwner->getPlayerObject();

		if (ghost != NULL) {
			ghost->removeEventPerk(_this.getReferenceUnsafeStaticCast());
		}
	}

	TangibleObjectImplementation::destroyObjectFromDatabase(destroyContainedObjects);
}

void ShuttleBeaconImplementation::activateRemoveEvent(bool immediate) {
	if (removeEventPerkItemTask == NULL) {
		removeEventPerkItemTask = new RemoveEventPerkItemTask(_this.getReferenceUnsafeStaticCast());

		Time currentTime;
		uint64 timeDelta = currentTime.getMiliTime() - purchaseTime.getMiliTime();

		if (timeDelta >= EventPerkDeedTemplate::TIME_TO_LIVE || immediate) {
			removeEventPerkItemTask->execute();
		} else {
			removeEventPerkItemTask->schedule(EventPerkDeedTemplate::TIME_TO_LIVE - timeDelta);
		}
	} else if (immediate) {
		if (removeEventPerkItemTask->isScheduled()) {
			removeEventPerkItemTask->reschedule(1);
		} else {
			removeEventPerkItemTask->execute();
		}
	}
}
