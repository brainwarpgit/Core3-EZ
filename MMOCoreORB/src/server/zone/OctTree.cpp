/*
Copyright (C) 2007 <SWGEmu>. All rights reserved.
Distribution of this file for usage outside of Core3 is prohibited.
 */

#include <math.h>
#include "server/zone/TreeEntry.h"
#include "server/zone/CloseObjectsVector.h"
#include "server/zone/TreeNode.h"
#include "OctTree.h"
#include "server/zone/objects/scene/SceneObject.h"

#define NO_ENTRY_REF_COUNTING

using namespace server::zone;

bool OctTree::logTree = false;

OctTree::OctTree() {
	root = nullptr;
}

OctTree::OctTree(float minx, float miny, float minz, float maxx, float maxy, float maxz) {
	root = new TreeNode(minx, miny, minz, maxx, maxy, maxz, nullptr);
}

OctTree::~OctTree() {
	root = nullptr;
}

Object* OctTree::clone() {
	return ObjectCloner<OctTree>::clone(this);
}

Object* OctTree::clone(void* mem) {
	return TransactionalObjectCloner<OctTree>::clone(this);
}

void OctTree::setSize(float minx, float miny, float minz, float maxx, float maxy, float maxz) {
	root = new TreeNode(minx, miny, minz, maxx, maxy, maxz, nullptr);
}

void OctTree::insert(TreeEntry *obj) {
	//Logger::console.info("OctTee::insert", true);
	assert(obj->getParent() == nullptr);

	Locker locker(&mutex);

	try {
		if (OctTree::doLog()) { //--------------------------------------- HERE
			SceneObject* scno = cast<SceneObject*>(obj);
			System::out << hex << "object [" << scno->getDisplayedName() <<  "] inserting\n";
			System::out << "(" << String::valueOf(obj->getPositionX()) << ", " << String::valueOf(obj->getPositionY()) << ", " << String::valueOf(obj->getPositionZ()) << ")\n";
		}

		if (obj->getNode() != nullptr)
			remove(obj);

		_insert(root, obj);

		SceneObject* scno = cast<SceneObject*>(obj);

		if (OctTree::doLog())
			System::out << hex << "object [" << obj->getObjectID() <<  "] finished inserting\n" << scno->getDisplayedName() << "\n";
	} catch (Exception& e) {
		System::out << "[OctTree] error - " << e.getMessage() << "\n";
		e.printStackTrace();
	}
}

bool OctTree::update(TreeEntry *obj) {
	//assert(obj->getParent() == nullptr);

	Locker locker(&mutex);

	try {
		if (OctTree::doLog()) {
			SceneObject* scno = cast<SceneObject*>(obj);
			System::out << hex << "object [" << scno->getDisplayedName() << "] " << "Current Position:" << "(" << String::valueOf(scno->getPositionX())
					<< ", " << String::valueOf(scno->getPositionY()) << ", " << String::valueOf(scno->getPositionZ()) << ")\n";
		}
		TreeNode* node = obj->getNode();

		// Print COV
	/*	SceneObject* scno = cast<SceneObject*>(obj);

		Locker locker(obj);

		if (scno->isShipObject())
			{
				SceneObject* pilot = scno->getSlottedObject("ship_pilot");
				auto vec = (CloseObjectsVector*)pilot->getCloseObjects();
				Logger::console.info("Close objects for: " + pilot->getDisplayedName(), true);
				if (vec != nullptr) {
					SortedVector<TreeEntry*> closeO;
					vec->safeCopyTo(closeO);
					vec = nullptr;
					locker.release();
					for (int i = 0; i < closeO.size(); ++i) {
						auto obj = static_cast<SceneObject*>(closeO.getUnsafe(i));
						if (obj != nullptr)
							Logger::console.info(String::valueOf(i) + ": " + obj->getObjectNameStringIdName() , true);
					}
				}
				Logger::console.info("End Close Objects", true);
			}*/

		if (node == nullptr) {
#ifdef OUTPUTQTERRORS
			System::out << hex << "object [" << obj->getObjectID() <<  "] updating error\n";
#endif
			return false;
		}

		bool res = _update(node, obj);

		if (OctTree::doLog())
			System::out << hex << "object [" << obj->getObjectID() <<  "] finished updating\n";

		return res;
	} catch (Exception& e) {
		System::out << "[OctTree] error - " << e.getMessage() << "\n";
		e.printStackTrace();

		return false;
	}
}

