#ifndef FOLLOWACTIONS_H_
#define FOLLOWACTIONS_H_

#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/ai/bt/Behavior.h"
#include "server/zone/objects/creature/ai/bt/BlackboardData.h"
#include "templates/params/creature/CreatureAttribute.h"
#include "server/zone/managers/collision/CollisionManager.h"
#include "server/zone/Zone.h"

#include "server/zone/objects/intangible/PetControlDevice.h"
#include "server/zone/objects/tangible/threat/ThreatMap.h"
#include "server/chat/ChatManager.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace ai {
namespace bt {
namespace leaf {

class GetProspectFromThreatMap : public Behavior {
public:
	GetProspectFromThreatMap(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	GetProspectFromThreatMap(const GetProspectFromThreatMap& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		agent->eraseBlackboard("targetProspect");

		ManagedReference<SceneObject*> tar = agent->getThreatMap()->getHighestThreatAttacker();
		if (tar == nullptr)
			return FAILURE;

		agent->writeBlackboard("targetProspect", tar);

		return SUCCESS;
	}
};

class GetProspectFromDefenders : public Behavior {
public:
	GetProspectFromDefenders(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	GetProspectFromDefenders(const GetProspectFromDefenders& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		agent->eraseBlackboard("targetProspect");

		ManagedReference<SceneObject*> tar = agent->getMainDefender();
		if (tar == nullptr)
			return FAILURE;

		agent->writeBlackboard("targetProspect", tar);

		return SUCCESS;
	}
};

class GetProspectFromTarget : public Behavior {
public:
	GetProspectFromTarget(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	GetProspectFromTarget(const GetProspectFromTarget& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		ManagedReference<SceneObject*> followCopy = agent->getFollowObject();

		if (followCopy == nullptr || !followCopy->isCreatureObject()) {
			return FAILURE;
		}

		if (agent->hasDefender(followCopy)) {
			return SUCCESS;
		}

		ManagedReference<CreatureObject*> followCreo = followCopy->asCreatureObject();

		if (followCreo == nullptr || !followCreo->isInCombat())
			return FAILURE;

		ManagedReference<SceneObject*> target = agent->getTargetFromTargetsMap(followCreo);

		if (target == nullptr) {
			return FAILURE;
		}

		agent->writeBlackboard("targetProspect", target);

		return SUCCESS;
	}
};

class GetProspectFromCommand : public Behavior {
public:
	GetProspectFromCommand(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	GetProspectFromCommand(const GetProspectFromCommand& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		agent->eraseBlackboard("targetProspect");

		if (!agent->isPet())
			return FAILURE;

		Reference<PetControlDevice*> cd = agent->getControlDevice().castTo<PetControlDevice*>();
		if (cd == nullptr)
			return FAILURE;

		ManagedReference<SceneObject*> tar = cd->getLastCommandTarget().get();
		if (tar == nullptr)
			return FAILURE;

		agent->writeBlackboard("targetProspect", tar);

		return SUCCESS;
	}
};

class RestoreFollow : public Behavior {
public:
	RestoreFollow(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	RestoreFollow(const RestoreFollow& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		agent->restoreFollowObject();
		return agent->getFollowObject() != nullptr ? SUCCESS : FAILURE;
	}
};

class DropProspectFromDefenders : public Behavior {
public:
	DropProspectFromDefenders(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	DropProspectFromDefenders(const DropProspectFromDefenders& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		if (!agent->peekBlackboard("targetProspect"))
			return SUCCESS;

		ManagedReference<SceneObject*> tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();
		if (tar == nullptr) {
			agent->eraseBlackboard("targetProspect");
			return SUCCESS;
		}

		agent->removeDefender(tar);
		agent->eraseBlackboard("targetProspect");

		return agent->hasDefender(tar) ? FAILURE : SUCCESS;
	}
};

class SetDefenderFromProspect : public Behavior {
public:
	SetDefenderFromProspect(const String& className, const uint32 id, const LuaObject& args) : Behavior(className, id, args) {
	}

	SetDefenderFromProspect(const SetDefenderFromProspect& a) : Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		if (!agent->peekBlackboard("targetProspect"))
			return FAILURE;

		ManagedReference<SceneObject*> tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();
		if (tar == nullptr) {
			agent->eraseBlackboard("targetProspect");
			return FAILURE;
		}

		agent->setDefender(tar);

