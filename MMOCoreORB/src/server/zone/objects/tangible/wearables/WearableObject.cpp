/*
 *	server/zone/objects/tangible/wearables/WearableObject.cpp generated by engine3 IDL compiler 0.60
 */

#include "WearableObject.h"

#include "server/zone/packets/scene/AttributeListMessage.h"

#include "server/zone/Zone.h"

#include "server/zone/objects/creature/CreatureObject.h"

/*
 *	WearableObjectStub
 */

enum {RPC_INITIALIZETRANSIENTMEMBERS__ = 6,RPC_APPLYATTACHMENT__CREATUREOBJECT_ATTACHMENT_,RPC_APPLYSKILLMODSTO__CREATUREOBJECT_BOOL_,RPC_REMOVESKILLMODSFROM__CREATUREOBJECT_,RPC_ISWEARABLEOBJECT__,RPC_ISEQUIPPED__,RPC_GETMAXSOCKETS__,RPC_SOCKETSUSED__,RPC_SOCKETSLEFT__,RPC_REPAIRATTEMPT__INT_,RPC_ADDSKILLMOD__INT_STRING_INT_BOOL_,RPC_SETMAXSOCKETS__INT_};

WearableObject::WearableObject() : TangibleObject(DummyConstructorParameter::instance()) {
	WearableObjectImplementation* _implementation = new WearableObjectImplementation();
	_impl = _implementation;
	_impl->_setStub(this);
	_setClassName("WearableObject");
}

WearableObject::WearableObject(DummyConstructorParameter* param) : TangibleObject(param) {
	_setClassName("WearableObject");
}

WearableObject::~WearableObject() {
}



void WearableObject::initializeTransientMembers() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_INITIALIZETRANSIENTMEMBERS__);

		method.executeWithVoidReturn();
	} else
		_implementation->initializeTransientMembers();
}

void WearableObject::fillAttributeList(AttributeListMessage* msg, CreatureObject* object) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		throw ObjectNotLocalException(this);

	} else
		_implementation->fillAttributeList(msg, object);
}

void WearableObject::updateCraftingValues(CraftingValues* values, bool initialUpdate) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		throw ObjectNotLocalException(this);

	} else
		_implementation->updateCraftingValues(values, initialUpdate);
}

void WearableObject::applyAttachment(CreatureObject* player, Attachment* attachment) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_APPLYATTACHMENT__CREATUREOBJECT_ATTACHMENT_);
		method.addObjectParameter(player);
		method.addObjectParameter(attachment);

		method.executeWithVoidReturn();
	} else
		_implementation->applyAttachment(player, attachment);
}

void WearableObject::applySkillModsTo(CreatureObject* creature, bool doCheck) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_APPLYSKILLMODSTO__CREATUREOBJECT_BOOL_);
		method.addObjectParameter(creature);
		method.addBooleanParameter(doCheck);

		method.executeWithVoidReturn();
	} else
		_implementation->applySkillModsTo(creature, doCheck);
}

void WearableObject::removeSkillModsFrom(CreatureObject* creature) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_REMOVESKILLMODSFROM__CREATUREOBJECT_);
		method.addObjectParameter(creature);

		method.executeWithVoidReturn();
	} else
		_implementation->removeSkillModsFrom(creature);
}

bool WearableObject::isWearableObject() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_ISWEARABLEOBJECT__);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isWearableObject();
}

bool WearableObject::isEquipped() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_ISEQUIPPED__);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isEquipped();
}

int WearableObject::getMaxSockets() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_GETMAXSOCKETS__);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getMaxSockets();
}

int WearableObject::socketsUsed() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SOCKETSUSED__);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->socketsUsed();
}

int WearableObject::socketsLeft() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SOCKETSLEFT__);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->socketsLeft();
}