void OctTree::inRange(TreeEntry *obj, float range) {

	ReadLocker locker(&mutex);

	CloseObjectsVector* closeObjects = obj->getCloseObjects();

	float rangecb = range * range * range;

	float x = obj->getPositionX();
	float y = obj->getPositionY();
	float z = obj->getPositionZ();

	float oldx = obj->getPreviousPositionX();
	float oldy = obj->getPreviousPositionY();
	float oldz = obj->getPreviousPositionZ();

	try {
		if (closeObjects != nullptr) {
			for (int i = 0; i < closeObjects->size(); i++) {
				TreeEntry* o = closeObjects->get(i).castTo<TreeEntry*>();
				ManagedReference<TreeEntry*> objectToRemove = o;
				ManagedReference<TreeEntry*> rootParent = o->getRootParent();

				if (rootParent != nullptr)
					o = rootParent;

				if (o != obj) {
					float deltaX = x - o->getPositionX();
					float deltaY = y - o->getPositionY();
					float deltaZ = z - o->getPositionZ();

					if (deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ > rangecb) {
						float oldDeltaX = oldx - o->getPositionX();
						float oldDeltaY = oldy - o->getPositionY();
						float oldDeltaZ = oldz - o->getPositionZ();

						if (oldDeltaX * oldDeltaX + oldDeltaY * oldDeltaY + oldDeltaZ * oldDeltaZ <= rangecb) {
							obj->removeInRangeObject(objectToRemove);

							CloseObjectsVector* objCloseObjects = objectToRemove->getCloseObjects();

							if (objCloseObjects != nullptr)
								objectToRemove->removeInRangeObject(obj);
						}
					}
				}
			}
		}


		//	try {
			_inRange(root, obj, range);

			SceneObject* scno = cast<SceneObject*>(obj);

			if (OctTree::doLog()) {
				System::out << hex << "object [" << scno->getDisplayedName() <<  "] in range (";

				/*for (int i = 0; i < obj->inRangeObjectCount(); ++i) {
				System::out << hex << obj->getInRangeObject(i)->getObjectID() << ", ";
			}*/

				System::out << "\n";
			}

	} catch (Exception& e) {
		System::out << "[OctTree] " << e.getMessage() << "\n";
		e.printStackTrace();
	}
}

int OctTree::inRange(float x, float y, float z, float range, SortedVector<ManagedReference<TreeEntry*> >& objects) const {
	ReadLocker locker(&mutex);

	try {
		return _inRange(root, x, y, z, range, objects);
	} catch (Exception& e) {
		System::out << "[OctTree] " << e.getMessage() << "\n";
		e.printStackTrace();
	}

	return 0;
}

int OctTree::inRange(float x, float y, float z, float range,
		SortedVector<TreeEntry*>& objects) const {
	ReadLocker locker(&mutex);

	try {
		return _inRange(root, x, y, z, range, objects);
	} catch (Exception& e) {
		System::out << "[OctTree] " << e.getMessage() << "\n";
		e.printStackTrace();
	}

	return 0;
}

void OctTree::remove(TreeEntry *obj) {

	Locker locker(&mutex);

	if (OctTree::doLog())
		System::out << hex << "object [" << obj->getObjectID() <<  "] removing\n";

	TreeNode* node = obj->getNode().castTo<TreeNode*>();

	if (node != nullptr) {
		if (!node->validateNode()) {
			System::out << "[OctTree] " << obj->getObjectID() << " error on remove() - invalid Node"
					<< node->toStringData() << "\n";
		}

		node->removeObject(obj);

		node->check();
		obj->setNode(nullptr);
	} else {
		System::out << hex << "object [" << obj->getObjectID() <<  "] ERROR - removing the node\n";
		StackTrace::printStackTrace();
	}

	if (OctTree::doLog())
		System::out << hex << "object [" << obj->getObjectID() <<  "] finished removing\n";
}

void OctTree::removeAll() {
	Locker locker(&mutex);

	if (root != nullptr) {
		root = nullptr;
		//delete root;
	}
}

