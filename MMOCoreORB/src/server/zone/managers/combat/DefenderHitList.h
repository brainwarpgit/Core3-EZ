/*
DefenderHitList.h

Author: Hakry
*/

#ifndef DEFENDERHITLIST_H_
#define DEFENDERHITLIST_H_

#include "server/zone/objects/tangible/TangibleObject.h"

using namespace server::zone::objects::tangible;

class DefenderHitList : public Object {
	ManagedWeakReference<TangibleObject*> defender;

	int hit;
	uint8 hitLocation;
	int initialDamage;
	float damageMultiplier;
	int foodMitigation;
	int jediMitigation;
	int armorMitigation;
	Vector<int> poolsToWound;
	int finalDamage;

public:
	DefenderHitList() {
		hit = 0;
		hitLocation = 0;
		initialDamage = 0;
		damageMultiplier = 0;
		foodMitigation = 0;
		jediMitigation = 0;
		armorMitigation = 0;
		poolsToWound;
		finalDamage = 0;
	}


	DefenderHitList& operator= (const DefenderHitList& hitList) {
		if (this == &hitList)
			return *this;

		hit = hitList.hit;
		hitLocation = hitList.hitLocation;
		initialDamage = hitList.initialDamage;
		damageMultiplier = hitList.damageMultiplier;
		foodMitigation = hitList.foodMitigation;
		jediMitigation = hitList.jediMitigation;
		armorMitigation = hitList.armorMitigation;
		poolsToWound = hitList.poolsToWound;
		finalDamage = hitList.finalDamage;

		return *this;
	}

	void setHit(int val) {
		hit = val;
	}

	void setHitLocation(int val) {
		hitLocation = val;
	}

	void setInitialDamage(int initDam) {
		initialDamage = initDam;
	}

	void setDamageMultiplier(float damageMulti) {
		damageMultiplier = damageMulti;
	}

	void setFoodMitigation(int fMit) {
		foodMitigation = fMit;
	}

	void setJediMitigation(int jediArmMit) {
		jediMitigation = jediArmMit;
	}

	void setArmorMitigation(int armorMit) {
		armorMitigation = armorMit;
	}

	void setPoolsToWound(Vector<int> woundPools) {
		poolsToWound = woundPools;
	}

	void setFinalDamage(int final) {
		finalDamage = final;
	}

	inline int getHit() {
		return hit;
	}

	inline int getHitLocation() {
		return hitLocation;
	}

	inline int getInitialDamage() {
		return initialDamage;
	}

	inline float getDamageMultiplier() {
		return damageMultiplier;
	}

	inline int getFoodMitigation() {
		return foodMitigation;
	}

	inline int getJediMitigation() {
		return jediMitigation;
	}

	inline int getArmorMitigation() {
		return armorMitigation;
	}

	Vector<int> getPoolsToWound() {
		return poolsToWound;
	}

	inline int getFinalDamage() {
		return finalDamage;
	}
};

#endif /* DEFENDERHITLIST_H_ */
