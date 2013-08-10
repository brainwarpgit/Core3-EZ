/*
 * CreatureTemplateManager.cpp
 *
 *  Created on: 27/05/2011
 *      Author: victor
 */

#include "CreatureTemplateManager.h"
#include "LairSpawnGroup.h"
#include "server/conf/ConfigManager.h"

AtomicInteger CreatureTemplateManager::loadedMobileTemplates;

int CreatureTemplateManager::DEBUG_MODE = 0;
int CreatureTemplateManager::ERROR_CODE = NO_ERROR;

CreatureTemplateManager::CreatureTemplateManager() : Logger("CreatureTemplateManager") {
	/*setLogging(false);
		setGlobalLogging(true);*/
	//setLoggingName("CreatureTemplateManager");

	lua = new Lua();
	lua->init();

	if (DEBUG_MODE) {
		setLogging(true);
		lua->setLogging(true);
	}

	hashTable.setNullValue(NULL);

	lua_register(lua->getLuaState(), "includeFile", includeFile);
	lua_register(lua->getLuaState(), "addTemplate", addTemplate);
	lua_register(lua->getLuaState(), "addWeapon", addWeapon);
	lua_register(lua->getLuaState(), "addDynamicGroup", addDynamicGroup);
	lua_register(lua->getLuaState(), "addStaticGroup", addStaticGroup);
	lua_register(lua->getLuaState(), "addConversationTemplate", addConversationTemplate);
	lua_register(lua->getLuaState(), "addLairTemplate", addLairTemplate);
	lua_register(lua->getLuaState(), "addLairGroup", addLairGroup);
	lua_register(lua->getLuaState(), "addPatrolPathTemplate", addPatrolPathTemplate);
	lua_register(lua->getLuaState(), "addOutfitGroup", addOutfitGroup);

	lua->setGlobalInt("NONE", CreatureFlag::NONE);
	lua->setGlobalInt("ATTACKABLE", CreatureFlag::ATTACKABLE);
	lua->setGlobalInt("AGGRESSIVE", CreatureFlag::AGGRESSIVE);
	lua->setGlobalInt("OVERT", CreatureFlag::OVERT);
	lua->setGlobalInt("TEF", CreatureFlag::TEF);
	lua->setGlobalInt("PLAYER", CreatureFlag::PLAYER);
	lua->setGlobalInt("ENEMY", CreatureFlag::ENEMY);
	lua->setGlobalInt("CHANGEFACTIONSTATUS", CreatureFlag::CHANGEFACTIONSTATUS);
	lua->setGlobalInt("BLINK_GREEN", CreatureFlag::BLINK_GREEN);

	lua->setGlobalInt("PACK", CreatureFlag::PACK);
	lua->setGlobalInt("HERD", CreatureFlag::HERD);
	lua->setGlobalInt("KILLER", CreatureFlag::KILLER);
	lua->setGlobalInt("STALKER", CreatureFlag::STALKER);
	lua->setGlobalInt("BABY", CreatureFlag::BABY);
	lua->setGlobalInt("LAIR", CreatureFlag::LAIR);
	lua->setGlobalInt("HEALER", CreatureFlag::HEALER);

	lua->setGlobalInt("CARNIVORE", CreatureFlag::CARNIVORE);
	lua->setGlobalInt("HERBIVORE", CreatureFlag::HERBIVORE);
}

CreatureTemplateManager::~CreatureTemplateManager() {
}

int CreatureTemplateManager::loadTemplates() {
	info("loading mobile templates...", true);
	bool ret = false;

	try {
		ret = lua->runFile("scripts/mobile/creatures.lua");
	} catch (Exception& e) {
		error(e.getMessage());
		e.printStackTrace();
		ret = false;
	}

	lua = NULL;

	if (!ret)
		ERROR_CODE = GENERAL_ERROR;

	printf("\n");
	info("done loading mobile templates", true);

	return ERROR_CODE;
}