void OctTree::_insert(const Reference<TreeNode*>& node, TreeEntry *obj) {
	obj->clearBounding();

	if (!node->isEmpty() && !node->hasSubNodes()) {
		if ((node->maxX - node->minX <= 8) && (node->maxY - node->minY <= 8) && (node->maxZ - node->minZ <= 8)) {
			node->addObject(obj);
			return;
		}

		for (int i = node->objects.size() - 1; i >= 0; i--) {
			TreeEntry* existing = node->getObject(i);

			if (existing->isBounding())
				continue;

			node->removeObject(i);

			if (existing->isInSWArea(node)) {
				if (node->swNode == nullptr)
					node->swNode = new TreeNode(node->minX, node->minY, node->minZ, node->dividerX, node->dividerY, node->dividerZ, node);

				_insert(node->swNode, existing);
			} else if (existing->isInSEArea(node)) {
				if (node->seNode == nullptr)
					node->seNode = new TreeNode(node->dividerX, node->minY, node->minZ, node->maxX, node->dividerY, node->dividerZ, node);

				_insert(node->seNode, existing);
			} else if (existing->isInNWArea(node)) {
				if (node->nwNode == nullptr)
					node->nwNode = new TreeNode(node->minX, node->dividerY, node->minZ, node->dividerX, node->maxY, node->dividerZ, node);

				_insert(node->nwNode, existing);
			} else if (existing->isInNEArea(node)) {
				if (node->neNode == nullptr)
					node->neNode = new TreeNode(node->dividerX, node->dividerY, node->minZ, node->maxX, node->maxY, node->dividerZ, node);

				_insert(node->neNode, existing);
			} else if (existing->isInSW2Area(node)) {
				if (node->swNode2 == nullptr)
					node->swNode2 = new TreeNode(node->minX, node->minY, node->dividerZ, node->dividerX, node->dividerY, node->maxZ, node);

				_insert(node->swNode2, existing);
			} else if (existing->isInSE2Area(node)) {
				if (node->seNode2 == nullptr)
					node->seNode2 = new TreeNode(node->dividerX, node->minY, node->dividerZ, node->maxX, node->dividerY, node->maxZ, node);

				_insert(node->seNode2, existing);
			} else if (existing->isInNW2Area(node)) {
				if (node->nwNode2 == nullptr)
					node->nwNode2 = new TreeNode(node->minX, node->dividerY, node->dividerZ, node->dividerX, node->maxY, node->maxZ, node);

				_insert(node->nwNode2, existing);
			} else if (existing->isInNE2Area(node)) {
				if (node->neNode2 == nullptr)
					node->neNode2 = new TreeNode(node->dividerX, node->dividerY, node->dividerZ, node->maxX, node->maxY, node->maxZ, node);

				_insert(node->neNode2, existing);
			}
		}
	}
	if (node->hasSubNodes()) {
		if (obj->isInSWArea(node)) {
			if (node->swNode == nullptr)
				node->swNode = new TreeNode(node->minX, node->minY, node->minZ, node->dividerX, node->dividerY, node->dividerZ, node);

			_insert(node->swNode, obj);
		} else if (obj->isInSEArea(node)) {
			if (node->seNode == nullptr)
				node->seNode = new TreeNode(node->dividerX, node->minY, node->minZ, node->maxX, node->dividerY, node->dividerZ, node);

			_insert(node->seNode, obj);
		} else if (obj->isInNWArea(node)) {
			if (node->nwNode == nullptr)
				node->nwNode = new TreeNode(node->minX, node->dividerY, node->minZ, node->dividerX, node->maxY, node->dividerZ, node);

			_insert(node->nwNode, obj);
		} else if (obj->isInNEArea(node)){
			if (node->neNode == nullptr)
				node->neNode = new TreeNode(node->dividerX, node->dividerY, node->minZ, node->maxX, node->maxY, node->dividerZ, node);

			_insert(node->neNode, obj);
			////////////////////////////////////////////////////////////////////////////////////////////////////////////
		} else if (obj->isInSW2Area(node)) {
			if (node->swNode2 == nullptr)
				node->swNode2 = new TreeNode(node->minX, node->minY, node->dividerZ, node->dividerX, node->dividerY, node->maxZ, node);

			_insert(node->swNode2, obj);
		} else if (obj->isInSE2Area(node)) {
			if (node->seNode2 == nullptr)
				node->seNode2 = new TreeNode(node->dividerX, node->minY, node->dividerZ, node->maxX, node->dividerY, node->maxZ, node);

			_insert(node->seNode2, obj);
		} else if (obj->isInNW2Area(node)) {
			if (node->nwNode2 == nullptr)
				node->nwNode2 = new TreeNode(node->minX, node->dividerY, node->dividerZ, node->dividerX, node->maxY, node->maxZ, node);

			_insert(node->nwNode2, obj);
		} else  {
			if (node->neNode2 == nullptr)
				node->neNode2 = new TreeNode(node->dividerX, node->dividerY, node->dividerZ, node->maxX, node->maxY, node->maxZ, node);

			_insert(node->neNode2, obj);
		}

		return;
	}

	node->addObject(obj);
}

