/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#include "server/zone/objects/creature/ai/DroidObject.h"
#include "server/zone/objects/intangible/PetControlDevice.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/packets/object/StartNpcConversation.h"
#include "server/zone/managers/conversation/ConversationManager.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"
#include "server/zone/objects/tangible/tool/CraftingTool.h"
#include "server/zone/objects/tangible/components/droid/BaseDroidModuleComponent.h"
#include "server/zone/objects/tangible/components/droid/DroidCraftingModuleDataComponent.h"
#include "server/zone/objects/tangible/components/droid/DroidPersonalityModuleDataComponent.h"
#include "server/zone/objects/tangible/components/droid/DroidMaintenanceModuleDataComponent.h"
#include "server/zone/objects/structure/StructureObject.h"
#include "server/zone/objects/creature/conversation/ConversationObserver.h"
#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "server/zone/ZoneServer.h"
#include "server/chat/ChatManager.h"
#include "server/zone/managers/director/DirectorManager.h"

void DroidObjectImplementation::initializeTransientMembers() {
	AiAgentImplementation::initializeTransientMembers();
	initDroidModules();
}

void DroidObjectImplementation::fillAttributeList(AttributeListMessage* msg, CreatureObject* object) {
	if (isHelperDroid())
		return;

	AiAgentImplementation::fillAttributeList(msg, object);

	ManagedReference<ControlDevice*> device = getControlDevice().get();

	if (device != nullptr && device->isASubChildOf(object)) {
		float percentPower = ((float)power / (float)MAX_POWER) * 100.0;
		msg->insertAttribute("@obj_attr_n:battery_power", String::valueOf((int)percentPower) + "%");

		if (paintCount > 0) {
			msg->insertAttribute("customization_cnt", paintCount);
		}

		for (int i = 0; i < modules.size(); i++) {
			auto& module = modules.get(i);

			if (module != nullptr) {
				module->fillAttributeList(msg, object);
			}
		}
	}
}

int DroidObjectImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	// Handle all helper droid selections here unless Store is selected
	if (isHelperDroid() && selectedID != 59) {
		if (player == nullptr)
			return 0;

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		if (lua == nullptr)
			return 0;

		if (selectedID >= 174 && selectedID <= 177) {
			// Space Information
			Reference<LuaFunction*> luaSpaceInfo = lua->createFunction("HelperDroid", "spaceInformation", 0);

			if (luaSpaceInfo == nullptr)
				return 0;

			*luaSpaceInfo << asAiAgent();
			*luaSpaceInfo << player;
			String selection = "";

			if (selectedID == 174) {
				selection = "findShip";
			} else if (selectedID == 175) {
				selection = "checkEmail";
			} else if (selectedID == 176) {
				selection = "travel";
			} else if (selectedID == 177) {
				selection = "makeMoney";
			}

			*luaSpaceInfo << selection;
			luaSpaceInfo->callFunction();
			return 0;
		}

		if (selectedID >= 50 && selectedID <= 55) {
			// Quests called from Lua Here
			Reference<LuaFunction*> luaProfessionQuest = lua->createFunction("HelperDroid", "professionQuest", 0);

			if (luaProfessionQuest == nullptr)
				return 0;

			*luaProfessionQuest << asAiAgent();
			*luaProfessionQuest << player;
			String profession = "";

			if (selectedID == 50) {
				// Brawler
				profession = "brawler";
			} else if (selectedID == 51) {
				// Marksman
				profession = "marksman";
			} else if (selectedID == 52) {
				// Scout
				profession = "scout";
			} else if (selectedID == 53) {
				// Artisan
				profession = "artisan";
			} else if (selectedID == 54) {
				// Medic
				profession = "medic";
			} else if (selectedID == 55) {
				// Entertainer
				profession = "entertainer";
			}

			*luaProfessionQuest << profession;
			luaProfessionQuest->callFunction();
			return 0;
		}

		if (selectedID >= 167 && selectedID <= 170) {
			// Helper Information called here
			Reference<LuaFunction*> luaHelperInfo = lua->createFunction("HelperDroid", "helperInformation", 0);

			if (luaHelperInfo == nullptr)
				return 0;

			*luaHelperInfo << asAiAgent();
			*luaHelperInfo << player;
			String selection = "";

			if (selectedID == 170) {
				// General Help
				selection = "general";
			} else if (selectedID == 167) {
				// Cloning
				selection = "cloning";
			} else if (selectedID == 168) {
				// Travel
				selection = "travel";
			}

			*luaHelperInfo << selection;
			luaHelperInfo->callFunction();
			return 0;
		}

		return 0;
	}

	auto pcd = getControlDevice().get().castTo<PetControlDevice*>();

	if (getLinkedCreature().get() == player) {
		// Allow modules to handle radials if desired
		for (int i = 0; i < modules.size(); i++) {
			auto& module = modules.get(i);
			module->handleObjectMenuSelect(player, selectedID, pcd);
		}
	} else if (isMerchantBarker()) {
		auto module = getModule("merchant_barker");
		if (module != nullptr)
			module->handleObjectMenuSelect(player, selectedID, pcd);
	}

	return SceneObjectImplementation::handleObjectMenuSelect(player, selectedID); // PetMenuComponent
}

void DroidObjectImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	if (player == nullptr)
		return;

	if (isHelperDroid() && getLinkedCreature().get() == player) {
		// Droid Options
		menuResponse->addRadialMenuItem(132, 3, "@pet/pet_menu:droid_options");
		menuResponse->addRadialMenuItemToRadialID(132, 59, 3, "@pet/pet_menu:menu_store"); // Store

		// Starship Pilot Help
		menuResponse->addRadialMenuItem(181, 3, "@new_player:menu_space");
		menuResponse->addRadialMenuItemToRadialID(181, 174, 3, "@new_player:space_option_how_to_find_ship");
		menuResponse->addRadialMenuItemToRadialID(181, 175, 3, "@new_player:space_option_how_to_check_email");
		menuResponse->addRadialMenuItemToRadialID(181, 176, 3, "@new_player:space_option_how_to_travel");
		menuResponse->addRadialMenuItemToRadialID(181, 177, 3, "@new_player:space_option_how_to_make_money");

		// Profession Quests
		menuResponse->addRadialMenuItem(110, 3, "@new_player:menu_quests");

		if (player->hasSkill("combat_brawler_novice"))
			menuResponse->addRadialMenuItemToRadialID(110, 50, 3, "@new_player:submenu_brawler");
		if (player->hasSkill("combat_marksman_novice"))
			menuResponse->addRadialMenuItemToRadialID(110, 51, 3, "@new_player:submenu_marksman");
		if (player->hasSkill("outdoors_scout_novice"))
			menuResponse->addRadialMenuItemToRadialID(110, 52, 3, "@new_player:submenu_scout");
		if (player->hasSkill("crafting_artisan_novice"))
			menuResponse->addRadialMenuItemToRadialID(110, 53, 3, "@new_player:submenu_artisan");
		if (player->hasSkill("science_medic_novice"))
			menuResponse->addRadialMenuItemToRadialID(110, 54, 3, "@new_player:submenu_medic");
		if (player->hasSkill("social_entertainer_novice"))
			menuResponse->addRadialMenuItemToRadialID(110, 55, 3, "@new_player:submenu_entertainer");

		// General Help
		menuResponse->addRadialMenuItem(170, 3, "@new_player:menu_other");
		menuResponse->addRadialMenuItemToRadialID(170, 167, 3, "@new_player:submenu_cloning");
		menuResponse->addRadialMenuItemToRadialID(170, 168, 3, "@new_player:submenu_travel");

		return;
	}

	SceneObjectImplementation::fillObjectMenuResponse(menuResponse, player); // PetMenuComponent

	if (isMerchantBarker() && getLinkedCreature().get() != player) {
		auto module = getModule("merchant_barker");
		if (module != nullptr)
			module->fillObjectMenuResponse(_this.getReferenceUnsafeStaticCast(), menuResponse, player);
		return;
	}

	if (getLinkedCreature().get() != player) {
		return;
	}

	// Allow modules to add radials
	auto pcd = getControlDevice().get().castTo<PetControlDevice*>();

	try {
		for (int i = 0; i < modules.size(); i++) {
			auto &module = modules.get(i);

			module->fillObjectMenuResponse(_this.getReferenceUnsafeStaticCast(), menuResponse, player);
		}
	} catch (Exception& e) {
		warning("could not fill fill object menu response on the droid modules:" + e.getMessage());
	}
}

