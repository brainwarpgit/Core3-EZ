/*
 *	server/zone/objects/creature/junkdealer/JunkdealerCreature.cpp generated by engine3 IDL compiler 0.60
 */

#include "JunkdealerCreature.h"

#include "server/zone/Zone.h"

#include "server/zone/objects/scene/SceneObject.h"

/*
 *	JunkdealerCreatureStub
 */

enum {RPC_ACTIVATERECOVERY__,RPC_SENDINITIALMESSAGE__CREATUREOBJECT_,RPC_SENDINITIALCHOICES__CREATUREOBJECT_,RPC_SENDCONVERSATIONSTARTTO__SCENEOBJECT_,RPC_SELECTCONVERSATIONOPTION__INT_SCENEOBJECT_,RPC_GETCONVERSATIONSTRING__INT_,RPC_GETLOCATION__,RPC_SETLOCATION__STRING_,RPC_ISATTACKABLEBY__CREATUREOBJECT_,RPC_CREATESELLJUNKLOOTSELECTION__CREATUREOBJECT_,RPC_CANINVENTORYITEMBESOLDASJUNK__TANGIBLEOBJECT_INT_,RPC_SETJUNKDEALERBUYERTYPE__INT_,RPC_GETJUNKDEALERBUYERTYPE__,RPC_SETJUNKDEALERCONVERSATIONTYPE__INT_,RPC_GETJUNKDEALERCONVERSATIONTYPE__,RPC_ISJUNKDEALER__};

JunkdealerCreature::JunkdealerCreature() : CreatureObject(DummyConstructorParameter::instance()) {
	JunkdealerCreatureImplementation* _implementation = new JunkdealerCreatureImplementation();
	_impl = _implementation;
	_impl->_setStub(this);
	_setClassName("JunkdealerCreature");
}

JunkdealerCreature::JunkdealerCreature(DummyConstructorParameter* param) : CreatureObject(param) {
	_setClassName("JunkdealerCreature");
}

JunkdealerCreature::~JunkdealerCreature() {
}



void JunkdealerCreature::loadTemplateData(SharedObjectTemplate* templateData) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		throw ObjectNotLocalException(this);

	} else
		_implementation->loadTemplateData(templateData);
}

void JunkdealerCreature::activateRecovery() {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_ACTIVATERECOVERY__);

		method.executeWithVoidReturn();
	} else
		_implementation->activateRecovery();
}

void JunkdealerCreature::sendInitialMessage(CreatureObject* player) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SENDINITIALMESSAGE__CREATUREOBJECT_);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		_implementation->sendInitialMessage(player);
}

void JunkdealerCreature::sendInitialChoices(CreatureObject* player) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SENDINITIALCHOICES__CREATUREOBJECT_);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		_implementation->sendInitialChoices(player);
}

void JunkdealerCreature::sendConversationStartTo(SceneObject* obj) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SENDCONVERSATIONSTARTTO__SCENEOBJECT_);
		method.addObjectParameter(obj);

		method.executeWithVoidReturn();
	} else
		_implementation->sendConversationStartTo(obj);
}

void JunkdealerCreature::selectConversationOption(int option, SceneObject* obj) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SELECTCONVERSATIONOPTION__INT_SCENEOBJECT_);
		method.addSignedIntParameter(option);
		method.addObjectParameter(obj);

		method.executeWithVoidReturn();
	} else
		_implementation->selectConversationOption(option, obj);
}

String JunkdealerCreature::getConversationString(int dealerType) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_GETCONVERSATIONSTRING__INT_);
		method.addSignedIntParameter(dealerType);

		String _return_getConversationString;
		method.executeWithAsciiReturn(_return_getConversationString);
		return _return_getConversationString;
	} else
		return _implementation->getConversationString(dealerType);
}

String JunkdealerCreature::getLocation() {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_GETLOCATION__);

		String _return_getLocation;
		method.executeWithAsciiReturn(_return_getLocation);
		return _return_getLocation;
	} else
		return _implementation->getLocation();
}