bool OctTree::_update(const Reference<TreeNode*>& node, TreeEntry *obj) {
	//System::out << "(" << obj->getPositionX() << "," << obj->getPositionY() << "," << obj->getPositionZ() << ")\n";

	//Logger::console.info("OctTree::_Update", true);

	if (node->testInside(obj))
		return true;

	Reference<TreeNode*> cur = node->parentNode.get();
	while (cur != nullptr && !cur->testInside(obj))
		cur = cur->parentNode.get();

	remove(obj);

	if (cur != nullptr) {
		_insert(cur, obj);
	}
#ifdef OUTPUTOTERRORS
	else
		System::out << "[OctTree] error on update() - invalid Node\n";
#endif
	return cur != nullptr;
}

void OctTree::safeInRange(TreeEntry* obj, float range) {
	CloseObjectsVector* cov = obj->getCloseObjects();

#ifdef NO_ENTRY_REF_COUNTING
	SortedVector<TreeEntry*> closeObjectsCopy;
#else
	SortedVector<ManagedReference<TreeEntry*> > closeObjectsCopy;
#endif

	Locker objLocker(obj);

	if (cov != nullptr) {
		closeObjectsCopy.removeAll(cov->size(), 50);
		cov->safeCopyTo(closeObjectsCopy);
	}

	float rangecb = range * range * range;
	SceneObject* item = cast<SceneObject*>(obj);
	SceneObject* parent = item->getParent().get();
	float x = obj->getPositionX();
	float y = obj->getPositionY();
	float z = obj->getPositionZ();

#ifdef NO_ENTRY_REF_COUNTING
	SortedVector<TreeEntry*> SpaceinRangeObjects(500, 250);
#else
	SortedVector<ManagedReference<TreeEntry*> > SpaceinRangeObjects(500, 250);
#endif

	ReadLocker locker(&mutex);

	copyObjects(root, x, y, z, range, SpaceinRangeObjects);

	locker.release();

	for (int i = 0; i < SpaceinRangeObjects.size(); ++i) {
		TreeEntry *o = SpaceinRangeObjects.getUnsafe(i);
		SceneObject* item = cast<SceneObject*>(o);

		if (o != obj) {
			float deltaX = x - o->getPositionX();
			float deltaY = y - o->getPositionY();
			float deltaZ = z - o->getPositionZ();
			try {
				if (deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ <= rangecb) {

					CloseObjectsVector* objCloseObjects = obj->getCloseObjects();

					if (objCloseObjects != nullptr)
						obj->addInRangeObject(o); // <-- changed to true

					CloseObjectsVector* oCloseObjects = o->getCloseObjects();

					if (oCloseObjects != nullptr)
						o->addInRangeObject(obj);
				}
			} catch (...) {
				System::out << "unreported exception caught in safeInRange()\n";
			}
		} else {
			if (obj->getCloseObjects() != nullptr)
				obj->addInRangeObject(obj, false);
		}
	}


}

void OctTree::copyObjects(const Reference<TreeNode*>& node, float x, float y, float z, float range, SortedVector<ManagedReference<server::zone::TreeEntry*> >& objects) {
	//	ReadLocker locker(&mutex);

	//objects.addAll(node->objects);
	for (int i = 0; i < node->objects.size(); ++i) {
		objects.add(node->objects.getUnsafe(i).get());
	}

	if (node->hasSubNodes()) {
		if (node->nwNode != nullptr && node->nwNode->testInRange(x, y, z, range))
			copyObjects(node->nwNode, x, y, z, range, objects);
		if (node->neNode != nullptr && node->neNode->testInRange(x, y, z, range))
			copyObjects(node->neNode, x, y, z, range, objects);
		if (node->swNode != nullptr && node->swNode->testInRange(x, y, z, range))
			copyObjects(node->swNode, x, y, z, range, objects);
		if (node->seNode != nullptr && node->seNode->testInRange(x, y, z, range))
			copyObjects(node->seNode, x, y, z, range, objects);
		//////
		if (node->nwNode2 != nullptr && node->nwNode2->testInRange(x, y, z, range))
			copyObjects(node->nwNode2, x, y, z, range, objects);
		if (node->neNode2 != nullptr && node->neNode2->testInRange(x, y, z, range))
			copyObjects(node->neNode2, x, y, z, range, objects);
		if (node->swNode2 != nullptr && node->swNode2->testInRange(x, y, z, range))
			copyObjects(node->swNode2, x, y, z, range, objects);
		if (node->seNode2 != nullptr && node->seNode2->testInRange(x, y, z, range))
			copyObjects(node->seNode2, x, y, z, range, objects);
	}
}

