/*
 * VendorManager.h
 *
 *  Created on: Mar 23, 2011
 *      Author: polonel
 */

#ifndef VENDORMANAGER_H_
#define VENDORMANAGER_H_

#include "VendorSelectionNode.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/name/NameManager.h"
#include "VendorOutfitManager.h"
#include "templates/creature/VendorCreatureTemplate.h"

namespace server {
namespace zone {
namespace managers {
namespace vendor {

class VendorManager : public Singleton<VendorManager>, public Mutex, public Logger, public Object {
protected:
	Reference<VendorSelectionNode*> rootNode;

	ManagedReference<ZoneProcessServer*> server;
	Reference<NameManager*> nameManager;

public:

	VendorManager();

	~VendorManager() {

	}

	void initialize(ZoneProcessServer* zserv);

	void loadLuaVendors();

	inline void loadVendorOutfits() {
		VendorOutfitManager::instance()->initialize();
	}

	bool isValidVendorName(const String& name);

	void handleDisplayStatus(CreatureObject* player, TangibleObject* vendor);

	String getTimeString(uint32 timestamp);

	void promptDestroyVendor(CreatureObject* player, TangibleObject* vendor);

	void promptRenameVendorTo(CreatureObject* player, TangibleObject* vendor);

	void destroyVendor(TangibleObject* vendor);

	void sendRegisterVendorTo(CreatureObject* player, TangibleObject* vendor);

	void handleRegisterVendorCallback(CreatureObject* player, TangibleObject* vendor, const String& planetMapCategoryName);

	void handleUnregisterVendor(CreatureObject* player, TangibleObject* vendor);

	void handleRenameVendor(CreatureObject* player, TangibleObject* vendor, String& name);

	// Vendor is locked coming in
	void randomizeVendorLooks(CreatureObject* vendor);

	void randomizeVendorClothing(CreatureObject* vendor, VendorCreatureTemplate* vendorTempl);

	void randomizeVendorHair(CreatureObject* vendor, VendorCreatureTemplate* vendorTempl);

	void randomizeVendorFeatures(CreatureObject* vendor, VendorCreatureTemplate* vendorTempl);

	void randomizeVendorHeight(CreatureObject* vendor, VendorCreatureTemplate* vendorTempl);

	inline VendorSelectionNode* getRootNode() {
		return rootNode;
	}
};

}
}
}
}

using namespace server::zone::managers::vendor;

#endif /* VENDORMANAGER_H_ */
