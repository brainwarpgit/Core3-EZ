/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#include "CommandQueue.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/objects/creature/variables/CommandQueueActionVector.h"
#include "server/zone/packets/object/CommandQueueRemove.h"
#include "server/zone/packets/object/CommandQueueAdd.h"
#include "templates/params/ObserverEventType.h"

CommandQueue::CommandQueue() {
#ifdef DEBUG_QUEUE
	Logger::console.info(true) << __FUNCTION__ << "() called on " << toString();
#endif // DEBUG_QUEUE
}

CommandQueue::~CommandQueue() {
#ifdef DEBUG_QUEUE
	Logger::console.info(true) << __FUNCTION__ << "() called on " << toString();
#endif // DEBUG_QUEUE
	if (queueTask != nullptr) {
		queueTask->cancel();
		queueTask = nullptr;
	}
}

void CommandQueue::initialize(CreatureObject* creature) {
	if (creature == nullptr) {
		return;
	}

	weakCreature = creature;
	queueTask = new CommandQueueTask(this);
	state = WAITING;

	clearQueueActions(false);

#ifdef DEBUG_QUEUE
	runNumber = 1;
	Logger::console.info(true) << __FUNCTION__ << "(" << creature << ") called on " << toString();
#endif // DEBUG_QUEUE
}

void CommandQueue::removeAction(CommandQueueAction* actionToDelete) {
	if (actionToDelete == nullptr)
		return;

	//Locker lock(&queueMutex);

	for (int i = 0; i < queueVector.size(); i++) {
		CommandQueueAction* action = queueVector.get(i);

		if (action == actionToDelete) {
			queueVector.remove(i);

#ifdef DEBUG_QUEUE
			printf(" Queue action removed. Queue Size: %i \n", queueVector.size());
#endif
			break;
		}
	}
}

int CommandQueue::handleRunningState() {
	auto creature = weakCreature.get();

	if (creature == nullptr || queueVector.size() == 0)
		return 0;

#ifdef DEBUG_QUEUE
	creature->info("CommandQueue - handleRunningState called", true);
#endif

	ZoneServer* zoneServer = creature->getZoneServer();

	if (zoneServer == nullptr) {
		return 0;
	}

	auto objectController = zoneServer->getObjectController();

	if (objectController == nullptr) {
		return 0;
	}

	//Locker lock(&queueMutex);

	Reference<CommandQueueAction*> action = nullptr;
	const QueueCommand* queueCommand = nullptr;

	// Check queue for immediate actions, they get executed first
	for (int i = 0; i < queueVector.size(); i++) {
		CommandQueueAction* immediateAction = queueVector.get(i);

		if (immediateAction == nullptr)
			continue;

		queueCommand = objectController->getQueueCommand(immediateAction->getCommand());

		if (queueCommand != nullptr && queueCommand->getDefaultPriority() == QueueCommand::IMMEDIATE) {

			action = immediateAction;
			break;
		}
	}

	// None of the queue actions were immediate, select first command in the queue
	if (action == nullptr) {
		action = queueVector.get(0);
	}

	float time = 0.1f;

	if (action != nullptr) {
		queueCommand = objectController->getQueueCommand(action->getCommand());

		if (queueCommand == nullptr)
			return time;

		int priority = queueCommand->getDefaultPriority();

#ifdef DEBUG_QUEUE
		creature->info("Command Name: " + queueCommand->getName() + "  with a priority of " + priority);
#endif

		Time* nextActionTime = creature->getNextActionTime();

		if (nextActionTime == nullptr)
			return 0;

		if (priority == QueueCommand::NORMAL && nextActionTime->isFuture()) {
			Time currTime;
			int remainingActionTime = nextActionTime->getMiliTime() - currTime.getMiliTime();

#ifdef DEBUG_QUEUE
			creature->info("Next normal action is future returning time of " + String::valueOf(nextActionTime), true);
#endif

			return remainingActionTime;
		}

		if (queueCommand->addToCombatQueue() && ((creature->hasPostureChangeDelay() && priority != QueueCommand::IMMEDIATE) || creature->hasAttackDelay())) {
			return DEFAULTTIME;
		}

		time = objectController->activateCommand(creature, action->getCommand(), action->getActionCounter(), action->getTarget(), action->getArguments());

#ifdef DEBUG_QUEUE
		creature->info("Command Queue activateCommand called -- time = " + String::valueOf(time) + ". ", true);
#endif

		removeAction(action);

		nextActionTime->updateToCurrentTime();
		nextActionTime->addMiliTime((uint32)(time * 1000));
	}

	return time;
}