void OctTree::copyObjects(const Reference<TreeNode*>& node, float x, float y, float z, float range, SortedVector<server::zone::TreeEntry*>& objects) {
	//	ReadLocker locker(&mutex);

	//objects.addAll(node->objects);

	for (int i = 0; i < node->objects.size(); ++i) {
		objects.add(node->objects.getUnsafe(i).get());
	}

	if (node->hasSubNodes()) {
		if (node->nwNode != nullptr && node->nwNode->testInRange(x, y, z, range))
			copyObjects(node->nwNode, x, y, z, range, objects);
		if (node->neNode != nullptr && node->neNode->testInRange(x, y, z, range))
			copyObjects(node->neNode, x, y, z, range, objects);
		if (node->swNode != nullptr && node->swNode->testInRange(x, y, z, range))
			copyObjects(node->swNode, x, y, z, range, objects);
		if (node->seNode != nullptr && node->seNode->testInRange(x, y, z, range))
			copyObjects(node->seNode, x, y, z, range, objects);
		////////
		if (node->nwNode2 != nullptr && node->nwNode2->testInRange(x, y, z, range))
			copyObjects(node->nwNode2, x, y, z, range, objects);
		if (node->neNode2 != nullptr && node->neNode2->testInRange(x, y, z, range))
			copyObjects(node->neNode2, x, y, z, range, objects);
		if (node->swNode2 != nullptr && node->swNode2->testInRange(x, y, z, range))
			copyObjects(node->swNode2, x, y, z, range, objects);
		if (node->seNode2 != nullptr && node->seNode2->testInRange(x, y, z, range))
			copyObjects(node->seNode2, x, y, z, range, objects);
	}
}

void OctTree::_inRange(const Reference<TreeNode*>& node, TreeEntry *obj, float range) {
	Reference<TreeNode*> refNode = node;

	float rangecb = range * range * range;

	float x = obj->getPositionX();
	float y = obj->getPositionY();
	float z = obj->getPositionZ();

	float oldx = obj->getPreviousPositionX();
	float oldy = obj->getPreviousPositionY();
	float oldz = obj->getPreviousPositionZ();

	for (int i = 0; i < refNode->objects.size(); i++) {
		TreeEntry *o = refNode->objects.get(i);

		if (o != obj) {
			float deltaX = x - o->getPositionX();
			float deltaY = y - o->getPositionY();
			float deltaZ = z - o->getPositionZ();

			if (deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ <= rangecb) {
				CloseObjectsVector* objCloseObjects = obj->getCloseObjects();
				if (objCloseObjects != nullptr && !objCloseObjects->contains(o)) {
					obj->addInRangeObject(o, false);
					//obj->notifyInsert(o);
				}

				CloseObjectsVector* oCloseObjects = o->getCloseObjects();

				if (oCloseObjects != nullptr && !oCloseObjects->contains(obj)) {
					o->addInRangeObject(obj);
					//o->notifyInsert(obj);
				} else
					o->notifyPositionUpdate(obj);

				/*obj->addInRangeObject(o, false);
				o->addInRangeObject(obj);*/
			} else {
				float oldDeltaX = oldx - o->getPositionX();
				float oldDeltaY = oldy - o->getPositionY();
				float oldDeltaZ = oldz - o->getPositionZ();

				if (oldDeltaX * oldDeltaX + oldDeltaY * oldDeltaY + oldDeltaZ * oldDeltaZ <= rangecb) {

					CloseObjectsVector* objCloseObjects = obj->getCloseObjects();
					if (objCloseObjects != nullptr)
						obj->removeInRangeObject(o);


					CloseObjectsVector* oCloseObjects = o->getCloseObjects();

					if (oCloseObjects != nullptr)
						o->removeInRangeObject(obj);
				}
			}
		} else {
			if (obj->getCloseObjects() != nullptr)
				obj->addInRangeObject(obj, false);
		}
	}

	if (refNode->hasSubNodes()) {
		if (refNode->nwNode != nullptr && refNode->nwNode->testInRange(x, y, z, range))
			_inRange(refNode->nwNode, obj, range);
		if (refNode->neNode != nullptr && refNode->neNode->testInRange(x, y, z, range))
			_inRange(refNode->neNode, obj, range);
		if (refNode->swNode != nullptr && refNode->swNode->testInRange(x, y, z, range))
			_inRange(refNode->swNode, obj, range);
		if (refNode->seNode != nullptr && refNode->seNode->testInRange(x, y, z, range))
			_inRange(refNode->seNode, obj, range);
			////////
		if (refNode->nwNode2 != nullptr && refNode->nwNode2->testInRange(x, y, z, range))
			_inRange(refNode->nwNode2, obj, range);
		if (refNode->neNode2 != nullptr && refNode->neNode2->testInRange(x, y, z, range))
			_inRange(refNode->neNode2, obj, range);
		if (refNode->swNode2 != nullptr && refNode->swNode2->testInRange(x, y, z, range))
			_inRange(refNode->swNode2, obj, range);
		if (refNode->seNode2 != nullptr && refNode->seNode2->testInRange(x, y, z, range))
			_inRange(refNode->seNode2, obj, range);
	}
}

