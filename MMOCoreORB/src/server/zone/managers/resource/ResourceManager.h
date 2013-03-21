/*
 *	server/zone/managers/resource/ResourceManager.h generated by engine3 IDL compiler 0.60
 */

#ifndef RESOURCEMANAGER_H_
#define RESOURCEMANAGER_H_

#include "engine/core/Core.h"

#include "engine/core/ManagedReference.h"

#include "engine/core/ManagedWeakReference.h"

namespace server {
namespace zone {

class ZoneServer;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {

class Zone;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {

class ZoneProcessServer;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {
namespace managers {
namespace object {

class ObjectManager;

} // namespace object
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::object;

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
namespace resource {

class ResourceContainer;

} // namespace resource
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::resource;

namespace server {
namespace zone {
namespace objects {
namespace player {
namespace sui {
namespace listbox {

class SuiListBox;

} // namespace listbox
} // namespace sui
} // namespace player
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::player::sui::listbox;

#include "server/zone/managers/resource/resourcespawner/ResourceSpawner.h"

#include "server/zone/managers/resource/resourcespawner/resourcetree/ResourceTree.h"

#include "server/zone/packets/resource/ResourceListForSurveyMessage.h"

#include "server/zone/objects/resource/ResourceSpawn.h"

#include "engine/core/ManagedObject.h"

#include "engine/lua/Lua.h"

#include "engine/log/Logger.h"

#include "engine/service/proto/BaseMessage.h"

#include "engine/util/Observer.h"

#include "engine/util/Observable.h"

namespace server {
namespace zone {
namespace managers {
namespace resource {

class ResourceManager : public Observer {
public:
	static const int RESOURCE_DEED_QUANTITY = 100000;

	ResourceManager(ZoneServer* server, ZoneProcessServer* impl, ObjectManager* objectMan);

	void stop();

	void initialize();

	void shiftResources();

	int notifyObserverEvent(unsigned int eventType, Observable* observable, ManagedObject* arg1, long long arg2);

	int getResourceRecycleType(ResourceSpawn* resource);

	void sendResourceListForSurvey(CreatureObject* playerCreature, const int toolType, const String& surveyType);

	void sendSurvey(CreatureObject* playerCreature, const String& resname);

	void sendSample(CreatureObject* playerCreature, const String& resname, const String& sampleAnimation);

	ResourceContainer* harvestResource(CreatureObject* player, const String& type, const int quantity);

	void harvestResourceToPlayer(CreatureObject* player, ResourceSpawn* resourceSpawn, const int quantity);

	unsigned int getAvailablePowerFromPlayer(CreatureObject* player);

	void removePowerFromPlayer(CreatureObject* player, unsigned int power);

	void getResourceListByType(Vector<ManagedReference<ResourceSpawn* > >& list, int type, const String& zoneName);

	void createResourceSpawn(CreatureObject* playerCreature, const String& restype);

	void givePlayerResource(CreatureObject* playerCreature, const String& restype, const int quantity);

	ResourceSpawn* getCurrentSpawn(const String& restype, const String& zoneName);

	ResourceSpawn* getResourceSpawn(const String& spawnName);

	bool isRecycledResource(ResourceSpawn* resource);

	ResourceSpawn* getRecycledVersion(ResourceSpawn* resource);

	void addNodeToListBox(SuiListBox* sui, const String& nodeName);

	String addParentNodeToListBox(SuiListBox* sui, const String& currentNode);

	void listResourcesForPlanetOnScreen(CreatureObject* creature, const String& planet);

	String healthCheck();

	String dumpResources();

	String despawnResource(String& resourceName);

	DistributedObjectServant* _getImplementation();
	DistributedObjectServant* _getImplementationForRead();

	void _setImplementation(DistributedObjectServant* servant);

protected:
	ResourceManager(DummyConstructorParameter* param);

	virtual ~ResourceManager();

	friend class ResourceManagerHelper;
};

} // namespace resource
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::resource;

namespace server {
namespace zone {
namespace managers {
namespace resource {

class ResourceManagerImplementation : public ObserverImplementation, public Logger {
	ManagedReference<ZoneProcessServer* > processor;

	ManagedWeakReference<ZoneServer* > zoneServer;

	Reference<ResourceSpawner* > resourceSpawner;

	Reference<ObjectManager* > objectManager;

	int shiftInterval;

	Reference<Lua* > lua;

public:
	static const int RESOURCE_DEED_QUANTITY = 100000;

	ResourceManagerImplementation(ZoneServer* server, ZoneProcessServer* impl, ObjectManager* objectMan);