void CommandQueue::run() {
	auto creature = weakCreature.get();

	if (creature == nullptr)
		return;

	Locker lock(creature);

	int size = queueVector.size();

#ifdef DEBUG_QUEUE
	auto debugMsg = [&]() -> LoggerHelper {
		auto msg = creature->info(true);
		msg << "CommandQueue::run() " << toString() << ": ";
		return msg;
	};

	runNumber++;
	debugMsg() << "START";
	lastRun.updateToCurrentTime();
	Timer profile;
	profile.start();
#endif // DEBUG_QUEUE

	switch (state) {
		case WAITING: {
			if (size == 0) {
				break;
			}

			state = RUNNING;
		}
		case RUNNING: {
			if (size == 0) {
				state = WAITING;
				break;
			}

			int time = handleRunningState();

			if (creature->hasAttackDelay() || creature->hasPostureChangeDelay()) {
				state = DELAY;
				time = DEFAULTTIME;
			}

			if (time <= 0)
				time = DEFAULTTIME;

			queueTask->reschedule(time);

			break;
		}
		case DELAY: {
			if (!creature->hasAttackDelay() && !creature->hasPostureChangeDelay()) {
				state = WAITING;
			}

			if (!creature->hasAttackDelay() && checkForImmediateActions(creature))
				state = RUNNING;

			queueTask->reschedule(DEFAULTTIME);
		}
		default:
			break;
	}

#ifdef DEBUG_QUEUE
	debugMsg() << "FINISHED after " << Logger::nsToString(profile.stop()) << "; isScheduled=" << queueTask->isScheduled();
#endif // DEBUG_QUEUE
}

bool CommandQueue::checkForImmediateActions(CreatureObject* creature) {
	if (creature == nullptr)
		return false;

	ZoneServer* zoneServer = creature->getZoneServer();

	if (zoneServer == nullptr) {
		return false;
	}

	auto objectController = zoneServer->getObjectController();

	if (objectController == nullptr) {
		return false;
	}

	//Locker lock(&queueMutex);

	for (int i = 0; i < queueVector.size(); i++) {
		CommandQueueAction* action = queueVector.get(i);

		if (action == nullptr)
			continue;

		const QueueCommand* queueCommand = objectController->getQueueCommand(action->getCommand());

		if (queueCommand != nullptr && queueCommand->getDefaultPriority() == QueueCommand::IMMEDIATE) {
			return true;
		}
	}

	return false;
}

void CommandQueue::clearQueueAction(unsigned int actioncntr, float timer, unsigned int tab1, unsigned int tab2) {
	auto creature = weakCreature.get();

	if (actioncntr == 0 || creature == nullptr || !creature->isPlayerCreature())
		return;

	//Locker lock(&queueMutex);

	BaseMessage* queuemsg = new CommandQueueRemove(creature, actioncntr, timer, tab1, tab2);
	creature->sendMessage(queuemsg);
}

void CommandQueue::enqueueCommand(unsigned int actionCRC, unsigned int actionCount, uint64 targetID, const UnicodeString& arguments, int priority, int compareCounter) {
	auto creature = weakCreature.get();

	if (creature == nullptr) {
		return;
	}

#ifdef DEBUG_QUEUE
	creature->info("CommandQueue - enqueueCommand Called", true);
#endif

	ZoneServer* zoneServer = creature->getZoneServer();

	if (zoneServer == nullptr)
		return;

	auto objectController = zoneServer->getObjectController();

	if (objectController == nullptr)
		return;

	const QueueCommand* queueCommand = objectController->getQueueCommand(actionCRC);

	if (queueCommand == nullptr) {
		return;
	}

	//Locker lock(&queueMutex);

	if (creature->isPlayerCreature() && queueCommand->addToCombatQueue()) {
		creature->notifyObservers(ObserverEventType::COMBATCOMMANDENQUEUED);
	}

	if (priority < 0) {
		priority = queueCommand->getDefaultPriority();
	}

	Reference<CommandQueueAction*> action = nullptr;

	int size = queueVector.size();

	if (priority != QueueCommand::FRONT) {
		if ((creature->isAiAgent() && size >= 5) || size > 15) {
			clearQueueAction(actionCount, 0, 0, 0);
			return;
		}
	}

	action = new CommandQueueAction(creature, targetID, actionCRC, actionCount, arguments);

	if (compareCounter >= 0)
		action->setCompareToCounter((int)compareCounter);

#ifdef DEBUG_QUEUE
	creature->info("Enquing Command " + queueCommand->getQueueCommandName() + ": with priority - " + String::valueOf(priority) + " compareCount of " + String::valueOf(compareCounter), true);
#endif

	Time* nextAction = creature->getNextActionTime();

	if (queueVector.size() != 0 || (nextAction != nullptr && !nextAction->isPast())) {
		if (priority == QueueCommand::FRONT) {
			action->setCompareToCounter(queueVector.get(0)->getCompareToCounter() - 1);
		}

		queueVector.put(action.get());

#ifdef DEBUG_QUEUE
		creature->info("Queue Vector size after added command: " + String::valueOf(queueVector.size()), true);
#endif
	} else {
		nextAction->updateToCurrentTime();

		queueVector.put(action.get());

#ifdef DEBUG_QUEUE
		creature->info("Queue Vector size after added command: " + String::valueOf(queueVector.size()), true);
#endif
	}

	if (state == WAITING && !queueTask->isScheduled()) {
#ifdef DEBUG_QUEUE
	creature->info(true) << toString() << " Scheduling for DEFAULTTIME.";
#endif // DEBUG_QUEUE
		queueTask->schedule(DEFAULTTIME);
	}

#ifdef DEBUG_QUEUE
	creature->info(true) << "enqueueCommand finished: " << toString();
#endif // DEBUG_QUEUE
}

