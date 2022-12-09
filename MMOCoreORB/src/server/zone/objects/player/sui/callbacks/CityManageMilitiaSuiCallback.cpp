/*
 * CityManageMilitiaSuiCallback.cpp
 *
 *  Created on: Feb 19, 2012
 *      Author: xyborn
 */

#include "CityManageMilitiaSuiCallback.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/managers/city/CityManager.h"
#include "server/zone/objects/region/NewCityRegion.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/sessions/CityRemoveMilitiaSession.h"

void CityManageMilitiaSuiCallback::run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
	bool cancelPressed = (eventIndex == 1);

	if (!suiBox->isListBox() || player == nullptr || cancelPressed || args->size() <= 0)
		return;

	ManagedReference<NewCityRegion*> city = cityRegion.get();

	if (city == nullptr)
		return;

	int index = Integer::valueOf(args->get(0).toString());

	SuiListBox* listBox = cast<SuiListBox*>(suiBox);

	if (index < 0 || index > listBox->getMenuSize())
		return;

	uint64 objectid = listBox->getMenuObjectID(index);

	CityManager* cityManager = server->getCityManager();

	if (objectid == 0) { //Add militia member dialog
		cityManager->promptAddMilitiaMember(city, player, suiBox->getUsingObject().get());
	} else {
		ManagedReference<CityRemoveMilitiaSession*> session = new CityRemoveMilitiaSession(player, city, objectid);
		player->addActiveSession(SessionFacadeType::CITYMILITIA, session);
		session->initializeSession();
	}
}
