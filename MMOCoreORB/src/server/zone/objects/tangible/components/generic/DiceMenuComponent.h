/*
 * DiceMenuComponent
 *
 *  Created on: 1/1/2012
 *      Author: kyle
 */

#ifndef DICEMENUCOMPONENT_H_
#define DICEMENUCOMPONENT_H_

#include "server/zone/objects/tangible/components//TangibleObjectMenuComponent.h"
#include "system/lang/String.h"
#include "system/platform.h"
#include "templates/tangible/DiceTemplate.h"

class DiceTemplate;
namespace server {
namespace zone {
namespace objects {
namespace creature {
class CreatureObject;
}  // namespace creature
namespace scene {
class SceneObject;
}  // namespace scene
}  // namespace objects
namespace packets {
namespace object {
class ObjectMenuResponse;
}  // namespace object
}  // namespace packets
}  // namespace zone
}  // namespace server


class DiceMenuComponent : public TangibleObjectMenuComponent {
public:

	/**
	 * Fills the radial options, needs to be overriden
	 * @pre { this object is locked }
	 * @post { this object is locked, menuResponse is complete}
	 * @param menuResponse ObjectMenuResponse that will be sent to the client
	 */
	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;

	/**
	 * Handles the radial selection sent by the client, must be overriden by inherited objects
	 * @pre { this object is locked, player is locked }
	 * @post { this object is locked, player is locked }
	 * @param player PlayerCreature that selected the option
	 * @param selectedID selected menu id
	 * @returns 0 if successfull
	 */
	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;

	void doRoll(CreatureObject* player, DiceTemplate* diceTemplate, int sides, const String& sidesText, int numRoll) const;
};


#endif /* DICEMENUCOMPONENT_H_ */