		return agent->getMainDefender() == tar ? SUCCESS : FAILURE;
	}
};

class KillProspect : public Behavior {
public:
	KillProspect(const String& className, const uint32 id, const LuaObject& args) : Behavior(className, id, args) {
	}

	KillProspect(const KillProspect& a) : Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		if (!agent->peekBlackboard("targetProspect")) {
			return FAILURE;
		}

		ManagedReference<SceneObject*> tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();

		if (tar == nullptr) {
			agent->eraseBlackboard("targetProspect");
			return FAILURE;
		}

		return agent->killPlayer(tar) ? SUCCESS : FAILURE;
	}
};

class UpdateRangeToFollow : public Behavior {
public:
	UpdateRangeToFollow(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	UpdateRangeToFollow(const UpdateRangeToFollow& a)
			: Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		ManagedReference<SceneObject*> followCopy = agent->getFollowObject().get();
		if (followCopy == nullptr)
			return FAILURE;

		float dist = agent->getDistanceTo(followCopy) - followCopy->getTemplateRadius() - agent->getTemplateRadius();
		agent->writeBlackboard("followRange", BlackboardData(dist));

		return SUCCESS;
	}
};

class SetFollowState : public Behavior {
public:
	SetFollowState(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args), state(0) {
		parseArgs(args);
	}

	SetFollowState(const SetFollowState& a)
			: Behavior(a), state(a.state) {
	}

	SetFollowState& operator=(const SetFollowState& a) {
		if (this == &a)
			return *this;
		Behavior::operator=(a);
		state = a.state;
		return *this;
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		ManagedReference<SceneObject*> tar = nullptr;
		if (agent->peekBlackboard("targetProspect"))
			tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();

		if (tar == nullptr && (state == AiAgent::WATCHING || state == AiAgent::STALKING || state == AiAgent::FOLLOWING)) {
			agent->setFollowObject(nullptr);
			return FAILURE;
		}

		switch (state) {
		case AiAgent::OBLIVIOUS:
			agent->setOblivious();
			break;
		case AiAgent::WATCHING:
			agent->setWatchObject(tar);
			break;
		case AiAgent::STALKING:
			agent->setStalkObject(tar);
			break;
		case AiAgent::FOLLOWING:
			break;
		case AiAgent::PATROLLING:
		case AiAgent::FLEEING:
		case AiAgent::LEASHING:
		default:
			agent->setFollowState(state);
			break;
		};

		return SUCCESS;
	}

	void parseArgs(const LuaObject& args) {
		state = getArg<int32>()(args, "state");
	}

	String print() const {
		StringBuffer msg;
		msg << className << "-" << state;

		return msg.toString();
	}

private:
	uint32 state;
};

class CalculateAggroMod : public Behavior {
public:
	CalculateAggroMod(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		ManagedReference<SceneObject*> tar = nullptr;
		if (agent->peekBlackboard("targetProspect"))
			tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();

		if (tar == nullptr || !tar->isCreatureObject())
			return FAILURE;

		CreatureObject* tarCreo = tar->asCreatureObject();

		float minMod = Math::min(1.f - (tarCreo->getLevel() - agent->getLevel()) / 8.f, 1.5f);
		float mod = Math::max(0.75f, minMod);
		agent->writeBlackboard("aggroMod", mod);

		return agent->peekBlackboard("aggroMod") ? SUCCESS : FAILURE;
	}
};

class RunAway : public Behavior {
public:
	RunAway(const String& className, const uint32 id, const LuaObject& args)
			: Behavior(className, id, args), dist(0.f) {
		parseArgs(args);
	}

	RunAway(const RunAway& b)
			: Behavior(b), dist(b.dist) {
	}

	RunAway& operator=(const RunAway& b) {
		if (this == &b)
			return *this;
		Behavior::operator=(b);
		dist = b.dist;
		return *this;
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		ManagedReference<SceneObject*> tar = nullptr;
		if (agent->peekBlackboard("targetProspect"))
			tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();

		if (tar == nullptr || !tar->isCreatureObject())
			return FAILURE;

		float aggroMod = 1.f;
		if (agent->peekBlackboard("aggroMod"))
			aggroMod = agent->readBlackboard("aggroMod").get<float>();

		int radius = agent->getAggroRadius();
		if (radius == 0)
			radius = AiAgent::DEFAULTAGGRORADIUS;

		if (!agent->isNonPlayerCreatureObject()) {
			agent->runAway(tar->asCreatureObject(), dist - radius * aggroMod);
			agent->showFlyText("npc_reaction/flytext", "afraid", 0xFF, 0, 0);
		}

		return SUCCESS;
	}

