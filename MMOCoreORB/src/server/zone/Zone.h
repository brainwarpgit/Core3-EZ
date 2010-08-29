/*
 *	server/zone/Zone.h generated by engine3 IDL compiler 0.60
 */

#ifndef ZONE_H_
#define ZONE_H_

#include "engine/orb/DistributedObjectBroker.h"

#include "engine/core/ManagedReference.h"

#include "engine/core/ManagedWeakReference.h"

namespace server {
namespace zone {

class ZoneProcessServerImplementation;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {

class ZoneServer;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {
namespace managers {
namespace structure {

class StructureManager;

} // namespace structure
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::structure;

namespace server {
namespace zone {
namespace objects {
namespace scene {

class SceneObject;

} // namespace scene
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::scene;

namespace server {
namespace zone {
namespace managers {
namespace planet {

class PlanetManager;

} // namespace planet
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::planet;

namespace server {
namespace zone {
namespace managers {
namespace creature {

class CreatureManager;

} // namespace creature
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::creature;

namespace server {
namespace zone {
namespace managers {
namespace objectcontroller {

class ObjectController;

} // namespace objectcontroller
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::objectcontroller;

namespace server {
namespace zone {
namespace objects {
namespace building {
namespace cloning {

class CloningBuildingObject;

} // namespace cloning
} // namespace building
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::building::cloning;

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

#include "server/zone/managers/planet/HeightMap.h"

#include "server/zone/managers/object/ObjectMap.h"

#include "server/zone/managers/planet/MapLocationTable.h"

#include "engine/util/QuadTree.h"

#include "engine/util/QuadTreeEntry.h"

#include "system/lang/Time.h"

#include "engine/core/TaskManager.h"

#include "engine/core/ManagedObject.h"

#include "system/util/VectorMap.h"

#include "system/util/SortedVector.h"

#include "system/lang/System.h"

namespace server {
namespace zone {

class Zone : public ManagedObject {
public:
	Zone(ZoneServer* zserv, ZoneProcessServerImplementation* processor, int zoneid);

	void initializeTransientMembers();

	CloningBuildingObject* getNearestCloningBuilding(CreatureObject* creature);

	SceneObject* getNearestPlanetaryObject(SceneObject* object, unsigned int mapObjectLocationType);

	SortedVector<ManagedReference<SceneObject* > > getPlanetaryObjectList(unsigned int mapObjectLocationType);

	void insert(QuadTreeEntry* entry);

	void remove(QuadTreeEntry* entry);

	void update(QuadTreeEntry* entry);

	void inRange(QuadTreeEntry* entry, float range);

	void startManagers();

	void stopManagers();

	float getHeight(float x, float y);

	void addSceneObject(SceneObject* object);

	void sendMapLocationsTo(const String& planetName, SceneObject* player);

	void dropSceneObject(SceneObject* object);

	int getZoneID();

	String getPlanetName();

	PlanetManager* getPlanetManager();

	ZoneServer* getZoneServer();

	CreatureManager* getCreatureManager();

	unsigned long long getGalacticTime();

	unsigned int getWeatherID();

	void setWeatherID(unsigned int value);

	void changeWeatherID(int value);

	bool isWeatherEnabled();

	void setWeatherEnabled(bool value);

	void setWeatherWindX(float value);

	void setWeatherWindY(float value);

	float getWeatherWindX();

	float getWeatherWindY();

	float getMinX();

	float getMaxX();

	float getMinY();

	float getMaxY();

protected:
	Zone(DummyConstructorParameter* param);

	virtual ~Zone();

	String _return_getPlanetName;

	friend class ZoneHelper;
};

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {

class ZoneImplementation : public ManagedObjectImplementation, public QuadTree {
	int zoneID;

	ZoneProcessServerImplementation* processor;

	ObjectMap objectMap;

	ManagedReference<PlanetManager* > planetManager;

	ManagedReference<CreatureManager* > creatureManager;

	ManagedReference<ZoneServer* > server;

	Time galacticTime;

	HeightMap* heightMap;

	MapLocationTable mapLocations;

	float weatherWindX;

	float weatherWindY;

	unsigned int weatherID;

	bool weatherEnabled;

public:
	ZoneImplementation(ZoneServer* zserv, ZoneProcessServerImplementation* processor, int zoneid);

	ZoneImplementation(DummyConstructorParameter* param);

	void initializeTransientMembers();

	CloningBuildingObject* getNearestCloningBuilding(CreatureObject* creature);

	SceneObject* getNearestPlanetaryObject(SceneObject* object, unsigned int mapObjectLocationType);

	SortedVector<ManagedReference<SceneObject* > > getPlanetaryObjectList(unsigned int mapObjectLocationType);

	void insert(QuadTreeEntry* entry);

	void remove(QuadTreeEntry* entry);

	void update(QuadTreeEntry* entry);

	void inRange(QuadTreeEntry* entry, float range);

	void startManagers();

	void stopManagers();

	float getHeight(float x, float y);

	void addSceneObject(SceneObject* object);

	void sendMapLocationsTo(const String& planetName, SceneObject* player);

	void dropSceneObject(SceneObject* object);

	int getZoneID();

	String getPlanetName();

	PlanetManager* getPlanetManager();

	ZoneServer* getZoneServer();

	CreatureManager* getCreatureManager();

	unsigned long long getGalacticTime();

	unsigned int getWeatherID();

	void setWeatherID(unsigned int value);

	void changeWeatherID(int value);

	bool isWeatherEnabled();

	void setWeatherEnabled(bool value);

	void setWeatherWindX(float value);

	void setWeatherWindY(float value);

	float getWeatherWindX();

	float getWeatherWindY();

	float getMinX();

	float getMaxX();

	float getMinY();

	float getMaxY();

	Zone* _this;

	operator const Zone*();

	DistributedObjectStub* _getStub();
protected:
	virtual ~ZoneImplementation();

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

	friend class Zone;
};

class ZoneAdapter : public ManagedObjectAdapter {
public:
	ZoneAdapter(ZoneImplementation* impl);

	Packet* invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void initializeTransientMembers();

	CloningBuildingObject* getNearestCloningBuilding(CreatureObject* creature);

	SceneObject* getNearestPlanetaryObject(SceneObject* object, unsigned int mapObjectLocationType);

	void startManagers();

	void stopManagers();

	float getHeight(float x, float y);

	void addSceneObject(SceneObject* object);

	void sendMapLocationsTo(const String& planetName, SceneObject* player);

	void dropSceneObject(SceneObject* object);

	int getZoneID();

	String getPlanetName();

	PlanetManager* getPlanetManager();

	ZoneServer* getZoneServer();

	CreatureManager* getCreatureManager();

	unsigned long long getGalacticTime();

	unsigned int getWeatherID();

	void setWeatherID(unsigned int value);

	void changeWeatherID(int value);

	bool isWeatherEnabled();

	void setWeatherEnabled(bool value);

	void setWeatherWindX(float value);

	void setWeatherWindY(float value);

	float getWeatherWindX();

	float getWeatherWindY();

	float getMinX();

	float getMaxX();

	float getMinY();

	float getMaxY();

protected:
	String _param0_sendMapLocationsTo__String_SceneObject_;
};

class ZoneHelper : public DistributedObjectClassHelper, public Singleton<ZoneHelper> {
	static ZoneHelper* staticInitializer;

public:
	ZoneHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectServant* instantiateServant();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class Singleton<ZoneHelper>;
};

} // namespace zone
} // namespace server

using namespace server::zone;

#endif /*ZONE_H_*/
