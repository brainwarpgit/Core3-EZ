/*
 *	server/zone/managers/city/CityManager.h generated by engine3 IDL compiler 0.60
 */

#ifndef CITYMANAGER_H_
#define CITYMANAGER_H_

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
namespace objects {
namespace creature {

class CreatureObject;

} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature;

namespace server {
namespace chat {

class StringIdChatParameter;

} // namespace chat
} // namespace server

using namespace server::chat;

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
namespace objects {
namespace region {

class CityRegion;

} // namespace region
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::region;

namespace server {
namespace zone {
namespace objects {
namespace waypoint {

class WaypointObject;

} // namespace waypoint
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::waypoint;

namespace server {
namespace zone {
namespace objects {
namespace structure {

class StructureObject;

} // namespace structure
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::structure;

#include "server/chat/StringIdChatParameter.h"

#include "server/zone/managers/city/CitiesAllowed.h"

#include "server/zone/managers/city/CitySpecialization.h"

#include "server/zone/managers/city/CitySpecializationMap.h"

#include "server/zone/managers/city/CityTax.h"

#include "server/zone/managers/city/CityTaxMap.h"

#include "engine/core/ManagedService.h"

#include "engine/log/Logger.h"

#include "system/util/SortedVector.h"

#include "system/util/VectorMap.h"

#include "system/util/Vector.h"

#include "system/util/HashTable.h"

namespace server {
namespace zone {
namespace managers {
namespace city {

class CityManager : public ManagedService {
public:
	static const byte CLIENT = 0;

	static const byte OUTPOST = 1;

	static const byte VILLAGE = 2;

	static const byte TOWNSHIP = 3;

	static const byte CITY = 4;

	static const byte METROPOLIS = 5;

	CityManager(ZoneServer* zserv);

	void loadLuaConfig();

	void loadCityRegions();

	bool validateCityName(const String& name);

	bool isCityInRange(Zone* zone, float x, float y);

	CityRegion* createCity(CreatureObject* mayor, const String& cityName, float x, float y);

	void processCityUpdate(CityRegion* city);

	void processIncomeTax(CityRegion* city);

	void updateCityVoting(CityRegion* city, bool override = false);

	void deductCityMaintenance(CityRegion* city);

	int collectNonStructureMaintenance(SceneObject* object, CityRegion* city, int maintenanceDue);

	int collectCivicStructureMaintenance(StructureObject* structure, CityRegion* city, int maintenanceDue);

	void sendMaintenanceEmail(CityRegion* city, int maintenancePaid);

	void sendMaintenanceDecayEmail(CityRegion* city, StructureObject* structure, int maintenanceDue);

	void sendMaintenanceDestroyEmail(CityRegion* city, StructureObject* structure);

	void contractCity(CityRegion* city);

	void expandCity(CityRegion* city);

	void destroyCity(CityRegion* city);

	void sendStatusReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptCitySpecialization(CityRegion* city, CreatureObject* mayor, SceneObject* terminal = NULL);

	void changeCitySpecialization(CityRegion* city, CreatureObject* mayor, const String& spec);

	void promptWithdrawCityTreasury(CityRegion* city, CreatureObject* mayor, SceneObject* terminal = NULL);