	void parseArgs(const LuaObject& args) {
		dist = getArg<float>()(args, "dist");
	}

	String print() const {
		StringBuffer msg;
		msg << className << "-" << dist;

		return msg.toString();
	}

private:
	float dist;
};

class Evade : public Behavior {
public:
	Evade(const String& className, const uint32 id, const LuaObject& args)
		: Behavior(className, id, args), minEvadeChance(0.015), maxEvadeChance(0.05) {
			parseArgs(args);
	}

	Evade(const Evade& a)
			: Behavior(a), minEvadeChance(a.minEvadeChance), maxEvadeChance(a.maxEvadeChance) {
	}

	Evade& operator=(const Evade& a) {
		if (this == &a)
			return *this;
		Behavior::operator=(a);
		minEvadeChance = a.minEvadeChance;
		maxEvadeChance = a.maxEvadeChance;
		return *this;
	}

	void parseArgs(const LuaObject& args) {
		minEvadeChance = getArg<float>()(args, "minEvadeChance");
		maxEvadeChance = getArg<float>()(args, "maxEvadeChance");
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		if (!agent->isInCombat() || agent->isPet())
			return FAILURE;

		if (agent->getFollowState() == AiAgent::EVADING)
			return SUCCESS;

		Zone* zone = agent->getZoneUnsafe();

		if (zone == nullptr)
			return FAILURE;

		// TODO: Change when we can do interior pathing
		if (agent->getParentID() != 0)
			return FAILURE;

		float minDist = 15.f;
		float maxDist = 20.f;

		float minChance = minEvadeChance;
		float maxChance = maxEvadeChance;

		ManagedReference<SceneObject*> tar = nullptr;

		if (agent->peekBlackboard("targetProspect"))
			tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >();

		if (tar == nullptr || !tar->isCreatureObject())
			return FAILURE;

		float primaryRange = 0;
		float secondaryRange = 0;

		if (agent->getPrimaryWeapon() != nullptr)
			primaryRange = agent->getPrimaryWeapon()->getMaxRange();

		if (agent->getSecondaryWeapon() != nullptr)
			secondaryRange = agent->getSecondaryWeapon()->getMaxRange();

		// No need to evade if creature is melee only
		if (primaryRange < 10.f && secondaryRange < 10.f)
			return FAILURE;

		// Current weapon is melee. We do not need to evade when melee
		if (agent->getWeapon() != nullptr) {
			float idealRange = agent->getWeapon()->getIdealRange();

			if (idealRange < 10.f) {
				return FAILURE;
			}
		}

		CreatureObject* tarCreo = tar->asCreatureObject();

		if (tarCreo == nullptr)
			return FAILURE;

		if (tarCreo->isPlayerCreature()) {
			float playerWeaponRange = 0;

			if (tarCreo->getWeapon() != nullptr)
				playerWeaponRange = tarCreo->getWeapon()->getMaxRange();

			if (playerWeaponRange < 10.f) {
				minDist = 5.f;

				if (System::random(100) < 30)
					maxDist = playerWeaponRange + 5;
				else
					maxDist = playerWeaponRange - 1;

				if (minDist > maxDist)
					minDist = maxDist;
			}
		}

		if (minChance > maxChance)
			minChance = maxChance;

		float finalChance = maxChance;
		float chanceDiff = maxChance - minChance;
		float diffModifier = chanceDiff * (agent->getHAM(CreatureAttribute::HEALTH) / agent->getMaxHAM(CreatureAttribute::HEALTH));
		finalChance -= chanceDiff * diffModifier;
		finalChance *= 100;

		int randRoll = System::random(100);

		if (finalChance < 100 && randRoll > finalChance)
			return FAILURE;

		float distance = minDist + System::random(maxDist - minDist);
		float angle = System::random(360);
		float newAngle = angle * (M_PI / 180.0f);

		float newX = tarCreo->getPositionX() + (cos(newAngle) * distance);
		float newY = tarCreo->getPositionY() + (sin(newAngle) * distance);

		float newZ = zone->getHeight(newX, newY);

		Vector3 position = Vector3(newX, newY, newZ);

		if (CollisionManager::checkSphereCollision(position, 5, zone))
			return FAILURE;

		agent->setFollowState(AiAgent::EVADING);
		agent->setNextPosition(position.getX(), position.getZ(), position.getY(), agent->getParent().get().castTo<CellObject*>());
		agent->faceObject(tar);

		return SUCCESS;
	}