void JunkdealerCreature::setLocation(const String& loc) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SETLOCATION__STRING_);
		method.addAsciiParameter(loc);

		method.executeWithVoidReturn();
	} else
		_implementation->setLocation(loc);
}

bool JunkdealerCreature::isAttackableBy(CreatureObject* object) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_ISATTACKABLEBY__CREATUREOBJECT_);
		method.addObjectParameter(object);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isAttackableBy(object);
}

void JunkdealerCreature::createSellJunkLootSelection(CreatureObject* player) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_CREATESELLJUNKLOOTSELECTION__CREATUREOBJECT_);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		_implementation->createSellJunkLootSelection(player);
}

bool JunkdealerCreature::canInventoryItemBeSoldAsJunk(TangibleObject* lootItem, int dealerType) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_CANINVENTORYITEMBESOLDASJUNK__TANGIBLEOBJECT_INT_);
		method.addObjectParameter(lootItem);
		method.addSignedIntParameter(dealerType);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->canInventoryItemBeSoldAsJunk(lootItem, dealerType);
}

void JunkdealerCreature::setJunkDealerBuyerType(int jdBuyerType) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SETJUNKDEALERBUYERTYPE__INT_);
		method.addSignedIntParameter(jdBuyerType);

		method.executeWithVoidReturn();
	} else
		_implementation->setJunkDealerBuyerType(jdBuyerType);
}

int JunkdealerCreature::getJunkDealerBuyerType() {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_GETJUNKDEALERBUYERTYPE__);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getJunkDealerBuyerType();
}

void JunkdealerCreature::setJunkDealerConversationType(int jdConvoType) {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_SETJUNKDEALERCONVERSATIONTYPE__INT_);
		method.addSignedIntParameter(jdConvoType);

		method.executeWithVoidReturn();
	} else
		_implementation->setJunkDealerConversationType(jdConvoType);
}

int JunkdealerCreature::getJunkDealerConversationType() {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_GETJUNKDEALERCONVERSATIONTYPE__);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getJunkDealerConversationType();
}

bool JunkdealerCreature::isJunkDealer() {
	JunkdealerCreatureImplementation* _implementation = static_cast<JunkdealerCreatureImplementation*>(_getImplementation());
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, RPC_ISJUNKDEALER__);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isJunkDealer();
}

DistributedObjectServant* JunkdealerCreature::_getImplementation() {

	 if (!_updated) _updated = true;
	return _impl;
}

DistributedObjectServant* JunkdealerCreature::_getImplementationForRead() {
	return _impl;
}

void JunkdealerCreature::_setImplementation(DistributedObjectServant* servant) {
	_impl = servant;
}

/*
 *	JunkdealerCreatureImplementation
 */

JunkdealerCreatureImplementation::JunkdealerCreatureImplementation(DummyConstructorParameter* param) : CreatureObjectImplementation(param) {
	_initializeImplementation();
}


JunkdealerCreatureImplementation::~JunkdealerCreatureImplementation() {
}


void JunkdealerCreatureImplementation::finalize() {
}

void JunkdealerCreatureImplementation::_initializeImplementation() {
	_setClassHelper(JunkdealerCreatureHelper::instance());

	_this = NULL;

	_serializationHelperMethod();
}

void JunkdealerCreatureImplementation::_setStub(DistributedObjectStub* stub) {
	_this = static_cast<JunkdealerCreature*>(stub);
	CreatureObjectImplementation::_setStub(stub);
}

DistributedObjectStub* JunkdealerCreatureImplementation::_getStub() {
	return _this.get();
}

JunkdealerCreatureImplementation::operator const JunkdealerCreature*() {
	return _this.get();
}

void JunkdealerCreatureImplementation::lock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->lock(doLock);
}

void JunkdealerCreatureImplementation::lock(ManagedObject* obj) {
	_this.getReferenceUnsafeStaticCast()->lock(obj);
}

void JunkdealerCreatureImplementation::rlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->rlock(doLock);
}

void JunkdealerCreatureImplementation::wlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->wlock(doLock);
}

void JunkdealerCreatureImplementation::wlock(ManagedObject* obj) {
	_this.getReferenceUnsafeStaticCast()->wlock(obj);
}

