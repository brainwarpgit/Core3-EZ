/*
 * CreatureImplementation.cpp
 *
 *  Created on: 10/23/2010
 *      Author: Kyle
 */

#include "CreatureObject.h"
#include "Creature.h"
#include "AiAgent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/group/GroupObject.h"
#include "server/zone/objects/creature/events/DespawnCreatureTask.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/Zone.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "server/zone/objects/tangible/threat/ThreatMap.h"
#include "server/zone/managers/collision/CollisionManager.h"
#include "server/zone/managers/components/ComponentManager.h"
#include "server/zone/objects/creature/components/AiCreatureComponent.h"

//#define DEBUG

void CreatureImplementation::initializeTransientMembers() {
	milkState = CreatureManager::NOTMILKED;
	dnaState = CreatureManager::HASDNA;
	dnaSampleCount = 0;
	AiAgentImplementation::initializeTransientMembers();
	aiInterfaceComponents.add(ComponentManager::instance()->getComponent<AiCreatureComponent*>("AiCreatureComponent"));
}

void CreatureImplementation::runAway(CreatureObject* target) {
	return;


	if (target == NULL)
		return;

	setOblivious();

	if (threatMap != NULL)
		threatMap->removeAll();

	Vector3 runTrajectory(getPositionX() - target->getPositionX(), getPositionY() - target->getPositionY(), 0);
	runTrajectory = runTrajectory * (100 / runTrajectory.length());
	runTrajectory += target->getPosition();

	patrolPoints.removeAll();
	setNextPosition(runTrajectory.getX(), getZone()->getHeight(runTrajectory.getX(), runTrajectory.getY()), runTrajectory.getY(), getParent().get());

	showFlyText("npc_reaction/flytext", "afraid", 0xFF, 0, 0);


	fleeing = true;

	CombatManager::instance()->forcePeace(_this.get());

	activateMovementEvent();
}

void CreatureImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {

	if (canMilkMe(player)) {

		menuResponse->addRadialMenuItem(112, 3, "@pet/pet_menu:milk_me");

	} else if (canHarvestMe(player)) {

		menuResponse->addRadialMenuItem(112, 3, "@sui:harvest_corpse");

		if (getMeatType() != "")
			menuResponse->addRadialMenuItemToRadialID(112, 234, 3, "@sui:harvest_meat");

		if (getHideType() != "")
			menuResponse->addRadialMenuItemToRadialID(112, 235, 3, "@sui:harvest_hide");

		if (getBoneType() != "")
			menuResponse->addRadialMenuItemToRadialID(112, 236, 3, "@sui:harvest_bone");
	}

}

int CreatureImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	if (getZone() == NULL)
		return 0;

	if (!(_this.get()->isDead())) {
		if (selectedID == 112) {
			getZone()->getCreatureManager()->milk(_this.get(), player);
		}
	} else {
		if ((selectedID == 112 || selectedID == 234 || selectedID == 235 || selectedID == 236)) {

			getZone()->getCreatureManager()->harvest(_this.get(), player, selectedID);

			return 0;
		}
	}

	return AiAgentImplementation::handleObjectMenuSelect(player, selectedID);
}

void CreatureImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* player) {
	AiAgentImplementation::fillAttributeList(alm, player);

	int creaKnowledge = player->getSkillMod("creature_knowledge");

	if (getHideType().isEmpty() && getBoneType().isEmpty() && getMeatType().isEmpty()) {
		return;
	}

	if (creaKnowledge >= 5) {
		if (isAggressiveTo(player))
			alm->insertAttribute("aggro", "yes");
		else
			alm->insertAttribute("aggro", "no");
		if (isStalker())
			alm->insertAttribute("stalking", "yes");
		else
			alm->insertAttribute("stalking", "no");
	}

	if (creaKnowledge >= 10) {
		if (getTame() >= 0.0f && isBaby())
			alm->insertAttribute("tamable", "yes");
		else
			alm->insertAttribute("tamable", "no");
	}

	if (creaKnowledge >= 20) {
		if (!getHideType().isEmpty()) {
			StringBuffer hideName;
			hideName << "@obj_attr_n:" << getHideType();
			alm->insertAttribute("res_hide", hideName.toString());
		} else
			alm->insertAttribute("res_hide", "---");
		if (!getBoneType().isEmpty()) {
			StringBuffer boneName;
			boneName << "@obj_attr_n:" << getBoneType();
			alm->insertAttribute("res_bone", boneName.toString());
		} else
			alm->insertAttribute("res_bone", "---");
		if (!getMeatType().isEmpty()) {
			StringBuffer meatName;
			meatName << "@obj_attr_n:" << getMeatType();
			alm->insertAttribute("res_meat", meatName.toString());
		} else
			alm->insertAttribute("res_meat", "---");
	}

	if (creaKnowledge >= 30) {
		if (isKiller())
			alm->insertAttribute("killer", "yes");
		else
			alm->insertAttribute("killer", "no");
	}

	if (creaKnowledge >= 40) {
		alm->insertAttribute("ferocity", (int) getFerocity());
	}

	if (creaKnowledge >= 50)
		alm->insertAttribute("challenge_level", getLevel());

	//int skillNum = skillCommands.size();
	CreatureAttackMap* attackMap = getAttackMap();
	int skillNum = 0;
	if (attackMap != NULL)
		skillNum = attackMap->size();

	if (creaKnowledge >= 70) {
		String skillname = "none";
		if (skillNum >= 1)
			skillname = attackMap->getCommand(0);

		StringBuffer skillMsg;
		skillMsg << "@combat_effects:" << skillname;

		alm->insertAttribute("pet_command_18", skillMsg.toString());
	}

	if (creaKnowledge >= 80) {
		String skillname = "none";
		if (skillNum >= 2)
			skillname = attackMap->getCommand(1);

		StringBuffer skillMsg;
		skillMsg << "@combat_effects:" << skillname;

		alm->insertAttribute("pet_command_19", skillMsg.toString());
	}

	if (creaKnowledge >= 90)
		alm->insertAttribute("basetohit", getChanceHit());

	if (creaKnowledge >= 100) {
		StringBuffer damageMsg;
		damageMsg << getDamageMin() << "-" << getDamageMax();
		alm->insertAttribute("cat_wpn_damage", damageMsg.toString());
	}
}