	String print() const {
		StringBuffer msg;
		msg << className << "-";

		return msg.toString();
	}

	private:
	float minEvadeChance;
	float maxEvadeChance;
};

class StalkProspect : public Behavior {
public:
	StalkProspect(const String& className, const uint32 id, const LuaObject& args) : Behavior(className, id, args) {
	}

	StalkProspect(const StalkProspect& a) : Behavior(a) {
	}
	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		Time* alert = agent->getAlertedTime();

		if (alert == nullptr || !alert->isPast())
			return FAILURE;

		ManagedReference<SceneObject*> tar = nullptr;

		if (agent->peekBlackboard("targetProspect"))
			tar = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >().get();

		int stalkRad = agent->getAggroRadius();

		if (stalkRad == 0)
			stalkRad = AiAgent::DEFAULTAGGRORADIUS;

		float aggroMod = agent->readBlackboard("aggroMod").get<float>();
		stalkRad *= aggroMod * 2;
		agent->writeBlackboard("stalkRadius", stalkRad);

		if (tar == nullptr || !tar->isInRange(agent, stalkRad)) {
			return FAILURE;
		}

		if (!agent->stalkProspect(tar))
			return FAILURE;

		return SUCCESS;
	}

	String print() const {
		StringBuffer msg;
		msg << className << "-";

		return msg.toString();
	}
};

class Flee : public Behavior {
public:
	Flee(const String& className, const uint32 id, const LuaObject& args) : Behavior(className, id, args), delay(0) {
		parseArgs(args);
	}

	Flee(const Flee& a) : Behavior(a), delay(a.delay) {
	}

	Flee& operator=(const Flee& a) {
		if (this == &a)
			return *this;
		Behavior::operator=(a);
		delay = a.delay;
		return *this;
	}

	void parseArgs(const LuaObject& args) {
		delay = getArg<float>()(args, "delay");
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		ManagedReference<SceneObject*> target = nullptr;

		if (agent->peekBlackboard("targetProspect"))
			target = agent->readBlackboard("targetProspect").get<ManagedReference<SceneObject*> >().get();

		if (target != nullptr && target->isCreatureObject()) {
			CreatureObject* targetCreo = target->asCreatureObject();
			Time* fleeDelay = agent->getFleeDelay();

			if (targetCreo != nullptr && fleeDelay != nullptr) {
				fleeDelay->updateToCurrentTime();
				fleeDelay->addMiliTime(delay * 1000);

				agent->runAway(targetCreo, System::random(50) + 25);
				return SUCCESS;
			}
		}

		return FAILURE;
	}

	String print() const {
		StringBuffer msg;
		msg << className << "-";

		return msg.toString();
	}

	private:
	int delay;
};

class PetReturn : public Behavior {
public:
	PetReturn(const String& className, const uint32 id, const LuaObject& args) : Behavior(className, id, args) {
	}

	PetReturn(const PetReturn& a) : Behavior(a) {
	}

	Behavior::Status execute(AiAgent* agent, unsigned int startIdx = 0) const {
		if (agent == nullptr || !agent->isPet())
			return FAILURE;

		Reference<PetControlDevice*> controlDevice = agent->getControlDevice().castTo<PetControlDevice*>();

		if (controlDevice == nullptr)
			return FAILURE;

		ManagedReference<SceneObject*> newFollow = controlDevice->getLastCommander();

		uint32 lastCommand = controlDevice->getLastCommand();

		if (lastCommand == PetManager::PATROL && newFollow != nullptr) {
			Locker clocker(controlDevice, agent);

			if (controlDevice->getPatrolPointSize() == 0)
				return FAILURE;

			agent->setFollowObject(nullptr);
			agent->setFollowState(AiAgent::PATROLLING);
			agent->clearSavedPatrolPoints();

			for (int i = 0; i < controlDevice->getPatrolPointSize(); i++) {
				PatrolPoint point = controlDevice->getPatrolPoint(i);
				agent->addPatrolPoint(point);
			}

			return SUCCESS;
		} else if (lastCommand == PetManager::GUARD) {
			newFollow = controlDevice->getLastCommandTarget();
		}

		if (newFollow == nullptr) {
			return FAILURE;
		}

		agent->setFollowObject(newFollow);

		return SUCCESS;
	}

	String print() const {
		StringBuffer msg;
		msg << className << "-";

		return msg.toString();
	}
};

}
}
}
}
}
}
}

#endif // FOLLOWACTIONS_H_