	ResourceManagerImplementation(DummyConstructorParameter* param);

	void stop();

	void initialize();

	void shiftResources();

	int notifyObserverEvent(unsigned int eventType, Observable* observable, ManagedObject* arg1, long long arg2);

	int getResourceRecycleType(ResourceSpawn* resource);

	void sendResourceListForSurvey(CreatureObject* playerCreature, const int toolType, const String& surveyType);

	void sendSurvey(CreatureObject* playerCreature, const String& resname);

	void sendSample(CreatureObject* playerCreature, const String& resname, const String& sampleAnimation);

	ResourceContainer* harvestResource(CreatureObject* player, const String& type, const int quantity);

	void harvestResourceToPlayer(CreatureObject* player, ResourceSpawn* resourceSpawn, const int quantity);

	unsigned int getAvailablePowerFromPlayer(CreatureObject* player);

	void removePowerFromPlayer(CreatureObject* player, unsigned int power);

	void getResourceListByType(Vector<ManagedReference<ResourceSpawn* > >& list, int type, const String& zoneName);

	void createResourceSpawn(CreatureObject* playerCreature, const String& restype);

	void givePlayerResource(CreatureObject* playerCreature, const String& restype, const int quantity);

	ResourceSpawn* getCurrentSpawn(const String& restype, const String& zoneName);

	ResourceSpawn* getResourceSpawn(const String& spawnName);

private:
	bool loadConfigFile();

	bool loadConfigData();

	void loadDefaultConfig();

	void startResourceSpawner();

public:
	bool isRecycledResource(ResourceSpawn* resource);

	ResourceSpawn* getRecycledVersion(ResourceSpawn* resource);

	void addNodeToListBox(SuiListBox* sui, const String& nodeName);

	String addParentNodeToListBox(SuiListBox* sui, const String& currentNode);

	void listResourcesForPlanetOnScreen(CreatureObject* creature, const String& planet);

	String healthCheck();

	String dumpResources();

	String despawnResource(String& resourceName);

	WeakReference<ResourceManager*> _this;

	operator const ResourceManager*();

	DistributedObjectStub* _getStub();
	virtual void readObject(ObjectInputStream* stream);
	virtual void writeObject(ObjectOutputStream* stream);
protected:
	virtual ~ResourceManagerImplementation();

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

	friend class ResourceManager;
};

class ResourceManagerAdapter : public ObserverAdapter {
public:
	ResourceManagerAdapter(ResourceManager* impl);

	void invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void stop();

	void initialize();

	void shiftResources();

	int notifyObserverEvent(unsigned int eventType, Observable* observable, ManagedObject* arg1, long long arg2);

	int getResourceRecycleType(ResourceSpawn* resource);

	void sendResourceListForSurvey(CreatureObject* playerCreature, const int toolType, const String& surveyType);

	void sendSurvey(CreatureObject* playerCreature, const String& resname);

	void sendSample(CreatureObject* playerCreature, const String& resname, const String& sampleAnimation);

	ResourceContainer* harvestResource(CreatureObject* player, const String& type, const int quantity);

	void harvestResourceToPlayer(CreatureObject* player, ResourceSpawn* resourceSpawn, const int quantity);

	unsigned int getAvailablePowerFromPlayer(CreatureObject* player);

	void removePowerFromPlayer(CreatureObject* player, unsigned int power);

	void createResourceSpawn(CreatureObject* playerCreature, const String& restype);

	void givePlayerResource(CreatureObject* playerCreature, const String& restype, const int quantity);

	ResourceSpawn* getCurrentSpawn(const String& restype, const String& zoneName);

	ResourceSpawn* getResourceSpawn(const String& spawnName);

	bool isRecycledResource(ResourceSpawn* resource);

	ResourceSpawn* getRecycledVersion(ResourceSpawn* resource);

	void addNodeToListBox(SuiListBox* sui, const String& nodeName);

	String addParentNodeToListBox(SuiListBox* sui, const String& currentNode);

	void listResourcesForPlanetOnScreen(CreatureObject* creature, const String& planet);

	String healthCheck();

	String dumpResources();

	String despawnResource(String& resourceName);

};

class ResourceManagerHelper : public DistributedObjectClassHelper, public Singleton<ResourceManagerHelper> {
	static ResourceManagerHelper* staticInitializer;

public:
	ResourceManagerHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectServant* instantiateServant();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class Singleton<ResourceManagerHelper>;
};

} // namespace resource
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::resource;

#endif /*RESOURCEMANAGER_H_*/
