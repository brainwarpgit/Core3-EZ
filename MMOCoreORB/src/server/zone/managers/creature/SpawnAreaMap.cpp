/*
 * SpawnAreaMap.cpp
 *
 *  Created on: 12/08/2011
 *      Author: TheAnswer
 */

#include "SpawnAreaMap.h"
#include "server/zone/Zone.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/objects/creature/AiAgent.h"
#include "server/conf/ConfigManager.h"
#include "server/zone/objects/area/areashapes/CircularAreaShape.h"
#include "server/zone/objects/area/areashapes/RectangularAreaShape.h"

void SpawnAreaMap::loadMap(Zone* z) {
	zone = z;
	String planetName = zone->getZoneName();

	setLoggingName("SpawnAreaMap " + planetName);

	lua->init();

	try {
		lua->runFile("scripts/managers/spawn_manager/" + planetName + ".lua");

		LuaObject obj = lua->getGlobalObject(planetName + "_regions");

		if (obj.isValidTable()) {
			lua_State* s = obj.getLuaState();

			for (int i = 1; i <= obj.getTableSize(); ++i) {
				lua_rawgeti(s, -1, i);
				LuaObject areaObj(s);

				if (areaObj.isValidTable()) {
					readAreaObject(areaObj);
				}

				areaObj.pop();
			}
		}

		obj.pop();

		for (int i = 0; i < size(); ++i) {
			SpawnArea* area = get(i);

			for (int j = 0; j < noSpawnAreas.size(); ++j) {
				SpawnArea* notHere = noSpawnAreas.get(j);

				if (area->intersectsWith(notHere)) {
					area->addNoSpawnArea(notHere);
				}
			}
		}

		loadStaticSpawns();
	} catch (Exception& e) {
		error(e.getMessage());
	}

	lua->deinit();

	delete lua;
	lua = NULL;
}

void SpawnAreaMap::loadStaticSpawns() {
	String planetName = zone->getZoneName();

	LuaObject obj = lua->getGlobalObject(planetName + "_static_spawns");

	if (!obj.isValidTable()) {
		obj.pop();
		return;
	}

	int count = 0;
	int max = obj.getTableSize();

	for (int i = 1; i <= obj.getTableSize(); ++i) {
		lua_rawgeti(obj.getLuaState(), -1, i);
		LuaObject spawn(obj.getLuaState());

		if (spawn.isValidTable()) {
			CreatureManager* creatureManager = zone->getCreatureManager();

			String name = obj.getStringAt(1);
			uint32 respawn = obj.getIntAt(2);
			float x = obj.getFloatAt(3);
			float z = obj.getFloatAt(4);
			float y = obj.getFloatAt(5);
			float heading = obj.getFloatAt(6);
			uint64 parentID = obj.getLongAt(7);
			String moodString;
			UnicodeString customName;

			if (obj.getTableSize() > 7)
				moodString = obj.getStringAt(8);

			if (obj.getTableSize() > 8)
				customName = obj.getStringAt(9);

			if (parentID == 0)
				z = zone->getHeight(x, y);

			ManagedReference<CreatureObject*> creatureObject = creatureManager->spawnCreature(name.hashCode(), 0, x, z, y, parentID);

			if (creatureObject != NULL) {
				creatureObject->setDirection(Math::deg2rad(heading));

				if (!moodString.isEmpty()) {
					creatureObject->setMoodString(moodString);

					//TODO: remove after fixing commoners
					if (moodString == "conversation" || moodString == "calm") {
						creatureObject->setPvpStatusBitmask(0);
						creatureObject->setCloseObjects(NULL);
					}
				}

				if (!customName.isEmpty())
					creatureObject->setCustomObjectName(customName, true);

				if (creatureObject->isAiAgent()) {
					AiAgent* ai = cast<AiAgent*>( creatureObject.get());
					ai->setRespawnTimer(respawn);
				}

				if (name.contains("trainer_")) {
					Vector3 coords(creatureObject.get()->getWorldPositionX(), creatureObject.get()->getWorldPositionY(), 0);
					trainerObjects.add(coords);
				}
			} else {
				StringBuffer msg;
				msg << "could not spawn mobile: " + name;
				error(msg.toString());
			}
		}

		spawn.pop();

		if (ConfigManager::instance()->isProgressMonitorActivated())
			printf("\r\tLoading static spawns: [%d] / [%d]\t", ++count, max);
	}

	obj.pop();


	//--{"mobile", x, z, y, degrees heading, parentID}



	//spawnCreature(uint32 templateCRC, uint32 objectCRC, float x, float z, float y, uint64 parentID)
}

