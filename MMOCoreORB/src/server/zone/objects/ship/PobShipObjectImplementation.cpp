/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#include "server/zone/objects/ship/PobShipObject.h"
#include "server/zone/objects/ship/ShipObject.h"
#include "templates/tangible/SharedShipObjectTemplate.h"
#include "server/zone/objects/ship/PlayerLaunchPoints.h"
#include "server/zone/objects/ship/DamageSparkLocations.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/guild/GuildObject.h"
#include "server/zone/objects/tangible/terminal/Terminal.h"

void PobShipObjectImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	ShipObjectImplementation::loadTemplateData(templateData);

	SharedShipObjectTemplate* ssot = dynamic_cast<SharedShipObjectTemplate*>(templateData);

	if (ssot != nullptr) {
		const auto sparkLocs = ssot->getSparkLocations();

		for (int i = 0; i < sparkLocs.size(); i++) {
			String cellName = sparkLocs.elementAt(i).getKey();
			Vector<Vector3> locations = sparkLocs.elementAt(i).getValue();

			for (int k = 0; k < locations.size(); k++) {
				Vector3 point(locations.get(k));
				sparkLocations.addSparkLocation(cellName, point);
			}
		}

		const auto launchLocs = ssot->getLaunchLocations();

		for (int i = 0; i < launchLocs.size(); i++) {
			String cellName = launchLocs.elementAt(i).getKey();
			Vector<Vector3> locations = launchLocs.elementAt(i).getValue();

			for (int k = 0; k < locations.size(); k++) {
				Vector3 point(locations.get(k));
				launchPoints.addLaunchPoint(cellName, point);
			}
		}
	}
}

void PobShipObjectImplementation::createChildObjects() {
	auto zoneServer = getZoneServer();

	if (zoneServer == nullptr) {
		error() << "Failed to create child objects for ship: " << getDisplayedName() << " ID: " << getObjectID();
		return;
	}

	auto layout = getObjectTemplate()->getPortalLayout();

	if (layout == nullptr)
		return;

	//info(true) << "creating cells for PoB Ship: " << getDisplayedName();

	for (int i = 0; i < totalCellNumber; ++i) {
		// Skip cell from r0
		if (i == 0)
			continue;

		auto newCellObject = zoneServer->createObject(0xAD431713, getPersistenceLevel());

		if (newCellObject == nullptr || !newCellObject->isCellObject()) {
			error() << "could not create cell";
			continue;
		}

		auto newCell = static_cast<CellObject*>(newCellObject.get());

		if (newCell == nullptr)
			continue;

		//info(true) << "Cell #" << (i) << " with name: " << layout->getCellProperty(i)->getName();

		Locker clocker(newCell, asShipObject());

		if (!transferObject(newCell, -1, false, true)) {
			error() << "could not add cell to ship";
			continue;
		}

		newCell->setCellNumber(i);

		cellNameMap.put(layout->getCellProperty(i)->getName(), newCell);
		cells.put(i, newCell);

		ContainerPermissions* permissions = newCell->getContainerPermissionsForUpdate();

		if (permissions != nullptr) {
			permissions->setOwner(getObjectID());
			permissions->setInheritPermissionsFromParent(false);
			permissions->setDefaultDenyPermission(ContainerPermissions::MOVECONTAINER);
			permissions->setDenyPermission("owner", ContainerPermissions::MOVECONTAINER);
		}
	}

	for (int i = 0; i < templateObject->getChildObjectsSize(); ++i) {
		const ChildObject* child = templateObject->getChildObject(i);

		if (child == nullptr)
			continue;

		const String childTemplate = child->getTemplateFile();
		uint32 childHash = childTemplate.hashCode();

		ManagedReference<SceneObject *> obj = zoneServer->createObject(childHash, getPersistenceLevel());

		if (obj == nullptr)
			continue;

		Locker objLocker(obj, asSceneObject());

		Vector3 childPosition = child->getPosition();
		childObjects.put(obj);
		obj->initializePosition(childPosition.getX(), childPosition.getZ(), childPosition.getY());
		obj->setDirection(child->getDirection());

		int totalCells = getTotalCellNumber();

		try {
			if (totalCells >= child->getCellId()) {
				// info(true) << getDisplayedName() << " -- childObject Inserting into cell #" << child->getCellId() << " Object Type: " << obj->getGameObjectType();

				ManagedReference<CellObject*> cellObject = getCell(child->getCellId() - 1);

				if (cellObject != nullptr) {
					if (!cellObject->transferObject(obj, child->getContainmentType(), true)) {
						obj->destroyObjectFromDatabase(true);
						continue;
					} else {
						uint32 gameObjectType = obj->getGameObjectType();

						if (gameObjectType == SceneObjectType::PILOTCHAIR) {
							setPilotChair(obj);
						} else if (gameObjectType == SceneObjectType::SHIPPERMISSIONS) {
							Terminal* terminalChild = obj.castTo<Terminal*>();

							if (terminalChild != nullptr)
								terminalChild->setControlledObject(asPobShipObject());
						} else if (childTemplate.contains("alarm_interior")) {
							plasmaAlarms.add(obj->getObjectID());
						}
					}
				} else {
					error("nullptr CELL OBJECT");
					obj->destroyObjectFromDatabase(true);
					continue;
				}
			}
		} catch (Exception &e) {
			error("unreported exception caught in void SceneObjectImplementation::createChildObjects()!");
			e.printStackTrace();
		}
	}

	updateToDatabase();
}