void JunkdealerCreatureImplementation::unlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->unlock(doLock);
}

void JunkdealerCreatureImplementation::runlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->runlock(doLock);
}

void JunkdealerCreatureImplementation::_serializationHelperMethod() {
	CreatureObjectImplementation::_serializationHelperMethod();

	_setClassName("JunkdealerCreature");

}

void JunkdealerCreatureImplementation::readObject(ObjectInputStream* stream) {
	uint16 _varCount = stream->readShort();
	for (int i = 0; i < _varCount; ++i) {
		uint32 _nameHashCode;
		TypeInfo<uint32>::parseFromBinaryStream(&_nameHashCode, stream);

		uint32 _varSize = stream->readInt();

		int _currentOffset = stream->getOffset();

		if(JunkdealerCreatureImplementation::readObjectMember(stream, _nameHashCode)) {
		}

		stream->setOffset(_currentOffset + _varSize);
	}

	initializeTransientMembers();
}

bool JunkdealerCreatureImplementation::readObjectMember(ObjectInputStream* stream, const uint32& nameHashCode) {
	if (CreatureObjectImplementation::readObjectMember(stream, nameHashCode))
		return true;

	switch(nameHashCode) {
	case 0x13e1ff5e: //JunkdealerCreature.location
		TypeInfo<String >::parseFromBinaryStream(&location, stream);
		return true;

	case 0xdd106bf8: //JunkdealerCreature.junkDealerBuyerType
		TypeInfo<int >::parseFromBinaryStream(&junkDealerBuyerType, stream);
		return true;

	case 0x6a045b8b: //JunkdealerCreature.junkDealerConversationType
		TypeInfo<int >::parseFromBinaryStream(&junkDealerConversationType, stream);
		return true;

	}

	return false;
}

void JunkdealerCreatureImplementation::writeObject(ObjectOutputStream* stream) {
	int _currentOffset = stream->getOffset();
	stream->writeShort(0);
	int _varCount = JunkdealerCreatureImplementation::writeObjectMembers(stream);
	stream->writeShort(_currentOffset, _varCount);
}

int JunkdealerCreatureImplementation::writeObjectMembers(ObjectOutputStream* stream) {
	int _count = CreatureObjectImplementation::writeObjectMembers(stream);

	uint32 _nameHashCode;
	int _offset;
	uint32 _totalSize;
	_nameHashCode = 0x13e1ff5e; //JunkdealerCreature.location
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<String >::toBinaryStream(&location, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

	_nameHashCode = 0xdd106bf8; //JunkdealerCreature.junkDealerBuyerType
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<int >::toBinaryStream(&junkDealerBuyerType, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);

	_nameHashCode = 0x6a045b8b; //JunkdealerCreature.junkDealerConversationType
	TypeInfo<uint32>::toBinaryStream(&_nameHashCode, stream);
	_offset = stream->getOffset();
	stream->writeInt(0);
	TypeInfo<int >::toBinaryStream(&junkDealerConversationType, stream);
	_totalSize = (uint32) (stream->getOffset() - (_offset + 4));
	stream->writeInt(_offset, _totalSize);


	return _count + 3;
}

JunkdealerCreatureImplementation::JunkdealerCreatureImplementation() {
	_initializeImplementation();
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		Logger.setLoggingName("JunkdealerCreature");
	Logger::setLoggingName("JunkdealerCreature");
}

void JunkdealerCreatureImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		super.loadTemplateData(templateData);
	CreatureObjectImplementation::loadTemplateData(templateData);
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		super.optionsBitmask = 0x108;
	CreatureObjectImplementation::optionsBitmask = 0x108;
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		super.pvpStatusBitmask = 0;
	CreatureObjectImplementation::pvpStatusBitmask = 0;
}

void JunkdealerCreatureImplementation::activateRecovery() {
}

String JunkdealerCreatureImplementation::getLocation() {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		return location;
	return location;
}

void JunkdealerCreatureImplementation::setLocation(const String& loc) {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		location = loc;
	location = loc;
}

bool JunkdealerCreatureImplementation::isAttackableBy(CreatureObject* object) {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		return false;
	return false;
}