int OctTree::inRange(float x, float y, float z, SortedVector<ManagedReference<TreeEntry*> >& objects) const {
	ReadLocker locker(&mutex);

	try {
		return _inRange(root, x, y, z, objects);
	} catch (Exception& e) {
		System::out << "[OctTree] " << e.getMessage() << "\n";
		e.printStackTrace();
	}

	return 0;
}

int OctTree::inRange(float x, float y, float z, SortedVector<TreeEntry*>& objects) const {
	ReadLocker locker(&mutex);

	try {
		return _inRange(root, x, y, z, objects);
	} catch (Exception& e) {
		System::out << "[OctTree] " << e.getMessage() << "\n";
		e.printStackTrace();
	}

	return 0;
}

int OctTree::_inRange(const Reference<TreeNode*>& node, float x, float y, float z,
		SortedVector<ManagedReference<TreeEntry*> >& objects) const {
	int count = 0;

	for (int i = 0; i < node->objects.size(); i++) {
		TreeEntry *o = node->objects.get(i);

		if (o->containsPoint(x, y, z)) {
			++count;
			objects.put(o);
		}
	}

	if (node->hasSubNodes()) {
		if (node->nwNode != nullptr && node->nwNode->testInside(x, y, z))
			count += _inRange(node->nwNode, x, y, z, objects);
		if (node->neNode != nullptr && node->neNode->testInside(x, y, z))
			count += _inRange(node->neNode, x, y, z, objects);
		if (node->swNode != nullptr && node->swNode->testInside(x, y, z))
			count += _inRange(node->swNode, x, y, z, objects);
		if (node->seNode != nullptr && node->seNode->testInside(x, y, z))
			count += _inRange(node->seNode, x, y, z, objects);
		/////
		if (node->nwNode2 != nullptr && node->nwNode2->testInside(x, y, z))
			count += _inRange(node->nwNode2, x, y, z, objects);
		if (node->neNode2 != nullptr && node->neNode2->testInside(x, y, z))
			count += _inRange(node->neNode2, x, y, z, objects);
		if (node->swNode2 != nullptr && node->swNode2->testInside(x, y, z))
			count += _inRange(node->swNode2, x, y, z, objects);
		if (node->seNode2 != nullptr && node->seNode2->testInside(x, y, z))
			count += _inRange(node->seNode2, x, y, z, objects);
	}

	return count;
}

