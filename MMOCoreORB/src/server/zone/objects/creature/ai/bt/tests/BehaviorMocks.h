#ifndef BEHAVIORMOCKS_H_
#define BEHAVIORMOCKS_H_

#include "gmock/gmock.h"

#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/objects/tangible/threat/ThreatMap.h"

class MockQueueCommand : public QueueCommand {
public:
    MOCK_CONST_METHOD0(getMaxRange, float());
};

class MockThreatMap : public ThreatMap {
public:
	MockThreatMap(TangibleObject* t) : ThreatMap(t) {}
    MOCK_METHOD0(getHighestThreatCreature, CreatureObject*());
};

#endif // BEHAVIORMOCKS_H_