void DroidObjectImplementation::notifyInsertToZone(Zone* zone) {
	SceneObjectImplementation::notifyInsertToZone(zone);

	ManagedReference<CreatureObject* > linkedCreature = getLinkedCreature().get();
	if (linkedCreature == nullptr)
		return;

	// Decay customized paint (if any)
	if (paintCount > 0) {
		// Paint starts to fade when there are 4 calls left
		if (paintCount <= 4) {
			// Send player notification of decay
			if (paintCount == 1) {
				linkedCreature->sendSystemMessage("@pet/pet_menu:customization_gone"); // "Your droid's customization has completely faded away."
			} else {
				linkedCreature->sendSystemMessage("@pet/pet_menu:customization_fading"); // "Your droid's customization is fading away."
			}

			// Fade color to white
			String appearanceFilename = getObjectTemplate()->getAppearanceFilename();
			VectorMap<String, Reference<CustomizationVariable*> > variables;
			AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

			for (int i = 0; i< variables.size(); ++i) {
				String varkey = variables.elementAt(i).getKey();
				if (varkey.contains("color")) {
					setCustomizationVariable(varkey, paintCount - 1, true); // Palette values 3,2,1,0 are grey->white
				}
			}
		}

		--paintCount;
	}
}

int DroidObjectImplementation::rechargeFromBattery(CreatureObject* player) {
	// Find droid battery in player inventory
	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
	if (inventory == nullptr) {
		player->sendSystemMessage("Player inventory not found");
		return 0;
	}

	ManagedReference<SceneObject*> batterySceno = nullptr;
	for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {
		ManagedReference<SceneObject*> sceno = inventory->getContainerObject(i);
		if (sceno->getObjectTemplate()->getFullTemplateString() == "object/tangible/droid_battery/battery.iff") {
			batterySceno = sceno;
		}
	}

	// Battery not found
	if (batterySceno == nullptr) {
		showFlyText("npc_reaction/flytext","nobattery", 204, 0, 0); // "You don't have a power storage device."
		return 0;
	}

	// Battery found
	ManagedReference<TangibleObject*> batteryTano = cast<TangibleObject*>(batterySceno.get());
	if (batteryTano == nullptr) {
		player->sendSystemMessage("Error with droid battery object");
		return 0;
	}

	// Reset power to max and heal droid's BF
	power = MAX_POWER;
	int droidsbf = getShockWounds();
	addShockWounds(-droidsbf, true, false);

	// Consume battery
	Locker locker(batteryTano);

	batteryTano->decreaseUseCount();

	showFlyText("npc_reaction/flytext","recharged", 0, 153, 0);  // "*Recharged*"
	doAnimation("power_up");
	return 0;
}

void DroidObjectImplementation::rechargeFromDroid() {
	// Reset power to max and heal that droid's BF too
	power = MAX_POWER;
	int droidsbf = getShockWounds();
	addShockWounds(-droidsbf, true, false);

	showFlyText("npc_reaction/flytext","recharged", 0, 153, 0);  // "*Recharged*"
	doAnimation("power_up");
	return;
}

void DroidObjectImplementation::rechargeOtherDroid(DroidObject* otherDroid) {
	otherDroid->rechargeFromDroid();
	usePower(100);
}

void DroidObjectImplementation::handleLowPower() {
	// Send fly text
	showFlyText("npc_reaction/flytext","low_power", 204, 0, 0);  // "*Low Power*"
	doAnimation("power_down");

	// Stop following
	setOblivious();

	// Deactivate all modules
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		module->deactivate();
	}

	return;
}

bool DroidObjectImplementation::isPowerDroid() {
	if (getSpecies() == 0)
		return getObjectTemplate()->getFullTemplateString().contains("eg_6_power_droid");
	else
		return POWER_DROID == getSpecies();
}

