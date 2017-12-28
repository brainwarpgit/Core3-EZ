#include "ScreenPlayTask.h"

#include "server/ServerCore.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "system/thread/Locker.h"

void ScreenPlayTask::run() {
	ZoneServer* zoneServer = ServerCore::getZoneServer();

	if (zoneServer == NULL || zoneServer->isServerShuttingDown())
		return;

	if (zoneServer->isServerLoading()) {
		schedule(10000);

		return;
	}

	ManagedReference<SceneObject*> obj = this->obj.get();

	if (obj != NULL) {
		Locker locker(obj);

		DirectorManager::instance()->activateEvent(this);
	} else {
		DirectorManager::instance()->activateEvent(this);
	}
}
