/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include "engine/engine.h"

#include "server/zone/objects/tangible/tool/CraftingStation.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "templates/tangible/tool/CraftingStationTemplate.h"
#include "server/zone/objects/tangible/tool/CraftingTool.h"
#include "server/zone/objects/manufactureschematic/craftingvalues/CraftingValues.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/managers/collision/CollisionManager.h"
#include "server/zone/objects/scene/components/ContainerComponent.h"
#include "server/zone/objects/tangible/Container.h"

void CraftingStationImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	TangibleObjectImplementation::loadTemplateData(templateData);

	if (!templateData->isCraftingStationTemplate())
		return;

	CraftingStationTemplate* craftingStationData = dynamic_cast<CraftingStationTemplate*>(templateData);

	type = craftingStationData->getStationType();
	complexityLevel = craftingStationData->getComplexityLevel();
}

void CraftingStationImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	TangibleObjectImplementation::fillObjectMenuResponse(menuResponse, player);

	ManagedReference<BuildingObject*> building = player->getRootParent().get().castTo<BuildingObject*>();

	if(building != NULL && !isASubChildOf(player)) {
		if(building->isOnAdminList(player) && getSlottedObject("ingredient_hopper") != NULL) {
			menuResponse->addRadialMenuItem(68, 3, "@ui_radial:craft_hopper_input"); //Open
		}
	}
}

int CraftingStationImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {

	if (selectedID == 68 && getSlottedObject("ingredient_hopper") != NULL) { // use object

		ManagedReference<BuildingObject*> building = player->getRootParent().get().castTo<BuildingObject*>();

		if(building != NULL && !isASubChildOf(player)) {
			if(building->isOnAdminList(player))
				sendInputHopper(player);
		}
	}

	return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
}

void CraftingStationImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(alm, object);

	alm->insertAttribute("stationmod", Math::getPrecision(effectiveness, 2));
}

void CraftingStationImplementation::sendInputHopper(CreatureObject* player) {

	ManagedReference<SceneObject*> inputHopper = getSlottedObject("ingredient_hopper");
	ManagedReference<SceneObject*> station = inputHopper->getParent().get();

	if(inputHopper == NULL) {
		return;
	}

	if (!CollisionManager::checkLineOfSight(player, station)) {
		StringIdChatParameter params("container_error_message", "container18_prose");
		params.setTT("Hopper");
		player->sendSystemMessage(params); //You can't see %TT. You may have to move closer to it.
		return;
	}

	if (!player->isInRange(station, 10.0f)) {
		StringIdChatParameter params;
		params.setStringId("@container_error_message:container09_prose"); // You are out of range of %TT.
		params.setTT("Hopper");
		player->sendSystemMessage(params);
		return;
	}

	inputHopper->sendDestroyTo(player);
	inputHopper->closeContainerTo(player, true);

	inputHopper->sendWithoutContainerObjectsTo(player);
	inputHopper->openContainerTo(player);

}

SceneObject* CraftingStationImplementation::findCraftingTool(CreatureObject* player) {

	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
	Locker inventoryLocker(inventory);
	SceneObject* craftingTool = NULL;

	for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {

		SceneObject* object = inventory->getContainerObject(i);

		if (object != NULL && object->isCraftingTool()) {

			CraftingTool* tool = cast<CraftingTool*>( object);

			if(!tool->isReady())
				continue;

			int toolType = tool->getToolType();

			if (toolType == type) {
				return object;
			}

			if (toolType == CraftingTool::JEDI && type == CraftingTool::WEAPON) {
				craftingTool = object;
			}
		}

	}
	return craftingTool;
}

void CraftingStationImplementation::createChildObjects() {

}

void CraftingStationImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	/// useModifier is the effectiveness

	effectiveness = values->getCurrentValue("usemodifier");

	if(firstUpdate && values->hasSlotFilled("storage_compartment")) {
		String ingredientHopperName = "object/tangible/hopper/crafting_station_hopper/crafting_station_ingredient_hopper_structure_small.iff";
		ManagedReference<SceneObject*> ingredientHopper = server->getZoneServer()->createObject(ingredientHopperName.hashCode(), 1);

		transferObject(ingredientHopper, 4, true);
	}

	// craftingValues->toString();
}