void JunkdealerCreatureImplementation::setJunkDealerBuyerType(int jdBuyerType) {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		junkDealerBuyerType = jdBuyerType;
	junkDealerBuyerType = jdBuyerType;
}

int JunkdealerCreatureImplementation::getJunkDealerBuyerType() {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		return junkDealerBuyerType;
	return junkDealerBuyerType;
}

void JunkdealerCreatureImplementation::setJunkDealerConversationType(int jdConvoType) {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		junkDealerConversationType = jdConvoType;
	junkDealerConversationType = jdConvoType;
}

int JunkdealerCreatureImplementation::getJunkDealerConversationType() {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		return junkDealerConversationType;
	return junkDealerConversationType;
}

bool JunkdealerCreatureImplementation::isJunkDealer() {
	// server/zone/objects/creature/junkdealer/JunkdealerCreature.idl():  		return true;
	return true;
}

/*
 *	JunkdealerCreatureAdapter
 */


#include "engine/orb/messages/InvokeMethodMessage.h"


JunkdealerCreatureAdapter::JunkdealerCreatureAdapter(JunkdealerCreature* obj) : CreatureObjectAdapter(obj) {
}

void JunkdealerCreatureAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	DOBMessage* resp = inv->getInvocationMessage();

	switch (methid) {
	case RPC_ACTIVATERECOVERY__:
		{
			activateRecovery();
		}
		break;
	case RPC_SENDINITIALMESSAGE__CREATUREOBJECT_:
		{
			sendInitialMessage(static_cast<CreatureObject*>(inv->getObjectParameter()));
		}
		break;
	case RPC_SENDINITIALCHOICES__CREATUREOBJECT_:
		{
			sendInitialChoices(static_cast<CreatureObject*>(inv->getObjectParameter()));
		}
		break;
	case RPC_SENDCONVERSATIONSTARTTO__SCENEOBJECT_:
		{
			sendConversationStartTo(static_cast<SceneObject*>(inv->getObjectParameter()));
		}
		break;
	case RPC_SELECTCONVERSATIONOPTION__INT_SCENEOBJECT_:
		{
			selectConversationOption(inv->getSignedIntParameter(), static_cast<SceneObject*>(inv->getObjectParameter()));
		}
		break;
	case RPC_GETCONVERSATIONSTRING__INT_:
		{
			resp->insertAscii(getConversationString(inv->getSignedIntParameter()));
		}
		break;
	case RPC_GETLOCATION__:
		{
			resp->insertAscii(getLocation());
		}
		break;
	case RPC_SETLOCATION__STRING_:
		{
			String loc; 
			setLocation(inv->getAsciiParameter(loc));
		}
		break;
	case RPC_ISATTACKABLEBY__CREATUREOBJECT_:
		{
			resp->insertBoolean(isAttackableBy(static_cast<CreatureObject*>(inv->getObjectParameter())));
		}
		break;
	case RPC_CREATESELLJUNKLOOTSELECTION__CREATUREOBJECT_:
		{
			createSellJunkLootSelection(static_cast<CreatureObject*>(inv->getObjectParameter()));
		}
		break;
	case RPC_CANINVENTORYITEMBESOLDASJUNK__TANGIBLEOBJECT_INT_:
		{
			resp->insertBoolean(canInventoryItemBeSoldAsJunk(static_cast<TangibleObject*>(inv->getObjectParameter()), inv->getSignedIntParameter()));
		}
		break;
	case RPC_SETJUNKDEALERBUYERTYPE__INT_:
		{
			setJunkDealerBuyerType(inv->getSignedIntParameter());
		}
		break;
	case RPC_GETJUNKDEALERBUYERTYPE__:
		{
			resp->insertSignedInt(getJunkDealerBuyerType());
		}
		break;
	case RPC_SETJUNKDEALERCONVERSATIONTYPE__INT_:
		{
			setJunkDealerConversationType(inv->getSignedIntParameter());
		}
		break;
	case RPC_GETJUNKDEALERCONVERSATIONTYPE__:
		{
			resp->insertSignedInt(getJunkDealerConversationType());
		}
		break;
	case RPC_ISJUNKDEALER__:
		{
			resp->insertBoolean(isJunkDealer());
		}
		break;
	default:
		throw Exception("Method does not exists");
	}
}