void SpawnAreaMap::readAreaObject(LuaObject& areaObj) {
	String name = areaObj.getStringAt(1);
	float x = areaObj.getFloatAt(2);
	float y = areaObj.getFloatAt(3);
	int tier = areaObj.getIntAt(5);
	int constant = areaObj.getIntAt(6);

	float radius = 0;
	float width = 0;
	float height = 0;

    LuaObject areaShapeObject = areaObj.getObjectAt(4);
    if (areaShapeObject.isValidTable()) {
        if (areaShapeObject.getIntAt(1) == 1) {
            radius = areaShapeObject.getFloatAt(2);
        } else if (areaShapeObject.getIntAt(1) == 2) {
            width = areaShapeObject.getFloatAt(2);
            height = areaShapeObject.getFloatAt(3);
        }
        areaShapeObject.pop();
    } else {
    	areaShapeObject.pop();
        radius = areaObj.getFloatAt(4);
        width = 0;
        height = 0;
    }

	if (radius == 0 && width == 0 && height == 0)
		return;

	uint32 crc = 0;

	if (tier & STATICSPAWNAREA) {
		crc = String("object/static_spawn_area.iff").hashCode();
	} else if (tier & DYNAMICSPAWNAREA) {
		crc = String("object/dynamic_spawn_area.iff").hashCode();
	} else if (tier & LAIRSPAWNAREA) {
		crc = String("object/lair_spawn_area.iff").hashCode();
	} else {
		error("Unknown region tier " + String::valueOf(tier));
		crc = String("object/dynamic_spawn_area.iff").hashCode();
	}

	ManagedReference<SpawnArea*> area = dynamic_cast<SpawnArea*>(ObjectManager::instance()->createObject(crc, 0, "spawnareas"));
	if (area == NULL)
		return;

	StringId nameID(zone->getZoneName() + "_region_names", name);

	area->setObjectName(nameID);

	if (height > 0 && width > 0) {
		ManagedReference<RectangularAreaShape*> rectangularAreaShape = new RectangularAreaShape();
		rectangularAreaShape->setAreaCenter(x, y);
		rectangularAreaShape->setDimensions(height, width);
		area->setAreaShape(rectangularAreaShape);
	} else if (radius > 0) {
		ManagedReference<CircularAreaShape*> circularAreaShape = new CircularAreaShape();
		circularAreaShape->setAreaCenter(x, y);
		circularAreaShape->setRadius(radius);
		area->setAreaShape(circularAreaShape);
	} else {
		ManagedReference<CircularAreaShape*> circularAreaShape = new CircularAreaShape();
		circularAreaShape->setAreaCenter(x, y);
		circularAreaShape->setRadius(zone->getBoundingRadius());
		area->setAreaShape(circularAreaShape);
	}

	area->setTier(tier);

	area->setSpawnConstant(constant);

	for (int j = 7; j <= areaObj.getTableSize(); ++j)
		area->addTemplate(areaObj.getStringAt(j).hashCode());

	if ((radius != -1) && !(tier & (WORLDSPAWNAREA | REBELSPAWNAREA | IMPERIALSPAWNAREA | NEUTRALSPAWNAREA | NONFACTIONSPAWNAREA))) {
		zone->transferObject(area, -1, true);
	} else {
		if (tier & NEUTRALSPAWNAREA) {
			factionalNeutralMissionSpawnAreas.add(area);
		} else if (tier & REBELSPAWNAREA) {
			factionalRebelMissionSpawnAreas.add(area);
		} else if (tier & IMPERIALSPAWNAREA) {
			factionalImperialMissionSpawnAreas.add(area);
		} else if (tier & WORLDSPAWNAREA) {
			worldSpawnAreas.add(area);
		} else if (tier & NONFACTIONSPAWNAREA) {
			nonfactionalMissionSpawnAreas.add(area);
		}

		area->setZone(zone);
	}

	area->updateToDatabase();

	put(nameID.getStringID().hashCode(), area);

	if (tier & NOSPAWNAREA) {
		noSpawnAreas.add(area);
	}

	if (tier & NOBUILDZONEAREA) {
		area->setNoBuildArea(true);
	}

	if (area->isStaticArea() && (tier & STATICSPAWNAREA)) {
		StaticSpawnArea* staticArea = cast<StaticSpawnArea*>(area.get());
		staticArea->spawnCreatures();
	}
	if (area->isDynamicArea() && (tier & DYNAMICSPAWNAREA)) {
		DynamicSpawnArea* dynamicArea = cast<DynamicSpawnArea*>(area.get());
		dynamicArea->addSpawnTask();
	}
}

Vector3 SpawnAreaMap::getRandomJediTrainer() {
	uint32 size = trainerObjects.size();
	return trainerObjects.get(System::random(size - 1));
}
