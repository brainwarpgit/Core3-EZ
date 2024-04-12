/*
 * ShuttleInstallationZoneComponent.cpp
 *
 * Created on: Apr 7, 2012
 *      Author: TragD
 */

#include "server/zone/objects/installation/components/ShuttleInstallationZoneComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/planet/PlanetManager.h"
#include "server/zone/objects/structure/StructureObject.h"
#include "server/zone/objects/installation/InstallationObject.h"
#include "server/zone/objects/region/CityRegion.h"

void ShuttleInstallationZoneComponent::notifyInsertToZone(SceneObject* sceneObject, Zone* zone) const {
	StructureZoneComponent::notifyInsertToZone(sceneObject, zone);

	if (zone == nullptr) {
		return;
	}

	int bootDelay = ConfigManager::instance()->getInt("Core3.ShuttleZoneComponent.BootDelay", 5 * 60 * 1000);
	Reference<SceneObject*> sceneRef = sceneObject;
	Reference<Zone*> zoneRef = zone;

	// Re-Schedule the registering of player city shuttles with the map after the shuttles have started post boot delay
	Core::getTaskManager()->scheduleTask([sceneRef, zoneRef] () {
		if (sceneRef == nullptr || zoneRef == nullptr) {
			return;
		}

		Locker lock(sceneRef);

		zoneRef->unregisterObjectWithPlanetaryMap(sceneRef);
		zoneRef->registerObjectWithPlanetaryMap(sceneRef);

	}, "UpdateShuttleportMapLambda", bootDelay);
}

void ShuttleInstallationZoneComponent::notifyRemoveFromZone(SceneObject* sceneObject) const {
	StructureZoneComponent::notifyRemoveFromZone(sceneObject);
}

void ShuttleInstallationZoneComponent::destroyObjectFromWorld(SceneObject* sceneObject, bool sendSelfDestroy) const {
	if (sceneObject->isStructureObject()) {

		StructureObject* structureObject = cast<StructureObject*>(sceneObject);
		ManagedReference<Zone*> zone = sceneObject->getZone();

		if (zone != nullptr && structureObject->isInstallationObject()) {

			ManagedReference<InstallationObject*> installationObject = cast<InstallationObject*>(structureObject);

			if (installationObject->isShuttleInstallation()) {

				ManagedReference<CityRegion*> cityRegion = structureObject->getCityRegion().get();
				ManagedReference<PlanetManager*> planetManager = zone->getPlanetManager();

				if (cityRegion != nullptr) {

					planetManager->removePlayerCityTravelPoint(cityRegion->getCityRegionName());

					Locker clocker(cityRegion, sceneObject);

					cityRegion->removeShuttleInstallation();
				}

				SortedVector < ManagedReference<SceneObject*> > *childObjects = structureObject->getChildObjects();

				ManagedReference<CreatureObject*> shuttle = nullptr;

				for (int i = 0; i < childObjects->size(); ++i) {

					if (!childObjects->get(i)->isTerminal()) {
						shuttle = cast<CreatureObject*>(childObjects->get(i).get());
						break;
					}
				}

				if (shuttle != nullptr)
					planetManager->removeShuttle(shuttle);

			}
		}
	}

	GroundZoneComponent::destroyObjectFromWorld(sceneObject, sendSelfDestroy);
}
