/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef PLAYERSNEARYOU_H_
#define PLAYERSNEARYOU_H_

#include "ObjectControllerMessage.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/planet/PlanetManager.h"

class PlayersNearYouMessage : public ObjectControllerMessage {
public:
	PlayersNearYouMessage(CreatureObject* creo) : ObjectControllerMessage(creo->getObjectID(), 0x0B, 0x1E7) {
		insertInt(0); // No players.
	}

	void addFoundPlayer(CreatureObject* player) {
		// Bitmask.
		PlayerObject* ghost = player->getPlayerObject();

		if (ghost != nullptr) {
			if (ghost->isLFG()) {
				insertInt(1);
				insertInt(PlayerBitmasks::LFG);
			}

			if (ghost->isNewbieHelper()) {
				insertInt(1);
				insertInt(PlayerBitmasks::NEWBIEHELPER);
			}

			if (ghost->isRoleplayer()) {
				insertInt(1);
				insertInt(PlayerBitmasks::ROLEPLAYER);
			}
		}

		insertUnicode(player->getDisplayedName()); // Player name.

		uint32 race = player->getSpecies();

		insertInt(race); // Race ID

		String regionName = "";
		String zoneName = "";

		Zone* zone = player->getZone();

		if (zone != nullptr) {
			zoneName = zone->getZoneName();

			PlanetManager* planetManager = zone->getPlanetManager();
			CityRegion* cityRegion = planetManager->getRegionAt(player->getWorldPositionX(), player->getWorldPositionY());

			if (cityRegion != nullptr)
				regionName = cityRegion->getRegionName();
		}

		insertAscii(regionName); //Region Name
		insertAscii(zoneName); //Planet

		String guildName = "";

		if (player->isInGuild()) {
			ManagedReference<GuildObject*> guild = player->getGuildObject().get();
			guildName = guild->getGuildName();
		}

		insertAscii(guildName);

		String title = "";

		if (ghost != nullptr)
			title = ghost->getTitle();

		insertAscii(title); // Profession Title
	}

	void insertPlayerCounter(uint32 foundCount) {
		insertInt(30, foundCount);
	}

};

#endif /*PLAYERSNEARYOU_H_*/