void CreatureImplementation::scheduleDespawn() {
	if (getPendingTask("despawn") != NULL)
		return;

	Reference<DespawnCreatureTask*> despawn = new DespawnCreatureTask(_this.get());
	//despawn->schedule(300000); /// 5 minutes
	//addPendingTask("despawn", despawn, 45000); /// 45 second
	addPendingTask("despawn", despawn, 300000);
}

bool CreatureImplementation::hasOrganics() {
	return ((getHideMax() + getBoneMax() + getMeatMax()) > 0);
}

bool CreatureImplementation::hasDNA() {
	return (dnaState == CreatureManager::HASDNA);
}


bool CreatureImplementation::hasMilk() {
	return (getMilk() > 0);
}

void CreatureImplementation::addAlreadyHarvested(CreatureObject* player) {
	alreadyHarvested.put(player->getObjectID());
}

void CreatureImplementation::setMilkState(short milk) {
	milkState = milk;
}
void CreatureImplementation::setDnaState(short dna){
	dnaState = dna;
}
void CreatureImplementation::notifyDespawn(Zone* zone) {
	alreadyHarvested.removeAll();

	AiAgentImplementation::notifyDespawn(zone);
}

bool CreatureImplementation::canHarvestMe(CreatureObject* player) {

	if(!player->isInRange(_this.get(), 10.0f)
			|| player->isInCombat() || !player->hasSkill("outdoors_scout_novice")
			|| player->isDead() || player->isIncapacitated())
		return false;

	if (!hasOrganics())
		return false;

	if (player->getSkillMod("creature_harvesting") < 1)
		return false;

	if (alreadyHarvested.contains(player->getObjectID()))
		return false;

	if (dnaState == CreatureManager::DNADEATH || dnaState == CreatureManager::DNASAMPLED)
		return false;

	SceneObject* creatureInventory = getSlottedObject("inventory");

	if (creatureInventory == NULL)
		return false;

	uint64 lootOwnerID = creatureInventory->getContainerPermissions()->getOwnerID();

	if (player->getObjectID() == lootOwnerID || (player->isGrouped() && player->getGroupID() == lootOwnerID))
		return true;

	return false;
}

bool CreatureImplementation::hasSkillToHarvestMe(CreatureObject* player) {

	if(!player->hasSkill("outdoors_scout_novice"))
		return false;

	if (!hasOrganics())
		return false;

	if (player->getSkillMod("creature_harvesting") < 1)
		return false;

	if (alreadyHarvested.contains(player->getObjectID()))
		return false;
	if (dnaState == CreatureManager::DNADEATH)
		return false;
	return true;
}

bool CreatureImplementation::canMilkMe(CreatureObject* player) {

	if (!hasMilk() || milkState != CreatureManager::NOTMILKED  || _this.get()->isInCombat() || _this.get()->isDead())
		return false;

	if(!player->isInRange(_this.get(), 5.0f) || player->isInCombat() || player->isDead() || player->isIncapacitated() || !(player->hasState(CreatureState::MASKSCENT)))
		return false;

	return true;
}
bool CreatureImplementation::hasSkillToSampleMe(CreatureObject* player) {

	if(!player->hasSkill("outdoors_bio_engineer_novice"))
		return false;

	if (!hasDNA())
		return false;

	int skillMod = player->getSkillMod("dna_harvesting");
	int cl = _this.get()->getLevel();
	// Skill Mod Check, you need atleast x skill points to be able to sample x level unless creature > 13k ham or CL 75 (we only generated values to 75)
	if (skillMod < 1 || cl > skillMod + 15)
		return false;

	if (dnaState == CreatureManager::DNASAMPLED)
		return false;

	return true;
}

bool CreatureImplementation::canCollectDna(CreatureObject* player) {
	if (!hasDNA() ||  _this.get()->isInCombat() || _this.get()->isDead() || !player->hasSkill("outdoors_bio_engineer_novice")){
		return false;
	}
	if (player->getSkillMod("dna_harvesting") < 1)
		return false;

	if (_this.get()->isNonPlayerCreatureObject()) {
		return false;
	}
	if(!player->isInRange(_this.get(), 16.0f) || player->isInCombat() || player->isDead() || player->isIncapacitated() ){
		return false;
	}

	return true;
}
