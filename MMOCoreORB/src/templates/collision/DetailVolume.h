/*
 * DetailVolume.h
 *
 *  Created on: 03/20/2016
 *      Author: gslomin
 */

#ifndef DETAILVOLUME_H_
#define DETAILVOLUME_H_

#include "engine/engine.h"
#include "CompositeVolume.h"

class DetailVolume : public CompositeVolume {
public:
	bool isDetailVolume() { return true; }
	DetailVolume() { }
	virtual void read(IffStream *iff);

#ifdef OSG_RENDERER
	virtual osg::ref_ptr<osg::Node> draw() const = 0;
#endif

};
#endif /* DETAILVOLUME_H_ */
