/*
 * BoundingVolumeFactory.h
 *
 *  Created on: 3/20/16
 *      Author: gslomin
 */

#ifndef BOUNDINGVOLUMEFACTORY_H_
#define BOUNDINGVOLUMEFACTORY_H_

#include "engine/engine.h"

class BaseBoundingVolume;

class BoundingVolumeFactory {
public:
	BoundingVolumeFactory() { }
	static BaseBoundingVolume* getVolume(IffStream *iff);
};

#endif /* BOUNDINGVOLUMEFACTORY_H_ */