void DroidObjectImplementation::initDroidModules() {
	modules.removeAll();
	ManagedReference<SceneObject*> container = getSlottedObject("crafted_components");
	if (container != nullptr && container->getContainerObjectsSize() > 0) {
		SceneObject* satchel = container->getContainerObject(0);

		if (satchel != nullptr && satchel->getContainerObjectsSize() > 0) {
			for (int i = 0; i < satchel->getContainerObjectsSize(); ++i) {
				ManagedReference<SceneObject*> sceno = satchel->getContainerObject(i);
				if (sceno == nullptr) {
					continue;
				}

				DataObjectComponentReference* data = sceno->getDataObjectComponent();
				if (data == nullptr || data->get() == nullptr || !data->get()->isDroidModuleData()) {
					continue;
				}

				BaseDroidModuleComponent* module = cast<BaseDroidModuleComponent*>(data->get());
				if (module != nullptr) {
					modules.emplace(module);
				}
			}
		}
	}
}

void DroidObjectImplementation::initDroidWeapons() {
	//Set weapon stats
	WeaponObject* weapon = asAiAgent()->getDefaultWeapon();

	if (weapon != nullptr) {
		Locker locker(weapon);
		weapon->setMinDamage(getDamageMin());
		weapon->setMaxDamage(getDamageMax());
		weapon->setAttackSpeed(getAttackSpeed());
	}

	if (primaryWeapon != nullptr && primaryWeapon != weapon) {
		Locker locker(primaryWeapon);
		primaryWeapon->setMinDamage(getDamageMin());
		primaryWeapon->setMaxDamage(getDamageMax());
		primaryWeapon->setAttackSpeed(getAttackSpeed());
	}
}

CraftingStation* DroidObjectImplementation::getCraftingStation(int type) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module != nullptr && module->actsAsCraftingStation()) {
			DroidCraftingModuleDataComponent* craftingModule = dynamic_cast<DroidCraftingModuleDataComponent*>(module.get());

			if (craftingModule != nullptr) {
				CraftingStation* craftingStation = craftingModule->getCraftingStation();

				if (craftingStation != nullptr) {
					// case here to check each type
					if (craftingModule->validCraftingType(type) || (type == CraftingTool::JEDI && craftingModule->isWeaponDroidGeneric())) {
						return craftingStation;
					}
				}
			}
		}
	}

	return nullptr;
}

String DroidObjectImplementation::getPersonalityBase() const {
	for (int i = 0; i < modules.size(); i++) {
		auto module = modules.get(i).castTo<DroidPersonalityModuleDataComponent*>();

		if (module != nullptr) {
			return module->getPersonalityBase();
		}
	}

	return "";
}

void DroidObjectImplementation::onStore() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		module->onStore();
	}
}

void DroidObjectImplementation::onCall() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		module->onCall();
	}

	if (isHelperDroid()) {
		Lua* lua = DirectorManager::instance()->getLuaInstance();

		if (lua == nullptr)
			return;

		Reference<LuaFunction*> luaGreetPlayer = lua->createFunction("HelperDroid", "greetPlayer", 0);

		if (luaGreetPlayer != nullptr) {
			ManagedReference<CreatureObject*> player = getLinkedCreature().get();

			if (player != nullptr) {
				*luaGreetPlayer << player;
				*luaGreetPlayer << asAiAgent();
				luaGreetPlayer->callFunction();
			}
		}
	}
}

void DroidObjectImplementation::loadSkillMods(CreatureObject* player) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		module->loadSkillMods(player);
	}
}

void DroidObjectImplementation::unloadSkillMods(CreatureObject* player) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		module->unloadSkillMods(player);
	}
}

void DroidObjectImplementation::handleChat(CreatureObject* speaker, const String& message) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		module->handlePetCommand(message, speaker);
	}
}

Reference<BaseDroidModuleComponent*> DroidObjectImplementation::getModule(const String& name) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == name) {
			return module;
		}
	}

	return nullptr;
}

bool DroidObjectImplementation::isAdvancedModel() {
	return getCreatureTemplate()->getObjectName().contains("advanced");
}

