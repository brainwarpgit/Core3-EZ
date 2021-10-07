/*
 * ActiveAreaImplementation.cpp
 *
 *  Created on: 02/06/2010
 *      Author: victor
 */

#include "server/zone/objects/area/ActiveArea.h"
#include "events/ActiveAreaEvent.h"
#include "server/zone/objects/area/areashapes/AreaShape.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/area/SpawnArea.h"

bool ActiveAreaImplementation::containsPoint(float px, float py, uint64 cellid) const {
	if (cellObjectID != 0 && cellObjectID != cellid)
		return false;

	return containsPoint(px, py);
}

bool ActiveAreaImplementation::containsPoint(float px, float py) const {
	if (areaShape == nullptr) {
		float dx = getPositionX() - px;
		float dy = getPositionY() - py;

		float squaredLength = dx * dx + dy * dy;
		return squaredLength <= (radius * radius);
	}

	return areaShape->containsPoint(px, py);
}

void ActiveAreaImplementation::enqueueEnterEvent(SceneObject* obj) {
#ifdef WITH_STM
	notifyEnter(obj);
#else
	Reference<Task*> task = new ActiveAreaEvent(_this.getReferenceUnsafeStaticCast(), obj, ActiveAreaEvent::ENTEREVENT);
	obj->executeOrderedTask(task);

#endif
}

void ActiveAreaImplementation::enqueueExitEvent(SceneObject* obj) {
#ifdef WITH_STM
	notifyExit(obj);
#else
	Reference<Task*> task = new ActiveAreaEvent(_this.getReferenceUnsafeStaticCast(), obj, ActiveAreaEvent::EXITEVENT);
	obj->executeOrderedTask(task);

#endif
}

void ActiveAreaImplementation::notifyEnter(SceneObject* obj) {
	if (cellObjectID == 0 || cellObjectID == obj->getParentID())
		notifyObservers(ObserverEventType::ENTEREDAREA, obj);

	if (obj->isPlayerCreature() && attachedScenery.size() > 0) {
		ManagedReference<SceneObject*> sceno = obj;
		Vector<ManagedReference<SceneObject* > > scene = attachedScenery;

		CreatureObject* creo = obj->asCreatureObject();

		if (creo != nullptr) {
			PlayerObject* ghost = creo->getPlayerObject();

			if (ghost != nullptr && ghost->getCharacterBitmask() & PlayerObject::LFG) {
				StringBuffer enterMsg;
				String name = getObjectNameStringIdName();
				enterMsg << "?Entering Active Area:  " << name << "  -  ";

				String shapeString = areaShape == nullptr ? " City; " : areaShape->isRectangularAreaShape() ? " rectangle;  " : areaShape->isCircularAreaShape() ? " circle;  "
					: areaShape->isRingAreaShape() ? " ring;  " : " none;  ";

				enterMsg << " Area shape = " << shapeString;
				enterMsg << " Radius = " << getRadius() << ";  ";

				Vector3 playerCoords = creo->getWorldPosition();
				enterMsg << " Player Coords: X = " << playerCoords.getX() <<  "  Z = " << playerCoords.getZ() <<"  Y = " << playerCoords.getY() << ";  ";

				Vector3 coords = getWorldPosition();
				enterMsg << " Area Coords - X = " << coords.getX() <<  "  Z = " << coords.getZ() <<"  Y = " << coords.getY() << ";  ";

				if (!isNoSpawnArea()) {
					ManagedReference<ActiveArea*> area = _this.getReferenceUnsafeStaticCast();

					if (area != nullptr) {
						SpawnArea* spawnArea = area.castTo<SpawnArea*>();

						if (spawnArea != nullptr) {
							int tier = spawnArea->getTier();

							enterMsg << " Spawn Area:  Tier - " << tier << ";  ";

						}
					}
				}

				creo->sendSystemMessage(enterMsg.toString());
			}
		}


		Core::getTaskManager()->executeTask([=] () {
			for (int i = 0; i < scene.size(); i++) {
				SceneObject* scenery = scene.get(i);
				Locker locker(scenery);

				scenery->sendTo(sceno, true);
			}
		}, "SendSceneryLambda");
	}
}

void ActiveAreaImplementation::notifyExit(SceneObject* obj) {
	if (cellObjectID == 0 || cellObjectID != obj->getParentID())
		notifyObservers(ObserverEventType::EXITEDAREA, obj);

	if (obj->isPlayerCreature() && attachedScenery.size() > 0) {
		ManagedReference<SceneObject*> sceno = obj;
		Vector<ManagedReference<SceneObject* > > scene = attachedScenery;

		CreatureObject* creo = obj->asCreatureObject();
		if (creo != nullptr) {
			PlayerObject* ghost = creo->getPlayerObject();

			if (ghost != nullptr && ghost->getCharacterBitmask() & PlayerObject::LFG) {
				StringBuffer exitMsg;
				String name = getObjectNameStringIdName();
				exitMsg << "?Exiting Active Area:  " << name << "  -  ";

				String shapeString = areaShape == nullptr ? " City; " : areaShape->isRectangularAreaShape() ? " rectangle;  " : areaShape->isCircularAreaShape() ? " circle;  "
					: areaShape->isRingAreaShape() ? " ring;  " : " none;  ";

				exitMsg << " Area shape = " << shapeString;
				exitMsg << " Radius = " << getRadius() << ";  ";

				Vector3 playerCoords = creo->getWorldPosition();
				exitMsg << " Player Coords: X = " << playerCoords.getX() <<  "  Z = " << playerCoords.getZ() <<"  Y = " << playerCoords.getY() << ";  ";

				Vector3 coords = getWorldPosition();
				exitMsg << " Area Coords - X = " << coords.getX() <<  "  Z = " << coords.getZ() <<"  Y = " << coords.getY() << ";  ";

				if (!isNoSpawnArea()) {
					ManagedReference<ActiveArea*> area = _this.getReferenceUnsafeStaticCast();

					if (area != nullptr) {
						SpawnArea* spawnArea = area.castTo<SpawnArea*>();

						if (spawnArea != nullptr) {
							int tier = spawnArea->getTier();

							exitMsg << " Spawn Area:  Tier - " << tier << ";  ";
						}
					}
				}

				creo->sendSystemMessage(exitMsg.toString());
			}
		}


		Core::getTaskManager()->executeTask([=] () {
			for (int i = 0; i < scene.size(); i++) {
				SceneObject* scenery = scene.get(i);
				Locker locker(scenery);

				scenery->sendDestroyTo(sceno);
			}
		}, "SendDestroySceneryLambda");
	}
}

void ActiveAreaImplementation::setZone(Zone* zone) {
	this->zone = zone;
}

bool ActiveAreaImplementation::intersectsWith(ActiveArea* area) const {
	if (areaShape == nullptr) {
		return false;
	}

	return areaShape->intersectsWith(area->getAreaShape());
}

void ActiveAreaImplementation::initializeChildObject(SceneObject* controllerObject) {
	ManagedReference<SceneObject*> objectParent = controllerObject->getParent().get();

	if (objectParent != nullptr && objectParent->isCellObject()) {
		setCellObjectID(objectParent->getObjectID());
	}
}