void PobShipObjectImplementation::sendContainerObjectsTo(SceneObject* player, bool forceLoad) {
	auto creo = player->asCreatureObject();

	if (creo == nullptr) {
		return;
	}

	for (int i = 0; i < containerObjects.size(); ++i) {
		auto object = containerObjects.get(i);

		if (object == nullptr) {
			continue;
		}

		object->sendTo(creo, true);
	}

	for (int i = 0; i < cells.size(); ++i) {
		auto cell = cells.get(i);
		if (cell == nullptr) {
			continue;
		}

		auto perms = cell->getContainerPermissions();
		if (perms == nullptr) {
			continue;
		}

		cell->sendPermissionsTo(player->asCreatureObject(), true);

		for (int j = 0; j < cell->getContainerObjectsSize(); ++j) {
			auto object = cell->getContainerObject(j);
			if (object == nullptr) {
				continue;
			}

			object->sendTo(creo, true);
		}
	}
}

bool PobShipObjectImplementation::isOnAdminList(CreatureObject* player) const {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost != nullptr && ghost->isPrivileged())
		return true;
	else if (shipPermissionList.isOnPermissionList("ADMIN", player->getObjectID()))
		return true;
	else {
		ManagedReference<GuildObject*> guild = player->getGuildObject().get();

		if (guild != nullptr && shipPermissionList.isOnPermissionList("ADMIN", guild->getObjectID()))
			return true;
	}

	return false;
}

void PobShipObjectImplementation::togglePlasmaAlarms() {
	auto zoneServer = getZoneServer();

	if (zoneServer == nullptr)
		return;

	for (int i = 0; i < plasmaAlarms.size(); ++i) {
		uint64 alarmID = plasmaAlarms.get(i);

		ManagedReference<SceneObject*> alarm = zoneServer->getObject(alarmID).get();

		if (alarm == nullptr || !alarm->isTangibleObject()) {
			continue;
		}

		TangibleObject* alarmTano = alarm->asTangibleObject();

		if (alarmTano == nullptr)
			continue;

		Locker alocker(alarm, _this.getReferenceUnsafeStaticCast());

		if (alarmTano->getOptionsBitmask() & OptionBitmask::ACTIVATED) {
			alarmTano->setOptionsBitmask(OptionBitmask::DISABLED);
		} else {
			alarmTano->setOptionsBitmask(OptionBitmask::NONE);
			alarmTano->setMaxCondition(0);
		}
	}
}

PobShipObject* PobShipObject::asPobShipObject() {
	return this;
}

PobShipObject* PobShipObjectImplementation::asPobShipObject() {
	return _this.getReferenceUnsafeStaticCast();
}

bool PobShipObject::isPobShipObject() {
	return true;
}

bool PobShipObjectImplementation::isPobShipObject() {
	return true;
}

String PobShipObjectImplementation::getRandomLaunchCell() {
	String cell = launchPoints.getRandomCell();
	return cell;
}

Vector3 PobShipObjectImplementation::getLaunchPointInCell(const String& cellName) {
	auto locations = launchPoints.getSpawnLocations(cellName);
	int random = System::random(locations.size() - 1);
	Vector3 location(locations.get(random));

	return location;
}
