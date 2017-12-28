#include <stddef.h>
#include <algorithm>

#include "engine/core/ManagedReference.h"
#include "engine/core/Task.h"
#include "server/chat/ChatManager.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/managers/creature/CreatureTemplateManager.h"
#include "server/zone/managers/creature/DynamicSpawnObserver.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/ai/Creature.h"
#include "server/zone/objects/creature/ai/CreatureTemplate.h"
#include "server/zone/objects/creature/events/DespawnDynamicSpawnTask.h"
#include "server/zone/objects/creature/events/RespawnCreatureTask.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "system/lang/String.h"
#include "system/lang/System.h"
#include "system/lang/ref/Reference.h"
#include "system/platform.h"
#include "system/thread/Locker.h"
#include "system/util/SynchronizedVector.h"
#include "system/util/Vector.h"
#include "system/util/VectorMap.h"
#include "templates/mobile/LairTemplate.h"
#include "templates/params/ObserverEventType.h"

namespace engine {
namespace core {
class ManagedObject;
}  // namespace core
namespace util {
class Observable;
}  // namespace util
}  // namespace engine

int DynamicSpawnObserverImplementation::notifyObserverEvent(unsigned int eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {

	if (eventType == ObserverEventType::OBJECTREMOVEDFROMZONE) {
		despawnSpawns();
		return 1;
	} else if (eventType != ObserverEventType::CREATUREDESPAWNED) {
		return 0;
	}

	Reference<AiAgent*> ai = cast<AiAgent*>(arg1);
	Reference<SceneObject*> spawn = cast<SceneObject*>(observable);

	if (ai == NULL || spawn == NULL)
		return 0;

	if (ai->getRespawnCounter() > 1) {
		spawnedCreatures.removeElement(ai.get());
		ai->setHomeObject(NULL);
		ai->resetRespawnCounter();

		if (spawnedCreatures.isEmpty()) {

			Reference<Task*> task = new DespawnDynamicSpawnTask(spawn);
			task->schedule(60000);

			return 1;
		}

		return 0;
	}

	Zone* zone = spawn->getZone();

	if (zone == NULL)
		return 0;

	int level = ai->getLevel();

	if (ai->isCreature()) {
		Creature* creature = ai.castTo<Creature*>();
		level = creature->getAdultLevel();
	}

	Reference<Task*> task = new RespawnCreatureTask(ai.get(), zone, level);
	task->schedule((60 + (level * 2)) * 1000);

	return 0;
}

void DynamicSpawnObserverImplementation::spawnInitialMobiles(SceneObject* building) {
	if (building->getZone() == NULL)
		return;

	int spawnLimitAdjustment = (difficulty - 2) / 2;

	int totalNumberToSpawn = (lairTemplate->getSpawnLimit() / 3) + spawnLimitAdjustment;
	VectorMap<String, int> objectsToSpawn; // String mobileTemplate, int number to spawn
	Vector<String>* mobiles = lairTemplate->getWeightedMobiles();
	uint32 lairTemplateCRC = getLairTemplateName().hashCode();

	if (totalNumberToSpawn < 1)
		totalNumberToSpawn = 1;

	for (int i = 0; i < totalNumberToSpawn; i++) {
		int num = System::random(mobiles->size() - 1);
		const String& mob = mobiles->get(num);

		int find = objectsToSpawn.find(mob);

		if (find != -1) {
			int& value = objectsToSpawn.elementAt(find).getValue();
			++value;
		} else {
			objectsToSpawn.put(mob, 1);
		}
	}

	for (int i = 0; i < objectsToSpawn.size(); ++i) {
		const String& templateToSpawn = objectsToSpawn.elementAt(i).getKey();
		int numberToSpawn = objectsToSpawn.elementAt(i).getValue();

		CreatureTemplate* creatureTemplate = CreatureTemplateManager::instance()->getTemplate(templateToSpawn);

		if (creatureTemplate == NULL)
			continue;

		float tamingChance = creatureTemplate->getTame();

		CreatureManager* creatureManager = building->getZone()->getCreatureManager();

		for (int j = 0; j < numberToSpawn; j++) {

			float x = building->getPositionX() + (size - System::random(size * 20) / 10.0f);
			float y = building->getPositionY() + (size - System::random(size * 20) / 10.0f);
			float z = building->getZone()->getHeight(x, y);

			ManagedReference<CreatureObject*> creo = NULL;

			if (creatureManager->checkSpawnAsBaby(tamingChance, babiesSpawned, 500)) {
				creo = creatureManager->spawnCreatureAsBaby(templateToSpawn.hashCode(), x, z, y);
				babiesSpawned++;
			}

			if (creo == NULL)
				creo = creatureManager->spawnCreatureWithAi(templateToSpawn.hashCode(), x, z, y);

			if (creo == NULL)
				continue;

			if (!creo->isAiAgent()) {
				error("spawned non player creature with template " + templateToSpawn);
			} else {
				AiAgent* ai = cast<AiAgent*>( creo.get());

				Locker clocker(ai, building);

				ai->setDespawnOnNoPlayerInRange(false);
				ai->setHomeLocation(x, z, y);
				ai->setRespawnTimer(0);
				ai->resetRespawnCounter();
				ai->setHomeObject(building);
				ai->setLairTemplateCRC(lairTemplateCRC);

				if (ai->isNonPlayerCreatureObject() && System::random(3) == 0) {
					unsigned int id = ai->getZoneServer()->getChatManager()->getRandomMoodID();
					ai->setMood(id);
				}

				spawnedCreatures.add(creo);
			}
		}
	}
}
