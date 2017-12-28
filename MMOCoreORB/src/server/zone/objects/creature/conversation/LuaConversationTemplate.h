/*
 * LuaConversationTemplate.h
 *
 *  Created on: 04/01/2012
 *      Author: victor
 */

#ifndef LUACONVERSATIONTEMPLATE_H_
#define LUACONVERSATIONTEMPLATE_H_


#include "ConversationTemplate.h"
#include "engine/engine.h"
#include "engine/lua/Luna.h"

#include "system/lang/ref/Reference.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace conversation {
class ConversationTemplate;
}  // namespace conversation
}  // namespace creature
}  // namespace objects
}  // namespace zone
}  // namespace server

class LuaConversationTemplate {
public:
	// Constants
	static const char className[];
	static Luna<LuaConversationTemplate>::RegType Register[];

	// Initialize the pointer
	LuaConversationTemplate(lua_State *L);
	~LuaConversationTemplate();

	int _setObject(lua_State* L);
	// Methods we will need to use
	int getScreen(lua_State* L);
	int getInitialScreen(lua_State* L);

private:
	// The pointer to the 'real object' defined in object.cc
	Reference<ConversationTemplate*> realObject;
};

#endif /* LUACONVERSATIONTEMPLATE_H_ */
