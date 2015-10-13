/*
 * Selector.h
 *
 *  Created on: Jun 11, 2014
 *      Author: swgemu
 */

#ifndef SELECTOR_H_
#define SELECTOR_H_

#include "server/zone/objects/creature/ai/bt/node/Composite.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace ai {
namespace bt {
namespace node {

class Selector : public Composite {
public:
	Selector(const String& className, const uint32 id, const String& argString = "")
		: Composite(className, id, argString) {}
	
	virtual Status execute(AiAgent* agent, unsigned int startIdx = 0) const;
};

}
}
}
}
}
}
}

#endif /* SELECTOR_H_ */
