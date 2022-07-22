/*
 * InsertedAsPilotCallback.h
 *
 *  Created on: Sep 5, 2011
 *      Author: theanswer
 */

#ifndef INSERTEDASPILOTCALLBACK_H_
#define INSERTEDASPILOTCALLBACK_H_

#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/DataTransform.h"

class InsertedAsPilotCallback : public MessageCallback {
	uint32 movementCounter;

	ObjectControllerMessageCallback* objectControllerMain;
public:
	InsertedAsPilotCallback(ObjectControllerMessageCallback* objectControllerCallback) :
		MessageCallback(objectControllerCallback->getClient(), objectControllerCallback->getServer()),
		movementCounter(0), objectControllerMain(objectControllerCallback) {
	}

	void parse(Message* message) {
		movementCounter = message->parseInt();
	}

	void run() {
		ManagedReference<CreatureObject*> player = client->getPlayer();

		if (player == nullptr)
			return;

		PlayerObject* ghost = player->getPlayerObject();

		if (ghost != nullptr)
			ghost->setTeleporting(false);

		player->setPosition(0,0,0);
		DataTransform* pack = new DataTransform(player->asSceneObject());
		player->broadcastMessage(pack, true);

	}
};


#endif /* INSERTEDASPILOTCALLBACK_H_ */
