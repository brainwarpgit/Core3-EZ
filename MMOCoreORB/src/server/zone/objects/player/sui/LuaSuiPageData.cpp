/*
 * LuaSuiPageData.cpp
 *
 *  Created on: Nov 7, 2013
 *      Author: crush
 */

#include "LuaSuiPageData.h"
#include "server/zone/objects/player/sui/SuiPageData.h"
#include "server/zone/objects/creature/CreatureObject.h"

const char LuaSuiPageData::className[] = "LuaSuiPageData";

Luna<LuaSuiPageData>::RegType LuaSuiPageData::Register[] = {
		{ "_setObject", &LuaSuiPageData::_setObject },
		{ "_getObject", &LuaSuiPageData::_getObject },
		{ "sendTo", &LuaSuiPageData::sendTo },
		{ "setProperty", &LuaSuiPageData::setProperty },
		{ "addDataItem", &LuaSuiPageData::addDataItem },
		{ "clearDataSource", &LuaSuiPageData::clearDataSource },
		{ "addDataSourceContainer", &LuaSuiPageData::addDataSourceContainer },
		{ "clearDataSourceContainer", &LuaSuiPageData::clearDataSourceContainer },
		{ "addChildWidget", &LuaSuiPageData::addChildWidget },
		{ "subscribeToEvent", &LuaSuiPageData::subscribeToEvent },
		{ "subscribeToPropertyForEvent", &LuaSuiPageData::subscribeToPropertyForEvent },
		{ 0, 0 }
};

LuaSuiPageData::LuaSuiPageData(lua_State *L) {
	realObject = new SuiPageData(lua_tostring(L, 1));
}

LuaSuiPageData::~LuaSuiPageData() {
}

int LuaSuiPageData::_setObject(lua_State* L) {
	realObject = static_cast<SuiPageData*>(lua_touserdata(L, -1));

	return 0;
}

int LuaSuiPageData::_getObject(lua_State* L) {
	if (realObject == NULL)
		lua_pushnil(L);
	else
		lua_pushlightuserdata(L, realObject.get());

	return 1;
}

//const String& widget, const String& property, const UnicodeString& value
int LuaSuiPageData::setProperty(lua_State* L) {
	String widget = lua_tostring(L, -3);
	String property = lua_tostring(L, -2);
	UnicodeString value = lua_tostring(L, -1);

	realObject->setProperty(widget, property, value);

	return 0;
}

//const String& widget, const String& property, const UnicodeString& value
int LuaSuiPageData::addDataItem(lua_State* L) {
	String widget = lua_tostring(L, -3);
	String property = lua_tostring(L, -2);
	UnicodeString value = lua_tostring(L, -1);

	realObject->addDataItem(widget, property, value);

	return 0;
}

int LuaSuiPageData::clearDataSource(lua_State* L) {
	String dataSource = lua_tostring(L, -1);

	realObject->clearDataSource(dataSource);

	return 0;
}

int LuaSuiPageData::addDataSourceContainer(lua_State* L) {
	String parent = lua_tostring(L, -2);
	String name = lua_tostring(L, -1);

	realObject->addDataSourceContainer(parent, name);

	return 0;
}

int LuaSuiPageData::clearDataSourceContainer(lua_State* L) {
	String dataSourceContainer = lua_tostring(L, -1);

	realObject->clearDataSourceContainer(dataSourceContainer);

	return 0;
}

int LuaSuiPageData::addChildWidget(lua_State* L) {
	String parent = lua_tostring(L, -3);
	String type = lua_tostring(L, -2);
	String name = lua_tostring(L, -1);

	realObject->addChildWidget(parent, type, name);

	return 0;
}

//const byte& eventType, const String& parent, const String& callback
int LuaSuiPageData::subscribeToEvent(lua_State* L) {
	byte eventType = lua_tonumber(L, -3);
	String parent = lua_tostring(L, -2);
	String callback = lua_tostring(L, -1);

	realObject->subscribeToEvent(eventType, parent, callback);

	return 0;
}

//const byte& eventType, const String& widget, const String& property
int LuaSuiPageData::subscribeToPropertyForEvent(lua_State* L) {
	byte eventType = lua_tonumber(L, -3);
	String widget = lua_tostring(L, -2);
	String property = lua_tostring(L, -1);

	realObject->subscribeToPropertyForEvent(eventType, widget, property);

	return 0;
}

int LuaSuiPageData::sendTo(lua_State* L) {
	CreatureObject* creo = static_cast<CreatureObject*>(lua_touserdata(L, -1));

	if (creo != NULL)
		realObject->sendTo(creo);

	return 0;
}