void CommandQueue::sendCommand(uint32 crc, const UnicodeString& args, uint64 targetID, int priority) {
	auto creature = weakCreature.get();

	if (creature == nullptr)
		return;

	uint32 nextCounter = creature->incrementLastActionCounter();

	CommandQueueAdd* msg = new CommandQueueAdd(creature, crc, nextCounter);
	creature->sendMessage(msg);

	int compareCnt = -1;

	if (queueVector.size() == 0 || priority == QueueCommand::FRONT)
		compareCnt = 0;
	else if (priority == QueueCommand::NORMAL)
		compareCnt = queueVector.get(queueVector.size() - 1)->getCompareToCounter() + 1;

	enqueueCommand(crc, nextCounter, targetID, args, priority, compareCnt);
}

void CommandQueue::clearQueueActions(bool combatOnly) {
	auto creature = weakCreature.get();

	if (creature == nullptr)
		return;

	//Locker lock(&queueMutex);

	for (int i = queueVector.size() - 1; i >= 0; i--) {
		CommandQueueAction* command = queueVector.get(i);

		if (command == nullptr)
			continue;

		if (combatOnly) {
			ZoneServer* zoneServer = creature->getZoneServer();
			if (zoneServer == nullptr)
				continue;

			ObjectController* objectController = zoneServer->getObjectController();
			if (objectController == nullptr)
				continue;

			const QueueCommand* queueCommand = objectController->getQueueCommand(command->getCommand());
			if (queueCommand == nullptr)
				continue;

			if (!queueCommand->isCombatCommand())
				continue;
		}

		if (command->getActionCounter() != 0)
			clearQueueAction(command->getActionCounter(), 0, 0, 0);

		queueVector.remove(i);
	}
}

void CommandQueue::deleteQueueAction(uint32 actionCount) {
	//Locker lock(&queueMutex);

	for (int i = 0; i < queueVector.size(); ++i) {
		CommandQueueAction* action = queueVector.get(i);

		if (action->getActionCounter() == actionCount) {
			queueVector.remove(i);
			break;
		}
	}
}

String CommandQueue::toString() const {
	auto creo = weakCreature.get();

	StringBuffer buf;

	buf <<"CommandQueue(state=";

	// clang-format off
	switch (state) {
	case NONE:    buf << "NONE";    break;
	case WAITING: buf << "WAITING"; break;
	case RUNNING: buf << "RUNNING"; break;
	case DELAY:   buf << "DELAY";   break;
	}
	// clang-format on

	buf << ", creature=" << (creo != nullptr ? creo->getObjectID() : 0)
#ifdef DEBUG_QUEUE
		<< ", runNumber=" << runNumber << ", lastRunMs=" << lastRun.miliDifference()
#endif // DEBUG_QUEUE
	<< ", queueVector.size=" << queueVector.size() << ", queueTask=" << hex << queueTask;

	if (queueTask != nullptr) {
		buf << "[" << (queueTask->isScheduled() ? "isScheduled" : "!isScheduled") << "]";
	}

	buf << ")";

	return buf.toString();
}
