/*
 * CityRemoveMilitiaMemberSuiCallback.h
 *
 *  Created on: Feb 19, 2012
 *      Author: swgemu
 */

#ifndef CITYREMOVEMILITIAMEMBERSUICALLBACK_H_
#define CITYREMOVEMILITIAMEMBERSUICALLBACK_H_

#include "engine/engine.h"
#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/managers/city/CityManager.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
	class CreatureObject;
}
namespace region {
	class CityRegion;
}
}
}
}

using namespace server::zone::objects::creature;
using namespace server::zone::objects::region;

class CityRemoveMilitiaMemberSuiCallback : public SuiCallback {
	ManagedWeakReference<NewCityRegion*> cityRegion;

public:
	CityRemoveMilitiaMemberSuiCallback(ZoneServer* server, NewCityRegion* city) : SuiCallback(server) {
		cityRegion = city;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		ManagedReference<CityRemoveMilitiaSession*> session = player->getActiveSession(SessionFacadeType::CITYMILITIA).castTo<CityRemoveMilitiaSession*>();

		if (session == nullptr)
			return;

		ManagedReference<NewCityRegion*> city = cityRegion.get();

		if (city == nullptr || cancelPressed) {
			session->cancelSession();
			return;
		}

		CityManager* cityManager = server->getCityManager();
		cityManager->removeMilitiaMember(city, player, session->getMilitiaID());

		session->cancelSession();
	}
};

#endif /* CITYREMOVEMILITIAMEMBERSUICALLBACK_H_ */
