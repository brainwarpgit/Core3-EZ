#ifndef CREATUREOBJECT_H_
#define CREATUREOBJECT_H_

#include "../tangible/TangibleObject.h"

class CreatureObject : public TangibleObject {
protected:
	uint32 actionCount;

public:
	CreatureObject(SharedObjectTemplate* templateData);

	void parseBaseline3(Message* message);

	uint32 getNewActionCount() {
		return ++actionCount;
	}

};

#endif /*CREATUREOBJECT_H_*/