String WearableObject::repairAttempt(int repairChance) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_REPAIRATTEMPT__INT_);
		method.addSignedIntParameter(repairChance);

		String _return_repairAttempt;
		method.executeWithAsciiReturn(_return_repairAttempt);
		return _return_repairAttempt;
	} else
		return _implementation->repairAttempt(repairChance);
}

VectorMap<String, int>* WearableObject::getWearableSkillMods() {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		throw ObjectNotLocalException(this);

	} else
		return _implementation->getWearableSkillMods();
}

void WearableObject::addSkillMod(const int skillType, const String& skillMod, int value, bool notifyClient) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_ADDSKILLMOD__INT_STRING_INT_BOOL_);
		method.addSignedIntParameter(skillType);
		method.addAsciiParameter(skillMod);
		method.addSignedIntParameter(value);
		method.addBooleanParameter(notifyClient);

		method.executeWithVoidReturn();
	} else
		_implementation->addSkillMod(skillType, skillMod, value, notifyClient);
}

void WearableObject::setMaxSockets(int maxSockets) {
	WearableObjectImplementation* _implementation = static_cast<WearableObjectImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SETMAXSOCKETS__INT_);
		method.addSignedIntParameter(maxSockets);

		method.executeWithVoidReturn();
	} else
		_implementation->setMaxSockets(maxSockets);
}

DistributedObjectServant* WearableObject::_getImplementation() {

	 if (!_updated) _updated = true;
	return _impl;
}

DistributedObjectServant* WearableObject::_getImplementationForRead() {
	return _impl;
}

void WearableObject::_setImplementation(DistributedObjectServant* servant) {
	_impl = servant;
}

/*
 *	WearableObjectImplementation
 */

WearableObjectImplementation::WearableObjectImplementation(DummyConstructorParameter* param) : TangibleObjectImplementation(param) {
	_initializeImplementation();
}


WearableObjectImplementation::~WearableObjectImplementation() {
}


void WearableObjectImplementation::finalize() {
}

void WearableObjectImplementation::_initializeImplementation() {
	_setClassHelper(WearableObjectHelper::instance());

	_this = NULL;

	_serializationHelperMethod();
}

void WearableObjectImplementation::_setStub(DistributedObjectStub* stub) {
	_this = static_cast<WearableObject*>(stub);
	TangibleObjectImplementation::_setStub(stub);
}

DistributedObjectStub* WearableObjectImplementation::_getStub() {
	return _this.get();
}

WearableObjectImplementation::operator const WearableObject*() {
	return _this.get();
}

void WearableObjectImplementation::lock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->lock(doLock);
}

void WearableObjectImplementation::lock(ManagedObject* obj) {
	_this.getReferenceUnsafeStaticCast()->lock(obj);
}

void WearableObjectImplementation::rlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->rlock(doLock);
}

void WearableObjectImplementation::wlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->wlock(doLock);
}

void WearableObjectImplementation::wlock(ManagedObject* obj) {
	_this.getReferenceUnsafeStaticCast()->wlock(obj);
}

void WearableObjectImplementation::unlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->unlock(doLock);
}

void WearableObjectImplementation::runlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->runlock(doLock);
}

void WearableObjectImplementation::_serializationHelperMethod() {
	TangibleObjectImplementation::_serializationHelperMethod();

	_setClassName("WearableObject");

}

void WearableObjectImplementation::readObject(ObjectInputStream* stream) {
	uint16 _varCount = stream->readShort();
	for (int i = 0; i < _varCount; ++i) {
		uint32 _nameHashCode;
		TypeInfo<uint32>::parseFromBinaryStream(&_nameHashCode, stream);

		uint32 _varSize = stream->readInt();

		int _currentOffset = stream->getOffset();

		if(WearableObjectImplementation::readObjectMember(stream, _nameHashCode)) {
		}

		stream->setOffset(_currentOffset + _varSize);
	}

	initializeTransientMembers();
}

