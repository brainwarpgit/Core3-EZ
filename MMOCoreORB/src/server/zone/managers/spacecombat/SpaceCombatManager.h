#ifndef SPACECOMBATMANAGER_H_
#define SPACECOMBATMANAGER_H_

#include "server/zone/managers/spacecombat/projectile/ShipProjectileMap.h"
#include "server/zone/managers/spacecombat/projectile/ShipProjectile.h"
#include "server/zone/managers/spacecollision/SpaceCollisionResult.h"
#include "server/zone/objects/ship/ShipObject.h"

class SpaceCombatManager : public Singleton<SpaceCombatManager>, public Logger, public Object {
public:
	SpaceCombatManager() {
		setLoggingName("SpaceCombatManager");

		checkProjectilesTask = new CheckProjectilesTask(this);
		checkProjectilesTask->execute();
	}

	~SpaceCombatManager() {
		checkProjectilesTask->cancel();

		delete checkProjectilesTask;
		checkProjectilesTask = nullptr;
	}

	enum ProjectileResult : int {
		HIT = 1,
		MISS = 0,
		EXPIRE = -1
	};

	enum ShipHitType : int {
		HITSHIELD = 0,
		HITARMOR = 1,
		HITCOMPONENT = 2,
		HITCHASSIS = 3,
	};

	String shipHitTypeToString(int ShipHitType) const {
		switch (ShipHitType) {
			case HITSHIELD:	return "shield";
			case HITARMOR:	return "armor";
			case HITCOMPONENT:	return "component";
			default:	return "chassis";
		}
	}

private:
	class CheckProjectilesTask: public Task, public Logger {
	protected:
		Reference<SpaceCombatManager*> combatManager;

	public:
		const static int INTERVAL = 200;
		const static int INTERVALMIN = 100;
		const static int INTERVALMAX = 2000;

		CheckProjectilesTask(SpaceCombatManager* manager) : Task() {
			setLoggingName("CheckProjectilesTask");

			this->combatManager = manager;
		}

		void run() {
			if (combatManager == nullptr) {
				return;
			}

			int delta = combatManager->updateProjectiles();
			int interval = INTERVAL - delta;

			if (interval < INTERVALMIN) {
				interval = INTERVALMIN;
			}

			reschedule(interval);
		}
	};

	Reference<CheckProjectilesTask*> checkProjectilesTask;
	ShipProjectileMap projectileMap;

private:
	BasePacket* getOnShipHitMessage(ShipObject* target, const Vector3& localPosition, int type, float newPercent, float oldPercent) const;

	BasePacket* getHitEffectMessage(ShipObject* target, const Vector3& localPosition, int type) const;

	float applyShieldDamage(ShipObject* target, const Vector3& collisionPoint, float damage, float effect, bool hitFront, ShipDeltaVector* deltaVector, Vector<BasePacket*>& messages) const;

	float applyArmorDamage(ShipObject* target, const Vector3& collisionPoint, float damage, float effect, bool hitFront, ShipDeltaVector* deltaVector, Vector<BasePacket*>& messages) const;

	float applyChassisDamage(ShipObject* target, const Vector3& collisionPoint, float damage, ShipDeltaVector* deltaVector, Vector<BasePacket*>& messages) const;

	float applyComponentDamage(ShipObject* target, const Vector3& collisionPoint, float damage, int slot, ShipDeltaVector* deltaVector, Vector<BasePacket*>& messages) const;

	float applyActiveComponentDamage(ShipObject* target, const Vector3& collisionPoint, float damage, int slot, ShipDeltaVector* deltaVector, Vector<BasePacket*>& messages) const;

	void applyDamage(ShipObject* target, const Vector3& collisionPosition, float damage, float armorEffect, float shieldEffect, int collisionSlot, int targetSlot, bool hitFront) const;

	void applyDamage(ShipObject* ship, const ShipProjectile* projectile, const SpaceCollisionResult& result) const;

	void broadcastProjectile(ShipObject* ship, const ShipProjectile& projectile) const;

	int updateProjectile(ShipObject* Ship, ShipProjectile* projectile, SpaceCollisionResult& result, Vector<ManagedReference<ShipObject*>>& targetVectorCopy, const uint64& miliTimeNow) const;

public:
	int updateProjectiles();

	void addProjectile(ShipObject* ship, const ShipProjectile& projectile);
};

#endif // SPACECOMBATMANAGER_H_
