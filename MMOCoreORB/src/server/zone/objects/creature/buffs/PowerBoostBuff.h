/*
 *	server/zone/objects/creature/buffs/PowerBoostBuff.h generated by engine3 IDL compiler 0.60
 */

#ifndef POWERBOOSTBUFF_H_
#define POWERBOOSTBUFF_H_

#include "engine/core/Core.h"

#include "engine/core/ManagedReference.h"

#include "engine/core/ManagedWeakReference.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {

class CreatureObject;

} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature;

namespace server {
namespace zone {
namespace objects {
namespace creature {

class CreatureObject;

} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature;

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace buffs {

class PowerBoostBuffDurationEvent;

} // namespace buffs
} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature::buffs;

#include "server/zone/ZoneProcessServer.h"

#include "server/zone/objects/creature/buffs/BuffType.h"

#include "server/zone/objects/creature/buffs/BuffCRC.h"

#include "server/chat/StringIdChatParameter.h"

#include "engine/core/ManagedObject.h"

#include "system/util/VectorMap.h"

#include "system/lang/ref/Reference.h"

#include "system/lang/Time.h"

#include "server/zone/objects/creature/buffs/Buff.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace buffs {

class PowerBoostBuff : public Buff {
public:
	PowerBoostBuff(CreatureObject* creo, const String& name, unsigned int buffCRC, int value, int duration);

	void initializeTransientMembers();

	void activate(bool applyModifiers);

	void deactivate(bool removeModifiers);

	void doHealthAndActionTick(bool up);

	void doMindTick(bool up);

	void clearBuffEvent();

	DistributedObjectServant* _getImplementation();
	DistributedObjectServant* _getImplementationForRead();

	void _setImplementation(DistributedObjectServant* servant);

protected:
	PowerBoostBuff(DummyConstructorParameter* param);

	virtual ~PowerBoostBuff();

	friend class PowerBoostBuffHelper;
};

} // namespace buffs
} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature::buffs;

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace buffs {

class PowerBoostBuffImplementation : public BuffImplementation {
protected:
	Reference<PowerBoostBuffDurationEvent* > pbBuffEvent;

	int pbBonus;

	int pbTick;

	int time;

	int counter;

	int haBuffAmount;

	int mindBuffAmount;

	Time nextTickTime;

public:
	PowerBoostBuffImplementation(CreatureObject* creo, const String& name, unsigned int buffCRC, int value, int duration);

	PowerBoostBuffImplementation(DummyConstructorParameter* param);

	void initializeTransientMembers();

	void activate(bool applyModifiers);

	void deactivate(bool removeModifiers);

	void doHealthAndActionTick(bool up);

	void doMindTick(bool up);

	void clearBuffEvent();

	WeakReference<PowerBoostBuff*> _this;

	operator const PowerBoostBuff*();

	DistributedObjectStub* _getStub();
	virtual void readObject(ObjectInputStream* stream);
	virtual void writeObject(ObjectOutputStream* stream);
protected:
	virtual ~PowerBoostBuffImplementation();

	void finalize();

	void _initializeImplementation();

	void _setStub(DistributedObjectStub* stub);

	void lock(bool doLock = true);

	void lock(ManagedObject* obj);

	void rlock(bool doLock = true);

	void wlock(bool doLock = true);

	void wlock(ManagedObject* obj);

	void unlock(bool doLock = true);

	void runlock(bool doLock = true);

	void _serializationHelperMethod();
	bool readObjectMember(ObjectInputStream* stream, const uint32& nameHashCode);
	int writeObjectMembers(ObjectOutputStream* stream);

	friend class PowerBoostBuff;
};

class PowerBoostBuffAdapter : public BuffAdapter {
public:
	PowerBoostBuffAdapter(PowerBoostBuff* impl);

	void invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void initializeTransientMembers();

	void activate(bool applyModifiers);

	void deactivate(bool removeModifiers);

	void doHealthAndActionTick(bool up);

	void doMindTick(bool up);

	void clearBuffEvent();

};

class PowerBoostBuffHelper : public DistributedObjectClassHelper, public Singleton<PowerBoostBuffHelper> {
	static PowerBoostBuffHelper* staticInitializer;

public:
	PowerBoostBuffHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectServant* instantiateServant();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class Singleton<PowerBoostBuffHelper>;
};

} // namespace buffs
} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature::buffs;

#endif /*POWERBOOSTBUFF_H_*/