bool WearableObjectImplementation::readObjectMember(ObjectInputStream* stream, const uint32& nameHashCode) {
	if (TangibleObjectImplementation::readObjectMember(stream, nameHashCode))
		return true;

	switch(nameHashCode) {
	case 0xc21c323f: //WearableObject.socketCount
		TypeInfo<int >::parseFromBinaryStream(&socketCount, stream);
		return true;

	case 0xd9dac00b: //WearableObject.socketsGenerated
		TypeInfo<bool >::parseFromBinaryStream(&socketsGenerated, stream);
		return true;

<<<<<<< HEAD
<<<<<<< HEAD
	if (_name == "WearableObject.objectCreatedPreUsedSocketCountFix") {
=======
	case 0xf1b2f6f0: //WearableObject.objectCreatedPreUsedSocketCountFix
>>>>>>> refs/remotes/origin/unstable
		TypeInfo<bool >::parseFromBinaryStream(&objectCreatedPreUsedSocketCountFix, stream);
		return true;

	case 0xe6af92c5: //WearableObject.usedSocketCount
		TypeInfo<int >::parseFromBinaryStream(&usedSocketCount, stream);
		return true;

<<<<<<< HEAD
=======
>>>>>>> origin/stable
	if (_name == "WearableObject.modsNotInSockets") {
=======
	case 0xe16cd3a5: //WearableObject.modsNotInSockets
>>>>>>> refs/remotes/origin/unstable
		TypeInfo<int >::parseFromBinaryStream(&modsNotInSockets, stream);
		return true;

	case 0x3e4d7b7b: //WearableObject.wearableSkillMods
		TypeInfo<VectorMap<String, int> >::parseFromBinaryStream(&wearableSkillMods, stream);
		return true;

	}

	return false;
}

void WearableObjectImplementation::writeObject(ObjectOutputStream* stream) {
	int _currentOffset = stream->getOffset();
	stream->writeShort(0);
	int _varCount = WearableObjectImplementation::writeObjectMembers(stream);
	stream->writeShort(_currentOffset, _varCount);
}

int WearableObjectImplementation::writeObjectMembers(ObjectOutputStream* stream) {
	int _count = TangibleObjectImplementation::writeObjectMembers(stream);

	uint32 _nameHashCode;
	int _offset;
	uint32 _totalSize;
	_nameHashCode = 0xc21c323f; //WearableObject.socketCount
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<int >::toBinaryStream(&socketCount, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

	_nameHashCode = 0xd9dac00b; //WearableObject.socketsGenerated
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<bool >::toBinaryStream(&socketsGenerated, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

<<<<<<< HEAD
<<<<<<< HEAD
	_name = "WearableObject.objectCreatedPreUsedSocketCountFix";
	_name.toBinaryStream(stream);
=======
	_nameHashCode = 0xf1b2f6f0; //WearableObject.objectCreatedPreUsedSocketCountFix
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
>>>>>>> refs/remotes/origin/unstable
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<bool >::toBinaryStream(&objectCreatedPreUsedSocketCountFix, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

	_nameHashCode = 0xe6af92c5; //WearableObject.usedSocketCount
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<int >::toBinaryStream(&usedSocketCount, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

<<<<<<< HEAD
=======
>>>>>>> origin/stable
	_name = "WearableObject.modsNotInSockets";
	_name.toBinaryStream(stream);
=======
	_nameHashCode = 0xe16cd3a5; //WearableObject.modsNotInSockets
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
>>>>>>> refs/remotes/origin/unstable
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<int >::toBinaryStream(&modsNotInSockets, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

	_nameHashCode = 0x3e4d7b7b; //WearableObject.wearableSkillMods
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<VectorMap<String, int> >::toBinaryStream(&wearableSkillMods, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);


<<<<<<< HEAD
	return _count + 6;
=======
	return _count + 4;
>>>>>>> origin/stable
}

WearableObjectImplementation::WearableObjectImplementation() {
	_initializeImplementation();
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		socketsGenerated = false;
	socketsGenerated = false;
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		socketCount = 0;
	socketCount = 0;
<<<<<<< HEAD
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		objectCreatedPreUsedSocketCountFix = true;
	objectCreatedPreUsedSocketCountFix = true;
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		usedSocketCount = 0;
	usedSocketCount = 0;
=======
>>>>>>> origin/stable
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		modsNotInSockets = 0;
	modsNotInSockets = 0;
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		wearableSkillMods.setAllowOverwriteInsertPlan();
	(&wearableSkillMods)->setAllowOverwriteInsertPlan();
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		Logger.setLoggingName("WearableObject");
	Logger::setLoggingName("WearableObject");
}

bool WearableObjectImplementation::isWearableObject() {
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		return true;
	return true;
}

int WearableObjectImplementation::getMaxSockets() {
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		return socketCount;
	return socketCount;
}

int WearableObjectImplementation::socketsLeft() {
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		return getMaxSockets() - socketsUsed();
	return getMaxSockets() - socketsUsed();
}

VectorMap<String, int>* WearableObjectImplementation::getWearableSkillMods() {
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		return wearableSkillMods;
	return (&wearableSkillMods);
}

void WearableObjectImplementation::addSkillMod(const int skillType, const String& skillMod, int value, bool notifyClient) {
<<<<<<< HEAD
	// server/zone/objects/tangible/wearables/WearableObject.idl():  	}
	if ((&wearableSkillMods)->size() <= 6){
	// server/zone/objects/tangible/wearables/WearableObject.idl():  			wearableSkillMods.put(skillMod, value);
	(&wearableSkillMods)->put(skillMod, value);
	// server/zone/objects/tangible/wearables/WearableObject.idl():  			modsNotInSockets++;
	modsNotInSockets ++;
}
}
=======
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		wearableSkillMods.put(skillMod, value);
	(&wearableSkillMods)->put(skillMod, value);
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		modsNotInSockets++;
	modsNotInSockets ++;
}
>>>>>>> origin/stable

void WearableObjectImplementation::setMaxSockets(int maxSockets) {
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		socketCount 
	if (maxSockets < 0){
	// server/zone/objects/tangible/wearables/WearableObject.idl():  			maxSockets = 0;
	maxSockets = 0;
}

	else 	// server/zone/objects/tangible/wearables/WearableObject.idl():  		socketCount 
	if (maxSockets > MAXSOCKETS){
	// server/zone/objects/tangible/wearables/WearableObject.idl():  			maxSockets = MAXSOCKETS;
	maxSockets = MAXSOCKETS;
}
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		socketCount = maxSockets;
	socketCount = maxSockets;
	// server/zone/objects/tangible/wearables/WearableObject.idl():  		socketsGenerated = true;
	socketsGenerated = true;
}

/*
 *	WearableObjectAdapter
 */


#include "engine/orb/messages/InvokeMethodMessage.h"


WearableObjectAdapter::WearableObjectAdapter(WearableObject* obj) : TangibleObjectAdapter(obj) {
}

void WearableObjectAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	DOBMessage* resp = inv->getInvocationMessage();

	switch (methid) {
	case RPC_INITIALIZETRANSIENTMEMBERS__:
		{
			initializeTransientMembers();
		}
		break;
	case RPC_APPLYATTACHMENT__CREATUREOBJECT_ATTACHMENT_:
		{
			applyAttachment(static_cast<CreatureObject*>(inv->getObjectParameter()), static_cast<Attachment*>(inv->getObjectParameter()));
		}
		break;
	case RPC_APPLYSKILLMODSTO__CREATUREOBJECT_BOOL_:
		{
			applySkillModsTo(static_cast<CreatureObject*>(inv->getObjectParameter()), inv->getBooleanParameter());
		}
		break;
	case RPC_REMOVESKILLMODSFROM__CREATUREOBJECT_:
		{
			removeSkillModsFrom(static_cast<CreatureObject*>(inv->getObjectParameter()));
		}
		break;
	case RPC_ISWEARABLEOBJECT__:
		{
			resp->insertBoolean(isWearableObject());
		}
		break;
	case RPC_ISEQUIPPED__:
		{
			resp->insertBoolean(isEquipped());
		}
		break;
	case RPC_GETMAXSOCKETS__:
		{
			resp->insertSignedInt(getMaxSockets());
		}
		break;
	case RPC_SOCKETSUSED__:
		{
			resp->insertSignedInt(socketsUsed());
		}
		break;
	case RPC_SOCKETSLEFT__:
		{
			resp->insertSignedInt(socketsLeft());
		}
		break;
	case RPC_REPAIRATTEMPT__INT_:
		{
			resp->insertAscii(repairAttempt(inv->getSignedIntParameter()));
		}
		break;
	case RPC_ADDSKILLMOD__INT_STRING_INT_BOOL_:
		{
			String skillMod; 
			addSkillMod(inv->getSignedIntParameter(), inv->getAsciiParameter(skillMod), inv->getSignedIntParameter(), inv->getBooleanParameter());
		}
		break;
	case RPC_SETMAXSOCKETS__INT_:
		{
			setMaxSockets(inv->getSignedIntParameter());
		}
		break;
	default:
		throw Exception("Method does not exists");
	}
}

void WearableObjectAdapter::initializeTransientMembers() {
	(static_cast<WearableObject*>(stub))->initializeTransientMembers();
}

void WearableObjectAdapter::applyAttachment(CreatureObject* player, Attachment* attachment) {
	(static_cast<WearableObject*>(stub))->applyAttachment(player, attachment);
}

void WearableObjectAdapter::applySkillModsTo(CreatureObject* creature, bool doCheck) {
	(static_cast<WearableObject*>(stub))->applySkillModsTo(creature, doCheck);
}

void WearableObjectAdapter::removeSkillModsFrom(CreatureObject* creature) {
	(static_cast<WearableObject*>(stub))->removeSkillModsFrom(creature);
}

bool WearableObjectAdapter::isWearableObject() {
	return (static_cast<WearableObject*>(stub))->isWearableObject();
}

bool WearableObjectAdapter::isEquipped() {
	return (static_cast<WearableObject*>(stub))->isEquipped();
}

int WearableObjectAdapter::getMaxSockets() {
	return (static_cast<WearableObject*>(stub))->getMaxSockets();
}

int WearableObjectAdapter::socketsUsed() {
	return (static_cast<WearableObject*>(stub))->socketsUsed();
}

int WearableObjectAdapter::socketsLeft() {
	return (static_cast<WearableObject*>(stub))->socketsLeft();
}

String WearableObjectAdapter::repairAttempt(int repairChance) {
	return (static_cast<WearableObject*>(stub))->repairAttempt(repairChance);
}

void WearableObjectAdapter::addSkillMod(const int skillType, const String& skillMod, int value, bool notifyClient) {
	(static_cast<WearableObject*>(stub))->addSkillMod(skillType, skillMod, value, notifyClient);
}

void WearableObjectAdapter::setMaxSockets(int maxSockets) {
	(static_cast<WearableObject*>(stub))->setMaxSockets(maxSockets);
}

/*
 *	WearableObjectHelper
 */

WearableObjectHelper* WearableObjectHelper::staticInitializer = WearableObjectHelper::instance();

WearableObjectHelper::WearableObjectHelper() {
	className = "WearableObject";

	Core::getObjectBroker()->registerClass(className, this);
}

void WearableObjectHelper::finalizeHelper() {
	WearableObjectHelper::finalize();
}

DistributedObject* WearableObjectHelper::instantiateObject() {
	return new WearableObject(DummyConstructorParameter::instance());
}

DistributedObjectServant* WearableObjectHelper::instantiateServant() {
	return new WearableObjectImplementation();
}

DistributedObjectAdapter* WearableObjectHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new WearableObjectAdapter(static_cast<WearableObject*>(obj));

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

