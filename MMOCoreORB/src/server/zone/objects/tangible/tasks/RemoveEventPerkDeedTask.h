
#ifndef REMOVEEVENTPERKDEEDTASK_H_
#define REMOVEEVENTPERKDEEDTASK_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/tangible/deed/eventperk/EventPerkDeed.h"

namespace server {
namespace zone {
namespace objects {
namespace tangible {
namespace tasks {

class RemoveEventPerkDeedTask : public Task {
	ManagedWeakReference<EventPerkDeed*> deed;

public:
	RemoveEventPerkDeedTask(EventPerkDeed* de) {
		deed = de;
	}

	void run() {
		auto deed = this->deed.get();

		if (deed == nullptr) {
			return;
		}

		Locker locker(deed);

		ManagedReference<TangibleObject*> genOb = deed->getGeneratedObject().get();
		ManagedReference<CreatureObject*> player = deed->getOwner().get();

		if (genOb != nullptr) {
			Locker clocker(genOb, deed);

			// Destroy any child objects
			genOb->destroyChildObjects();

			// Destroy the Perk Object and anything within
			genOb->destroyObjectFromWorld(true);
			genOb->destroyObjectFromDatabase(true);
		} else if (player != nullptr) {
			player->sendSystemMessage("@event_perk:deed_expired"); // Your unused Rental Deed expired and has been removed from your inventory.
		}

		// Destroy the Deed
		deed->destroyObjectFromWorld(true);
		deed->destroyObjectFromDatabase();
	}
};

} // namespace tasks
} // namespace tangible
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::tangible::tasks;

#endif /* REMOVEEVENTPERKDEEDTASK_H_ */