	void promptDepositCityTreasury(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void withdrawFromCityTreasury(CityRegion* city, CreatureObject* mayor, int value, const String& reason, SceneObject* terminal = NULL);

	void depositToCityTreasury(CityRegion* city, CreatureObject* creature, int value);

	void sendTreasuryReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void sendCitizenshipReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void registerCitizen(CityRegion* city, CreatureObject* creature);

	void unregisterCitizen(CityRegion* city, CreatureObject* creature, bool inactive = false);

	void sendManageMilitia(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptAddMilitiaMember(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void addMilitiaMember(CityRegion* city, CreatureObject* mayor, const String& playerName);

	void removeMilitiaMember(CityRegion* city, CreatureObject* mayor, unsigned long long militiaid);

	void sendCityAdvancement(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptRegisterCity(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptUnregisterCity(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void registerCity(CityRegion* city, CreatureObject* mayor);

	void unregisterCity(CityRegion* city, CreatureObject* mayor);

	void promptAdjustTaxes(CityRegion* city, CreatureObject* mayor, SceneObject* terminal = NULL);

	void promptSetTax(CityRegion* city, CreatureObject* mayor, int selectedTax, SceneObject* terminal = NULL);

	void setTax(CityRegion* city, CreatureObject* mayor, int selectedTax, int value);

	void sendMaintenanceReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void sendMail(CityRegion* city, const String& sender, const UnicodeString& subject, StringIdChatParameter& params, WaypointObject* waypoint);

	bool containsCityName(const String& name);

	bool isCityRankCapped(const String& planetName, byte cityRank);

	void sendCityReport(CreatureObject* creature, const String& planetName, byte rank);

	bool validateCityInRange(CreatureObject* creature, Zone* zone, float x, float y);

	void toggleZoningEnabled(CityRegion* city, CreatureObject* mayor);

	int getTotalCities();

	void sendMayoralStandings(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptMayoralVote(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void registerForMayoralRace(CityRegion* city, CreatureObject* creature);

	void castMayoralVote(CityRegion* city, CreatureObject* creature, unsigned long long oid);

	void sendStructureReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void fixMayor(CityRegion* city, CreatureObject* mayor);

	bool canSupportMoreDecorations(CityRegion* city);

	CitySpecialization* getCitySpecialization(const String& cityspec);

	CityTax* getCityTax(int idx);

	DistributedObjectServant* _getImplementation();
	DistributedObjectServant* _getImplementationForRead();

	void _setImplementation(DistributedObjectServant* servant);

protected:
	CityManager(DummyConstructorParameter* param);

	virtual ~CityManager();

	friend class CityManagerHelper;
};

} // namespace city
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::city;

namespace server {
namespace zone {
namespace managers {
namespace city {

class CityManagerImplementation : public ManagedServiceImplementation, public Logger {
	ManagedReference<ZoneServer* > zoneServer;

public:
	static Vector<unsigned short> radiusPerRank;

	static Vector<byte> citizensPerRank;

private:
	static CitiesAllowed citiesAllowedPerRank;

	static CitySpecializationMap citySpecializations;

	static CityTaxMap cityTaxes;

public:
	static int cityUpdateInterval;

	static int newCityGracePeriod;

	unsigned static long long citySpecializationCooldown;

	static int cityVotingDuration;

	unsigned static long long treasuryWithdrawalCooldown;

	static byte cityVotingCycles;

	static byte cityVotingCyclesUntilLocked;

	static int decorationsPerRank;

	static float maintenanceDiscount;

private:
	VectorMap<String, ManagedReference<CityRegion* > > cities;

public:
	static const byte CLIENT = 0;

	static const byte OUTPOST = 1;

	static const byte VILLAGE = 2;

	static const byte TOWNSHIP = 3;

	static const byte CITY = 4;

	static const byte METROPOLIS = 5;

	CityManagerImplementation(ZoneServer* zserv);

	CityManagerImplementation(DummyConstructorParameter* param);

	void loadLuaConfig();

	void loadCityRegions();

	bool validateCityName(const String& name);

	bool isCityInRange(Zone* zone, float x, float y);

	CityRegion* createCity(CreatureObject* mayor, const String& cityName, float x, float y);

	void processCityUpdate(CityRegion* city);

	void processIncomeTax(CityRegion* city);

	void updateCityVoting(CityRegion* city, bool override = false);

	void deductCityMaintenance(CityRegion* city);

	int collectNonStructureMaintenance(SceneObject* object, CityRegion* city, int maintenanceDue);

	int collectCivicStructureMaintenance(StructureObject* structure, CityRegion* city, int maintenanceDue);

	void sendMaintenanceEmail(CityRegion* city, int maintenancePaid);

	void sendMaintenanceDecayEmail(CityRegion* city, StructureObject* structure, int maintenanceDue);

	void sendMaintenanceDestroyEmail(CityRegion* city, StructureObject* structure);

	void contractCity(CityRegion* city);

	void expandCity(CityRegion* city);

	void destroyCity(CityRegion* city);

	void sendStatusReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptCitySpecialization(CityRegion* city, CreatureObject* mayor, SceneObject* terminal = NULL);

	void changeCitySpecialization(CityRegion* city, CreatureObject* mayor, const String& spec);

	void promptWithdrawCityTreasury(CityRegion* city, CreatureObject* mayor, SceneObject* terminal = NULL);

	void promptDepositCityTreasury(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void withdrawFromCityTreasury(CityRegion* city, CreatureObject* mayor, int value, const String& reason, SceneObject* terminal = NULL);

	void depositToCityTreasury(CityRegion* city, CreatureObject* creature, int value);

	void sendTreasuryReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void sendCitizenshipReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void registerCitizen(CityRegion* city, CreatureObject* creature);

	void unregisterCitizen(CityRegion* city, CreatureObject* creature, bool inactive = false);

	void sendManageMilitia(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptAddMilitiaMember(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void addMilitiaMember(CityRegion* city, CreatureObject* mayor, const String& playerName);

	void removeMilitiaMember(CityRegion* city, CreatureObject* mayor, unsigned long long militiaid);

	void sendCityAdvancement(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptRegisterCity(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptUnregisterCity(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void registerCity(CityRegion* city, CreatureObject* mayor);

	void unregisterCity(CityRegion* city, CreatureObject* mayor);

	void promptAdjustTaxes(CityRegion* city, CreatureObject* mayor, SceneObject* terminal = NULL);

	void promptSetTax(CityRegion* city, CreatureObject* mayor, int selectedTax, SceneObject* terminal = NULL);

	void setTax(CityRegion* city, CreatureObject* mayor, int selectedTax, int value);

	void sendMaintenanceReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void sendMail(CityRegion* city, const String& sender, const UnicodeString& subject, StringIdChatParameter& params, WaypointObject* waypoint);

	bool containsCityName(const String& name);

	bool isCityRankCapped(const String& planetName, byte cityRank);

	void sendCityReport(CreatureObject* creature, const String& planetName, byte rank);

	bool validateCityInRange(CreatureObject* creature, Zone* zone, float x, float y);

	void toggleZoningEnabled(CityRegion* city, CreatureObject* mayor);

	int getTotalCities();

	void sendMayoralStandings(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void promptMayoralVote(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void registerForMayoralRace(CityRegion* city, CreatureObject* creature);

	void castMayoralVote(CityRegion* city, CreatureObject* creature, unsigned long long oid);

	void sendStructureReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal = NULL);

	void fixMayor(CityRegion* city, CreatureObject* mayor);

	bool canSupportMoreDecorations(CityRegion* city);

	CitySpecialization* getCitySpecialization(const String& cityspec);

	CityTax* getCityTax(int idx);

	WeakReference<CityManager*> _this;

	operator const CityManager*();

	DistributedObjectStub* _getStub();
	virtual void readObject(ObjectInputStream* stream);
	virtual void writeObject(ObjectOutputStream* stream);
protected:
	virtual ~CityManagerImplementation();

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

	friend class CityManager;
};

class CityManagerAdapter : public ManagedServiceAdapter {
public:
	CityManagerAdapter(CityManager* impl);

	void invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void loadLuaConfig();

	void loadCityRegions();

	bool validateCityName(const String& name);

	bool isCityInRange(Zone* zone, float x, float y);

	CityRegion* createCity(CreatureObject* mayor, const String& cityName, float x, float y);

	void processCityUpdate(CityRegion* city);

	void processIncomeTax(CityRegion* city);

	void updateCityVoting(CityRegion* city, bool override);

	void deductCityMaintenance(CityRegion* city);

	int collectNonStructureMaintenance(SceneObject* object, CityRegion* city, int maintenanceDue);

	int collectCivicStructureMaintenance(StructureObject* structure, CityRegion* city, int maintenanceDue);

	void sendMaintenanceEmail(CityRegion* city, int maintenancePaid);

	void sendMaintenanceDecayEmail(CityRegion* city, StructureObject* structure, int maintenanceDue);

	void sendMaintenanceDestroyEmail(CityRegion* city, StructureObject* structure);

	void contractCity(CityRegion* city);

	void expandCity(CityRegion* city);

	void destroyCity(CityRegion* city);

	void sendStatusReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void promptCitySpecialization(CityRegion* city, CreatureObject* mayor, SceneObject* terminal);

	void changeCitySpecialization(CityRegion* city, CreatureObject* mayor, const String& spec);

	void promptWithdrawCityTreasury(CityRegion* city, CreatureObject* mayor, SceneObject* terminal);

	void promptDepositCityTreasury(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void withdrawFromCityTreasury(CityRegion* city, CreatureObject* mayor, int value, const String& reason, SceneObject* terminal);

	void depositToCityTreasury(CityRegion* city, CreatureObject* creature, int value);

	void sendTreasuryReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void sendCitizenshipReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void registerCitizen(CityRegion* city, CreatureObject* creature);

	void unregisterCitizen(CityRegion* city, CreatureObject* creature, bool inactive);

	void sendManageMilitia(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void promptAddMilitiaMember(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void addMilitiaMember(CityRegion* city, CreatureObject* mayor, const String& playerName);

	void removeMilitiaMember(CityRegion* city, CreatureObject* mayor, unsigned long long militiaid);

	void sendCityAdvancement(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void promptRegisterCity(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void promptUnregisterCity(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void registerCity(CityRegion* city, CreatureObject* mayor);

	void unregisterCity(CityRegion* city, CreatureObject* mayor);

	void promptAdjustTaxes(CityRegion* city, CreatureObject* mayor, SceneObject* terminal);

	void promptSetTax(CityRegion* city, CreatureObject* mayor, int selectedTax, SceneObject* terminal);

	void setTax(CityRegion* city, CreatureObject* mayor, int selectedTax, int value);

	void sendMaintenanceReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	bool containsCityName(const String& name);

	bool isCityRankCapped(const String& planetName, byte cityRank);

	void sendCityReport(CreatureObject* creature, const String& planetName, byte rank);

	bool validateCityInRange(CreatureObject* creature, Zone* zone, float x, float y);

	void toggleZoningEnabled(CityRegion* city, CreatureObject* mayor);

	int getTotalCities();

	void sendMayoralStandings(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void promptMayoralVote(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void registerForMayoralRace(CityRegion* city, CreatureObject* creature);

	void castMayoralVote(CityRegion* city, CreatureObject* creature, unsigned long long oid);

	void sendStructureReport(CityRegion* city, CreatureObject* creature, SceneObject* terminal);

	void fixMayor(CityRegion* city, CreatureObject* mayor);

	bool canSupportMoreDecorations(CityRegion* city);

};

class CityManagerHelper : public DistributedObjectClassHelper, public Singleton<CityManagerHelper> {
	static CityManagerHelper* staticInitializer;

public:
	CityManagerHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectServant* instantiateServant();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class Singleton<CityManagerHelper>;
};

} // namespace city
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::city;

#endif /*CITYMANAGER_H_*/