int CreatureTemplateManager::checkArgumentCount(lua_State* L, int args) {
	int parameterCount = lua_gettop(L) - 1;

	if (parameterCount < args) {
		return 1;
	} else if (parameterCount > args)
		return 2;

	return 0;
}

int CreatureTemplateManager::includeFile(lua_State* L) {
	if (checkArgumentCount(L, 1) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::includeFile");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String filename = Lua::getStringParameter(L);

	bool ret = Lua::runFile("scripts/mobile/" + filename, L);

	if (!ret)
		ERROR_CODE = GENERAL_ERROR;

	return 0;
}

int CreatureTemplateManager::addTemplate(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addTemplate");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii =  lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);
	CreatureTemplate* newTemp = new CreatureTemplate();
	newTemp->setTemplateName(ascii);
	newTemp->readObject(&obj);

	if (instance()->hashTable.containsKey(crc)) {
		luaL_where (L, 2);
		String luaMethodName = lua_tostring(L, -1);

		lua_pop(L, 1);

		instance()->error("overwriting mobile " + ascii + " with " + luaMethodName);

		ERROR_CODE = DUPLICATE_MOBILE;
	}

	CreatureTemplateManager::instance()->hashTable.put(crc, newTemp);

	int count = loadedMobileTemplates.increment();

	if (ConfigManager::instance()->isProgressMonitorActivated() && !DEBUG_MODE)
		printf("\r\tLoading mobile templates: [%d] / [?]\t", count);

	return 0;
}

int CreatureTemplateManager::addConversationTemplate(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addConversationTemplate");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii =  lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);
	Reference<ConversationTemplate*> newTemp = new ConversationTemplate(crc);
	CreatureTemplateManager::instance()->conversations.put(crc, newTemp);

	newTemp->readObject(&obj);

	return 0;
}

int CreatureTemplateManager::addWeapon(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addWeapon");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);
	if (obj.isValidTable()) {
		Vector<String> weps;
		for (int i = 1; i <= obj.getTableSize(); ++i)
			weps.add(obj.getStringAt(i));

		CreatureTemplateManager::instance()->weaponMap.put(crc, weps);
	}

	return 0;
}

int CreatureTemplateManager::addDynamicGroup(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addDynamicGroup");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);
	CreatureTemplateManager::instance()->dynamicGroupMap.put(crc, new DynamicSpawnGroup(ascii, obj));

	return 0;
}

int CreatureTemplateManager::addStaticGroup(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addStaticGroup");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);
	CreatureTemplateManager::instance()->staticGroupMap.put(crc, new StaticSpawnGroup(ascii, obj));

	return 0;
}

int CreatureTemplateManager::addLairGroup(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addLairGroup");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);
	CreatureTemplateManager::instance()->lairSpawnGroupMap.put(crc, new LairSpawnGroup(ascii, obj));

	return 0;
}

int CreatureTemplateManager::addLairTemplate(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addLairTemplate");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);
	uint32 crc = (uint32) ascii.hashCode();

	LuaObject obj(L);

	Reference<LairTemplate*> templ = new LairTemplate(ascii);
	templ->readObject(&obj);

	CreatureTemplateManager::instance()->lairTemplates.put(crc, templ);

	return 0;
}

int CreatureTemplateManager::addPatrolPathTemplate(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addPatrolPathTemplate");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);

	LuaObject obj(L);

	Reference<PatrolPathTemplate*> templ = new PatrolPathTemplate();
	templ->readObject(&obj);

	instance()->patrolPaths.put(ascii, templ);

	return 0;
}

int CreatureTemplateManager::addOutfitGroup(lua_State* L) {
	if (checkArgumentCount(L, 2) == 1) {
		instance()->error("incorrect number of arguments passed to CreatureTemplateManager::addOutfitGroup");
		ERROR_CODE = INCORRECT_ARGUMENTS;
		return 0;
	}

	String ascii = lua_tostring(L, -2);

	LuaObject obj(L);

	Reference<MobileOutfitGroup*> templ = new MobileOutfitGroup();
	templ->readObject(&obj);

	instance()->outfits.put(ascii, templ);

	return 0;
}
