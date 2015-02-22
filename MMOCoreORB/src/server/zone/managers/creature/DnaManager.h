/*
 *
 * DNAManager.h
 *
 *  Created on: July 7, 2013
 *      Author: washu
 */

#ifndef DNAMANAGER_H_
#define DNAMANAGER_H_

#include "engine/engine.h"
#include "DnaSampleRange.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/Creature.h"
#include "server/zone/objects/tangible/deed/pet/PetDeed.h"
namespace server {
namespace zone {
namespace managers {
namespace creature {

class DnaManager : public Singleton<DnaManager>, public Object, public Logger {
protected:
	HashTable<uint32, DnaSampleRange* > dexerity;
	HashTable<uint32, DnaSampleRange* > fortitude;
	HashTable<uint32, DnaSampleRange* > endurance;
	HashTable<uint32, DnaSampleRange* > intelligence;
	HashTable<uint32, DnaSampleRange* > hardiness;
	HashTable<uint32, DnaSampleRange* > power;
	HashTable<uint32, DnaSampleRange* > cleverness;
	HashTable<uint32, DnaSampleRange* > courage;
	HashTable<uint32, DnaSampleRange* > dependency;
	HashTable<uint32, DnaSampleRange* > fierceness;
	HashTable<int,uint32> qualityTemplates;
	Lua* lua;
	static AtomicInteger loadedDnaData;
public:
	DnaManager();
	virtual ~DnaManager();
	void loadSampleData();
	int generateXp(int creatureLevel);
	static int addRange(lua_State* L);
	static int addQualityTemplate(lua_State* L);
	enum {
		FORTITUDE     = 1,
		ENDURANCE     = 2,
		CLEVERNESS    = 3,
		INTELLIGENCE  = 4,
		DEXTERITY     = 5,
		HARDINESS     = 6,
		DEPENDABILITY = 7,
		COURAGE       = 8,
		POWER         = 9,
		FIERCENESS    = 10
	};
	int generateScoreFor(int stat, int cl,int quality);
	void generateSample(Creature* creature, CreatureObject* player, int quality);
	void generationalSample(PetDeed* deed, CreatureObject* player, int quality);
	int getLevelForStat(int stat, int value);
protected:
	int reduceByPercent(int source, int percent) {
		float reduceBy = (100.0 - (float)percent) / 100.0;
		uint32 newValue = (int)( ((float)source) * reduceBy );
		if (newValue < 1)
			newValue = 1;
		return newValue;
	}
};

}
}
}
}

using namespace server::zone::managers::creature;

#endif /* DNAMANAGER_H_ */
