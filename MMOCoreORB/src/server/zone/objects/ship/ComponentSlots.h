//
// Created by g on 12/31/17.
//

#ifndef CORE3_COMPONENTSLOTS_H
#define CORE3_COMPONENTSLOTS_H
namespace Components {
	enum ShipComponents {
		REACTOR, //0
		ENGINE,
		SHIELD0,
		SHIELD1,
		ARMOR0,
		ARMOR1, // 5
		CAPACITOR,
		BOOSTER,
		DROID_INTERFACE,
		BRIDGE,
		HANGAR, // 10
		TARGETING_STATION,
		WEAPON_START // 12
	};

	enum ShipComponentsMax {
		FIGHTERSLOTMAX = 19,
		CAPITALSLOTMAX = 99,
	};
}
#endif //CORE3_COMPONENTSLOTS_H