int OctTree::_inRange(const Reference<TreeNode*>& node, float x, float y, float z,
		SortedVector<TreeEntry* >& objects) const {
	int count = 0;

	for (int i = 0; i < node->objects.size(); i++) {
		TreeEntry *o = node->objects.get(i);

		if (o->containsPoint(x, y, z)) {
			++count;
			objects.put(o);
		}
	}

	if (node->hasSubNodes()) {
		if (node->nwNode != nullptr && node->nwNode->testInside(x, y, z))
			count += _inRange(node->nwNode, x, y, z, objects);
		if (node->neNode != nullptr && node->neNode->testInside(x, y, z))
			count += _inRange(node->neNode, x, y, z, objects);
		if (node->swNode != nullptr && node->swNode->testInside(x, y, z))
			count += _inRange(node->swNode, x, y, z, objects);
		if (node->seNode != nullptr && node->seNode->testInside(x, y, z))
			count += _inRange(node->seNode, x, y, z, objects);
		//////
		if (node->nwNode2 != nullptr && node->nwNode2->testInside(x, y, z))
			count += _inRange(node->nwNode2, x, y, z, objects);
		if (node->neNode2 != nullptr && node->neNode2->testInside(x, y, z))
			count += _inRange(node->neNode2, x, y, z, objects);
		if (node->swNode2 != nullptr && node->swNode2->testInside(x, y, z))
			count += _inRange(node->swNode2, x, y, z, objects);
		if (node->seNode2 != nullptr && node->seNode2->testInside(x, y, z))
			count += _inRange(node->seNode2, x, y, z, objects);
	}

	return count;
}

int OctTree::_inRange(const Reference<TreeNode*>& node, float x, float y, float z, float range,
		SortedVector<ManagedReference<TreeEntry*> >& objects) const {
	int count = 0;

	for (int i = 0; i < node->objects.size(); i++) {
		TreeEntry *o = node->objects.get(i);

		if (o->isInRange(x, y, z, range)) {
			++count;
			objects.put(o);
		}
	}

	if (node->hasSubNodes()) {
		if (node->nwNode != nullptr && node->nwNode->testInside(x, y, z))
			count += _inRange(node->nwNode, x, y, z, objects);
		if (node->neNode != nullptr && node->neNode->testInside(x, y, z))
			count += _inRange(node->neNode, x, y, z, objects);
		if (node->swNode != nullptr && node->swNode->testInside(x, y, z))
			count += _inRange(node->swNode, x, y, z, objects);
		if (node->seNode != nullptr && node->seNode->testInside(x, y, z))
			count += _inRange(node->seNode, x, y, z, objects);
		//////
		if (node->nwNode2 != nullptr && node->nwNode2->testInside(x, y, z))
			count += _inRange(node->nwNode2, x, y, z, objects);
		if (node->neNode2 != nullptr && node->neNode2->testInside(x, y, z))
			count += _inRange(node->neNode2, x, y, z, objects);
		if (node->swNode2 != nullptr && node->swNode2->testInside(x, y, z))
			count += _inRange(node->swNode2, x, y, z, objects);
		if (node->seNode2 != nullptr && node->seNode2->testInside(x, y, z))
			count += _inRange(node->seNode2, x, y, z, objects);
	}

	return count;
}

int OctTree::_inRange(const Reference<TreeNode*>& node, float x, float y, float z, float range,
		SortedVector<TreeEntry* >& objects) const {
	int count = 0;

	for (int i = 0; i < node->objects.size(); i++) {
		TreeEntry *o = node->objects.getUnsafe(i);

		if (o->isInRange(x, y, z, range)) {
			++count;
			objects.put(o);
		}
	}

	if (node->hasSubNodes()) {
		if (node->nwNode != nullptr && node->nwNode->testInside(x, y, z))
			count += _inRange(node->nwNode, x, y, z, objects);
		if (node->neNode != nullptr && node->neNode->testInside(x, y, z))
			count += _inRange(node->neNode, x, y, z, objects);
		if (node->swNode != nullptr && node->swNode->testInside(x, y, z))
			count += _inRange(node->swNode, x, y, z, objects);
		if (node->seNode != nullptr && node->seNode->testInside(x, y, z))
			count += _inRange(node->seNode, x, y, z, objects);
		//////
		if (node->nwNode2 != nullptr && node->nwNode2->testInside(x, y, z))
			count += _inRange(node->nwNode2, x, y, z, objects);
		if (node->neNode2 != nullptr && node->neNode2->testInside(x, y, z))
			count += _inRange(node->neNode2, x, y, z, objects);
		if (node->swNode2 != nullptr && node->swNode2->testInside(x, y, z))
			count += _inRange(node->swNode2, x, y, z, objects);
		if (node->seNode2 != nullptr && node->seNode2->testInside(x, y, z))
			count += _inRange(node->seNode2, x, y, z, objects);
	}

	return count;
}
