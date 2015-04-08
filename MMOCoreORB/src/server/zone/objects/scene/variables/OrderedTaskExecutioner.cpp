/*
 * OrderedTaskExecutioner.cpp
 *
 *  Created on: Apr 14, 2015
 *      Author: TheAnswer
 */

#include "OrderedTaskExecutioner.h"
#include "PendingTasksMap.h"

using namespace server::zone::objects::scene::variables;
using namespace server::zone::objects::scene;

OrderedTaskExecutioner::OrderedTaskExecutioner(SceneObject* sceneObject) : sceneObject(sceneObject) {

}

void OrderedTaskExecutioner::run() {
	Reference<SceneObject*> strongReference = sceneObject.get();

	if (strongReference == NULL)
		return;

	//no lock on getPendingTasks() is safe due to using the container lock

	PendingTasksMap* pendingTasks = strongReference->getPendingTasks();

	Reference<Task*> task = pendingTasks->getNextOrderedTask();

	if (task != NULL) {
		try {
			task->run();
		} catch (...) {

		}

		pendingTasks->runMoreOrderedTasks(strongReference);
	}
}
