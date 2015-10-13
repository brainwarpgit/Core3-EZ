/*
 * Selector.cpp
 *
 *  Created on: Jun 11, 2014
 *      Author: swgemu
 */

#include "server/zone/objects/creature/ai/bt/node/Selector.h"
#include "server/zone/objects/creature/ai/AiAgent.h"

using namespace server::zone::objects::creature::ai::bt;
using namespace server::zone::objects::creature::ai::bt::node;

Behavior::Status Selector::execute(AiAgent* agent, unsigned int startIdx) const {
	// loop through children and return SUCCESS on first one that succeeded
	// as always, return RUNNING if any child returns RUNNING
	for (; startIdx < children.size(); ++startIdx) {
		Behavior* currentChild = children.get(startIdx);
		assert(currentChild != NULL);

		Behavior::Status result = currentChild->doAction(agent);

		if (result == FAILURE)
			continue;

		return result;
	}
	
	// We made it all the way through the list without a success
	return FAILURE;
}
