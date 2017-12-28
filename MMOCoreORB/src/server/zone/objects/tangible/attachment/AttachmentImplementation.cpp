/*
 * AttachmentImplementation.cpp
 *
 *  Created on: Mar 10, 2011
 *      Author: polonel
 */

#include <math.h>

#include "engine/core/ManagedReference.h"
#include "server/zone/ZoneProcessServer.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/loot/LootManager.h"
#include "server/zone/objects/manufactureschematic/craftingvalues/CraftingValues.h"
#include "server/zone/objects/scene/SceneObjectType.h"
#include "server/zone/objects/tangible/TangibleObject.h"
#include "server/zone/objects/tangible/attachment/Attachment.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "system/lang/Math.h"
#include "system/lang/String.h"
#include "system/lang/StringBuffer.h"
#include "system/lang/System.h"
#include "system/util/HashTable.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
class CreatureObject;
}  // namespace creature
}  // namespace objects
}  // namespace zone
}  // namespace server

void AttachmentImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	setLoggingName("AttachmentObject");

}

void AttachmentImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	int level = values->getMaxValue("creatureLevel");
	int roll = System::random(100);
	int modCount = 1;

	if(roll > 99)
		modCount += 2;

	if(roll < 5)
		modCount += 1;

	for(int i = 0; i < modCount; ++i) {
		//Mods can't be lower than -1 or greater than 25
		int max = (int) Math::max(-1.f, Math::min(25.f, (float) round(0.1f * level + 3)));
		int min = (int) Math::max(-1.f, Math::min(25.f, (float) round(0.075f * level - 1)));

		int mod = System::random(max - min) + min;

		if(mod == 0)
			mod = 1;

		String modName = server->getZoneServer()->getLootManager()->getRandomLootableMod(gameObjectType);

		skillModMap.put(modName, mod);
	}
}

void AttachmentImplementation::initializeMembers() {
	if (gameObjectType == SceneObjectType::CLOTHINGATTACHMENT) {
		setOptionsBitmask(32, true);
		attachmentType = CLOTHINGTYPE;

	} else if (gameObjectType == SceneObjectType::ARMORATTACHMENT) {
		setOptionsBitmask(32, true);
		attachmentType = ARMORTYPE;

	}

}

void AttachmentImplementation::fillAttributeList(AttributeListMessage* msg, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(msg, object);

	StringBuffer name;

	HashTableIterator<String, int> iterator = skillModMap.iterator();

	String key = "";
	int value = 0;

	for(int i = 0; i < skillModMap.size(); ++i) {

		iterator.getNextKeyAndValue(key, value);

		name << "cat_skill_mod_bonus.@stat_n:" << key;

		msg->insertAttribute(name.toString(), value);

		name.deleteAll();
	}

}