void DroidObjectImplementation::runModulePowerDrain() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);
		int drain = module->getBatteryDrain();

		if (drain > 0)
			usePower(drain);
	}
}

bool DroidObjectImplementation::isCombatDroid() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->isCombatModule()) {
			return true;
		}
	}

	// inante comabt ability, regardless of module installed
	if (getSpecies() == PROBOT || getSpecies() == DZ70)
		return true;

	return false;
}

bool DroidObjectImplementation::isTrapDroid() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == "trap_module") {
			return true;
		}
	}

	return false;
}

bool DroidObjectImplementation::isMerchantBarker() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == "merchant_barker") {
			return true;
		}
	}

	return false;
}

bool DroidObjectImplementation::hasStorage() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == "item_storage_module") {
			return true;
		}
	}

	return false;
}

bool DroidObjectImplementation::isMaintenanceDroid() {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == "maintenance_module") {
			return true;
		}
	}

	return false;
}

bool DroidObjectImplementation::assignStructure(StructureObject* structure) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == "maintenance_module") {
			DroidMaintenanceModuleDataComponent* maintModule = dynamic_cast<DroidMaintenanceModuleDataComponent*>(module.get());

			if (maintModule != nullptr) {
				return maintModule->assignStructure(structure->getObjectID());
			}
		}
	}

	return false;
}

bool DroidObjectImplementation::isStructureAssigned(StructureObject* structure) {
	for (int i = 0; i < modules.size(); i++) {
		auto& module = modules.get(i);

		if (module->getModuleName() == "maintenance_module") {
			DroidMaintenanceModuleDataComponent* maintModule = dynamic_cast<DroidMaintenanceModuleDataComponent*>(module.get());

			if (maintModule != nullptr) {
				return maintModule->isAssignedTo(structure->getObjectID());
			}
		}
	}

	return false;
}

bool DroidObjectImplementation::sendConversationStartTo(SceneObject* player) {
	if (!player->isPlayerCreature() || isDead())
		return false;

	if (player != getLinkedCreature().get())
		return false;

	auto m = getModule("personality_chip");
	if (m == nullptr) {
		return false;
	}

	DroidPersonalityModuleDataComponent* personality = dynamic_cast<DroidPersonalityModuleDataComponent*>(m.get());
	if (personality == nullptr) {
		return false;
	}

	if (personality->getPersonalityConversationTemplate() == 0) {
		return false;
	}

	//Face player.
	faceObject(player);

	PatrolPoint current(coordinates.getPosition(), getParent().get().castTo<CellObject*>());

	broadcastNextPositionUpdate(&current);

	CreatureObject* playerCreature = cast<CreatureObject*>(player);
	StartNpcConversation* conv = new StartNpcConversation(playerCreature, getObjectID(), "");
	player->sendMessage(conv);

	SortedVector<ManagedReference<Observer*> > observers = getObservers(ObserverEventType::STARTCONVERSATION);

	for (int i = 0;  i < observers.size(); ++i) {
		if (dynamic_cast<ConversationObserver*>(observers.get(i).get()) != nullptr) {
			return true;
		}
	}

	//Create conversation observer.
	ConversationObserver* conversationObserver = ConversationManager::instance()->getConversationObserver(personality->getPersonalityConversationTemplate());

	if (conversationObserver != nullptr) {
		//Register observers.
		registerObserver(ObserverEventType::CONVERSE, conversationObserver);
		registerObserver(ObserverEventType::STARTCONVERSATION, conversationObserver);
		registerObserver(ObserverEventType::SELECTCONVERSATION, conversationObserver);
		registerObserver(ObserverEventType::STOPCONVERSATION, conversationObserver);
	} else {
		error("Could not create conversation observer.");
		return false;
	}

	return true;
}

String DroidObjectImplementation::getPersonalityStf() {
	for (int i = 0; i < modules.size(); i++) {
		auto module = modules.get(i).castTo<DroidPersonalityModuleDataComponent*>();

		if (module != nullptr) {
			return module->getPersonalityStf();
		}
	}

	return "";
}
