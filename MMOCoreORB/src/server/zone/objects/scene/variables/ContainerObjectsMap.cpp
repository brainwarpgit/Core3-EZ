/*
 * ContainerObjectsMap.cpp
 *
 *  Created on: 13/10/2012
 *      Author: victor
 */

#include "ContainerObjectsMap.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/scene/UnloadContainerTask.h"


ContainerObjectsMap::ContainerObjectsMap() {
	operationMode = NORMAL_LOAD;
	containerObjects.setNoDuplicateInsertPlan();

	oids = NULL;
	unloadTask = NULL;
	container = NULL;
}

ContainerObjectsMap::ContainerObjectsMap(const ContainerObjectsMap& c) : loadMutex() {
	operationMode = NORMAL_LOAD;
	containerObjects.setNoDuplicateInsertPlan();

	oids = NULL;

	copyData(c);
}

ContainerObjectsMap::~ContainerObjectsMap() {
	if (oids != NULL) {
		delete oids;
		oids = NULL;
	}

	if (unloadTask != NULL) {
		if (Core::getTaskManager())
			unloadTask->cancel();

		unloadTask = NULL;
	}
}

void ContainerObjectsMap::copyData(const ContainerObjectsMap& c) {
	operationMode = c.operationMode;
	containerObjects = c.containerObjects;
	lastAccess = c.lastAccess;

	if (c.oids == NULL) {
		if (oids != NULL)
			delete oids;

		oids = NULL;
	} else {
		oids = new VectorMap<uint64, uint64>(*c.oids);
	}

	unloadTask = NULL;
	container = NULL;
}

ContainerObjectsMap& ContainerObjectsMap::operator=(const ContainerObjectsMap& c) {
	if (this == &c)
		return *this;

	copyData(c);

	loadMutex = c.loadMutex;

	return *this;
}

void ContainerObjectsMap::loadObjects() {
	lastAccess.updateToCurrentTime();

	if (oids == NULL)
		return;

	Locker locker(&loadMutex);

	WMB();

	if (oids == NULL)
		return;

	auto parent = container.get();

	for (int i = 0; i < oids->size(); ++i) {
		uint64 oid = oids->elementAt(i).getKey();

		Reference<SceneObject*> object = Core::getObjectBroker()->lookUp(oid).castTo<SceneObject*>();

		if (object != NULL) {
			containerObjects.put(oid, object);

			//parent->broadcastObject(object, true);
			//parent->broadcastMessage(object->link(parent->getObjectID(), object->getContainmentType()), true);
		}
	}

	delete oids;
	oids = NULL;

	ManagedReference<SceneObject*> sceno = container.get();

	if (sceno != NULL)
		sceno->onContainerLoaded();

	scheduleContainerUnload();
}

void ContainerObjectsMap::scheduleContainerUnload() {
	uint64 delay = 1800000 + System::random(1800000); // 30 - 60 minutes

	if (unloadTask != NULL) {
		if (unloadTask->isScheduled()) {
			unloadTask->reschedule(delay);
		} else {
			unloadTask->schedule(delay);
		}
	} else {
		unloadTask = new UnloadContainerTask(container.get());
		unloadTask->schedule(delay);
	}
}

void ContainerObjectsMap::unloadObjects() {
	Locker locker(&loadMutex);

	auto vector = new VectorMap<uint64, uint64>();

	auto parent = container.get();
	auto zone = parent->getZone();

	Vector<ManagedReference<SceneObject*> > containerCopy;

	for (int i = 0; i < containerObjects.size(); i++) {
		SceneObject* obj = containerObjects.get(i);

		if (obj != NULL) {
			uint64 oid = obj->getObjectID();
			vector->put(oid, oid);
			containerCopy.add(obj);
		}
	}

	if (!oids.compareAndSet(NULL, vector)) {
		delete vector;
	}

	containerObjects.removeAll();

	unloadTask = NULL;

	locker.release();

	for (int i = 0; i < containerCopy.size(); i++) {
		SceneObject* obj = containerCopy.get(i);

		if (obj != NULL) {
			Locker olocker(obj);
			parent->broadcastDestroy(obj, true);
			obj->removeObjectFromZone(zone, parent);
		}
	}
}

void ContainerObjectsMap::notifyLoadFromDatabase() {

}

bool ContainerObjectsMap::toBinaryStream(ObjectOutputStream* stream) {
	Locker locker(&loadMutex);

	if (oids != NULL)
		return oids->toBinaryStream(stream);
	else
		return containerObjects.toBinaryStream(stream);
}

bool ContainerObjectsMap::parseFromBinaryStream(ObjectInputStream* stream) {
	switch (operationMode) {
	case NORMAL_LOAD:
		return containerObjects.parseFromBinaryStream(stream);
	case DELAYED_LOAD:
		if (oids == NULL) {
			auto vector = new VectorMap<uint64, uint64>();
			bool res = vector->parseFromBinaryStream(stream);

			if (!oids.compareAndSet(NULL, vector)) {
				delete vector;
			}

			return true;
		}
	default:
		return containerObjects.parseFromBinaryStream(stream);
	}

	return false;
}

VectorMap<uint64, ManagedReference<SceneObject*> >* ContainerObjectsMap::getContainerObjects() {
	loadObjects();

	return &containerObjects;
}

ManagedReference<SceneObject*> ContainerObjectsMap::get(int index) {
	loadObjects();

	return containerObjects.get(index);
}

ManagedReference<SceneObject*> ContainerObjectsMap::get(uint64 oid) {
	loadObjects();

	return containerObjects.get(oid);
}

void ContainerObjectsMap::put(uint64 oid, SceneObject* object) {
	loadObjects();

	containerObjects.put(oid, object);
}

void ContainerObjectsMap::removeElementAt(int index) {
	Locker locker(&loadMutex);

	if (oids != NULL)
		oids->removeElementAt(index);
	else
		containerObjects.removeElementAt(index);
}

int ContainerObjectsMap::size() {
	loadObjects();

	return containerObjects.size();

	/*
	Locker locker(&loadMutex);

	if (oids != NULL)
		return oids->size();
	else
		return containerObjects.size();

		*/
}

bool ContainerObjectsMap::contains(uint64 oid) {
	Locker locker(&loadMutex);

	if (oids != NULL)
		return oids->contains(oid);
	else
		return containerObjects.contains(oid);
}

void ContainerObjectsMap::removeAll() {
	Locker locker(&loadMutex);

	if (oids != NULL)
		oids->removeAll();
	else
		containerObjects.removeAll();
}

void ContainerObjectsMap::drop(uint64 oid) {
	Locker locker(&loadMutex);

	if (oids != NULL)
		oids->drop(oid);
	else
		containerObjects.drop(oid);
}