void JunkdealerCreatureAdapter::activateRecovery() {
	(static_cast<JunkdealerCreature*>(stub))->activateRecovery();
}

void JunkdealerCreatureAdapter::sendInitialMessage(CreatureObject* player) {
	(static_cast<JunkdealerCreature*>(stub))->sendInitialMessage(player);
}

void JunkdealerCreatureAdapter::sendInitialChoices(CreatureObject* player) {
	(static_cast<JunkdealerCreature*>(stub))->sendInitialChoices(player);
}

void JunkdealerCreatureAdapter::sendConversationStartTo(SceneObject* obj) {
	(static_cast<JunkdealerCreature*>(stub))->sendConversationStartTo(obj);
}

void JunkdealerCreatureAdapter::selectConversationOption(int option, SceneObject* obj) {
	(static_cast<JunkdealerCreature*>(stub))->selectConversationOption(option, obj);
}

String JunkdealerCreatureAdapter::getConversationString(int dealerType) {
	return (static_cast<JunkdealerCreature*>(stub))->getConversationString(dealerType);
}

String JunkdealerCreatureAdapter::getLocation() {
	return (static_cast<JunkdealerCreature*>(stub))->getLocation();
}

void JunkdealerCreatureAdapter::setLocation(const String& loc) {
	(static_cast<JunkdealerCreature*>(stub))->setLocation(loc);
}

bool JunkdealerCreatureAdapter::isAttackableBy(CreatureObject* object) {
	return (static_cast<JunkdealerCreature*>(stub))->isAttackableBy(object);
}

void JunkdealerCreatureAdapter::createSellJunkLootSelection(CreatureObject* player) {
	(static_cast<JunkdealerCreature*>(stub))->createSellJunkLootSelection(player);
}

bool JunkdealerCreatureAdapter::canInventoryItemBeSoldAsJunk(TangibleObject* lootItem, int dealerType) {
	return (static_cast<JunkdealerCreature*>(stub))->canInventoryItemBeSoldAsJunk(lootItem, dealerType);
}

void JunkdealerCreatureAdapter::setJunkDealerBuyerType(int jdBuyerType) {
	(static_cast<JunkdealerCreature*>(stub))->setJunkDealerBuyerType(jdBuyerType);
}

int JunkdealerCreatureAdapter::getJunkDealerBuyerType() {
	return (static_cast<JunkdealerCreature*>(stub))->getJunkDealerBuyerType();
}

void JunkdealerCreatureAdapter::setJunkDealerConversationType(int jdConvoType) {
	(static_cast<JunkdealerCreature*>(stub))->setJunkDealerConversationType(jdConvoType);
}

int JunkdealerCreatureAdapter::getJunkDealerConversationType() {
	return (static_cast<JunkdealerCreature*>(stub))->getJunkDealerConversationType();
}

bool JunkdealerCreatureAdapter::isJunkDealer() {
	return (static_cast<JunkdealerCreature*>(stub))->isJunkDealer();
}

/*
 *	JunkdealerCreatureHelper
 */

JunkdealerCreatureHelper* JunkdealerCreatureHelper::staticInitializer = JunkdealerCreatureHelper::instance();

JunkdealerCreatureHelper::JunkdealerCreatureHelper() {
	className = "JunkdealerCreature";

	Core::getObjectBroker()->registerClass(className, this);
}

void JunkdealerCreatureHelper::finalizeHelper() {
	JunkdealerCreatureHelper::finalize();
}

DistributedObject* JunkdealerCreatureHelper::instantiateObject() {
	return new JunkdealerCreature(DummyConstructorParameter::instance());
}

DistributedObjectServant* JunkdealerCreatureHelper::instantiateServant() {
	return new JunkdealerCreatureImplementation();
}

DistributedObjectAdapter* JunkdealerCreatureHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new JunkdealerCreatureAdapter(static_cast<JunkdealerCreature*>(obj));

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

