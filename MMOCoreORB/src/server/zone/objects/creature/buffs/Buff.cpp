/*
 *	server/zone/objects/creature/buffs/Buff.cpp generated by engine3 IDL compiler 0.60
 */

#include "Buff.h"

#include "server/zone/objects/player/PlayerCreature.h"

#include "server/zone/objects/creature/CreatureObject.h"

#include "server/zone/objects/creature/buffs/BuffDurationEvent.h"

/*
 *	BuffStub
 */

Buff::Buff(CreatureObject* creo, unsigned int buffcrc, float duration, int bufftype) : ManagedObject(DummyConstructorParameter::instance()) {
	BuffImplementation* _implementation = new BuffImplementation(creo, buffcrc, duration, bufftype);
	_impl = _implementation;
	_impl->_setStub(this);
}

Buff::Buff(DummyConstructorParameter* param) : ManagedObject(param) {
}

Buff::~Buff() {
}


void Buff::initializeTransientMembers() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 6);

		method.executeWithVoidReturn();
	} else
		_implementation->initializeTransientMembers();
}

void Buff::init() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 7);

		method.executeWithVoidReturn();
	} else
		_implementation->init();
}

void Buff::sendTo(PlayerCreature* player) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 8);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		_implementation->sendTo(player);
}

void Buff::sendDestroyTo(PlayerCreature* player) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 9);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		_implementation->sendDestroyTo(player);
}

void Buff::activate(bool applyModifiers) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 10);
		method.addBooleanParameter(applyModifiers);

		method.executeWithVoidReturn();
	} else
		_implementation->activate(applyModifiers);
}

void Buff::deactivate(bool removeModifiers) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 11);
		method.addBooleanParameter(removeModifiers);

		method.executeWithVoidReturn();
	} else
		_implementation->deactivate(removeModifiers);
}

void Buff::activate() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 12);

		method.executeWithVoidReturn();
	} else
		_implementation->activate();
}

void Buff::deactivate() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 13);

		method.executeWithVoidReturn();
	} else
		_implementation->deactivate();
}

void Buff::applyAttributeModifiers() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 14);

		method.executeWithVoidReturn();
	} else
		_implementation->applyAttributeModifiers();
}

void Buff::applySkillModifiers() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 15);

		method.executeWithVoidReturn();
	} else
		_implementation->applySkillModifiers();
}

void Buff::removeAttributeModifiers() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 16);

		method.executeWithVoidReturn();
	} else
		_implementation->removeAttributeModifiers();
}

void Buff::removeSkillModifiers() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 17);

		method.executeWithVoidReturn();
	} else
		_implementation->removeSkillModifiers();
}

void Buff::clearBuffEvent() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 18);

		method.executeWithVoidReturn();
	} else
		_implementation->clearBuffEvent();
}

void Buff::setBuffEventNull() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 19);

		method.executeWithVoidReturn();
	} else
		_implementation->setBuffEventNull();
}

void Buff::scheduleBuffEvent() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 20);

		method.executeWithVoidReturn();
	} else
		_implementation->scheduleBuffEvent();
}

void Buff::parseAttributeModifierString(const String& modifierstring) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 21);
		method.addAsciiParameter(modifierstring);

		method.executeWithVoidReturn();
	} else
		_implementation->parseAttributeModifierString(modifierstring);
}

void Buff::parseSkillModifierString(const String& modifierstring) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 22);
		method.addAsciiParameter(modifierstring);

		method.executeWithVoidReturn();
	} else
		_implementation->parseSkillModifierString(modifierstring);
}

String Buff::getAttributeModifierString() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 23);

		method.executeWithAsciiReturn(_return_getAttributeModifierString);
		return _return_getAttributeModifierString;
	} else
		return _implementation->getAttributeModifierString();
}

String Buff::getSkillModifierString() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 24);

		method.executeWithAsciiReturn(_return_getSkillModifierString);
		return _return_getSkillModifierString;
	} else
		return _implementation->getSkillModifierString();
}

float Buff::getTimeLeft() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 25);

		return method.executeWithFloatReturn();
	} else
		return _implementation->getTimeLeft();
}

void Buff::setAttributeModifier(byte attribute, int value) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 26);
		method.addByteParameter(attribute);
		method.addSignedIntParameter(value);

		method.executeWithVoidReturn();
	} else
		_implementation->setAttributeModifier(attribute, value);
}

void Buff::setSkillModifier(const String& modname, int value) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 27);
		method.addAsciiParameter(modname);
		method.addSignedIntParameter(value);

		method.executeWithVoidReturn();
	} else
		_implementation->setSkillModifier(modname, value);
}

void Buff::setSpeedMultiplierMod(float multiplier) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 28);
		method.addFloatParameter(multiplier);

		method.executeWithVoidReturn();
	} else
		_implementation->setSpeedMultiplierMod(multiplier);
}

void Buff::setAccelerationMultiplierMod(float multiplier) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 29);
		method.addFloatParameter(multiplier);

		method.executeWithVoidReturn();
	} else
		_implementation->setAccelerationMultiplierMod(multiplier);
}

void Buff::setFillAttirbutesOnBuff(bool val) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 30);
		method.addBooleanParameter(val);

		method.executeWithVoidReturn();
	} else
		_implementation->setFillAttirbutesOnBuff(val);
}

void Buff::setStackable(bool val) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 31);
		method.addBooleanParameter(val);

		method.executeWithVoidReturn();
	} else
		_implementation->setStackable(val);
}

String Buff::getBuffName() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 32);

		method.executeWithAsciiReturn(_return_getBuffName);
		return _return_getBuffName;
	} else
		return _implementation->getBuffName();
}

int Buff::getBuffCRC() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 33);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getBuffCRC();
}

float Buff::getBuffDuration() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 34);

		return method.executeWithFloatReturn();
	} else
		return _implementation->getBuffDuration();
}

int Buff::getBuffType() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 35);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getBuffType();
}

int Buff::getAttributeModifierValue(byte attribute) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 36);
		method.addByteParameter(attribute);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getAttributeModifierValue(attribute);
}

int Buff::getSkillModifierValue(const String& modname) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 37);
		method.addAsciiParameter(modname);

		return method.executeWithSignedIntReturn();
	} else
		return _implementation->getSkillModifierValue(modname);
}

bool Buff::isActive() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 38);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isActive();
}

bool Buff::isSpiceBuff() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 39);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isSpiceBuff();
}

bool Buff::isAttributeBuff() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 40);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isAttributeBuff();
}

bool Buff::isStackable() {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 41);

		return method.executeWithBooleanReturn();
	} else
		return _implementation->isStackable();
}

void Buff::setStartMessage(StringIdChatParameter& start) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		throw ObjectNotLocalException(this);

	} else
		_implementation->setStartMessage(start);
}

void Buff::setEndMessage(StringIdChatParameter& start) {
	BuffImplementation* _implementation = (BuffImplementation*) _getImplementation();
	if (_implementation == NULL) {
		throw ObjectNotLocalException(this);

	} else
		_implementation->setEndMessage(start);
}

DistributedObjectServant* Buff::_getImplementation() {

	_updated = true;
	return _impl;
}

void Buff::_setImplementation(DistributedObjectServant* servant) {
	_impl = servant;}

/*
 *	BuffImplementation
 */

BuffImplementation::BuffImplementation(DummyConstructorParameter* param) : ManagedObjectImplementation(param) {
	_initializeImplementation();
}


BuffImplementation::~BuffImplementation() {
}


void BuffImplementation::finalize() {
}

void BuffImplementation::_initializeImplementation() {
	_setClassHelper(BuffHelper::instance());

	_serializationHelperMethod();
}

void BuffImplementation::_setStub(DistributedObjectStub* stub) {
	_this = (Buff*) stub;
	ManagedObjectImplementation::_setStub(stub);
}

DistributedObjectStub* BuffImplementation::_getStub() {
	return _this;
}

BuffImplementation::operator const Buff*() {
	return _this;
}

void BuffImplementation::lock(bool doLock) {
	_this->lock(doLock);
}

void BuffImplementation::lock(ManagedObject* obj) {
	_this->lock(obj);
}

void BuffImplementation::rlock(bool doLock) {
	_this->rlock(doLock);
}

void BuffImplementation::wlock(bool doLock) {
	_this->wlock(doLock);
}

void BuffImplementation::wlock(ManagedObject* obj) {
	_this->wlock(obj);
}

void BuffImplementation::unlock(bool doLock) {
	_this->unlock(doLock);
}

void BuffImplementation::runlock(bool doLock) {
	_this->runlock(doLock);
}

void BuffImplementation::_serializationHelperMethod() {
	ManagedObjectImplementation::_serializationHelperMethod();

	_setClassName("Buff");

	addSerializableVariable("creature", &creature);
	addSerializableVariable("attributeModifiers", &attributeModifiers);
	addSerializableVariable("skillModifiers", &skillModifiers);
	addSerializableVariable("buffName", &buffName);
	addSerializableVariable("buffDuration", &buffDuration);
	addSerializableVariable("buffCRC", &buffCRC);
	addSerializableVariable("buffType", &buffType);
	addSerializableVariable("stackable", &stackable);
	addSerializableVariable("speedMultiplierMod", &speedMultiplierMod);
	addSerializableVariable("accelerationMultiplierMod", &accelerationMultiplierMod);
	addSerializableVariable("fillAttirbutesOnBuff", &fillAttirbutesOnBuff);
	addSerializableVariable("startMessage", &startMessage);
	addSerializableVariable("endMessage", &endMessage);
	addSerializableVariable("nextExecutionTime", &nextExecutionTime);
}

BuffImplementation::BuffImplementation(CreatureObject* creo, unsigned int buffcrc, float duration, int bufftype) {
	_initializeImplementation();
	// server/zone/objects/creature/buffs/Buff.idl(90):  		creature = creo;
	creature = creo;
	// server/zone/objects/creature/buffs/Buff.idl(91):  		buffCRC = buffcrc;
	buffCRC = buffcrc;
	// server/zone/objects/creature/buffs/Buff.idl(92):  		buffDuration = duration;
	buffDuration = duration;
	// server/zone/objects/creature/buffs/Buff.idl(93):  		buffType = bufftype;
	buffType = bufftype;
	// server/zone/objects/creature/buffs/Buff.idl(94):  		stackable = false;
	stackable = false;
	// server/zone/objects/creature/buffs/Buff.idl(95):  		speedMultiplierMod = -1.f;
	speedMultiplierMod = -1.f;
	// server/zone/objects/creature/buffs/Buff.idl(96):  		accelerationMultiplierMod = -1.f;
	accelerationMultiplierMod = -1.f;
	// server/zone/objects/creature/buffs/Buff.idl(97):  		fillAttirbutesOnBuff = false;
	fillAttirbutesOnBuff = false;
	// server/zone/objects/creature/buffs/Buff.idl(99):  		Logger.setLoggingName("Buff");
	Logger::setLoggingName("Buff");
	// server/zone/objects/creature/buffs/Buff.idl(101):  		init();
	init();
}

void BuffImplementation::init() {
	// server/zone/objects/creature/buffs/Buff.idl(107):  		attributeModifiers.setNoDuplicateInsertPlan();
	(&attributeModifiers)->setNoDuplicateInsertPlan();
	// server/zone/objects/creature/buffs/Buff.idl(108):  		attributeModifiers.setNullValue(0);
	(&attributeModifiers)->setNullValue(0);
	// server/zone/objects/creature/buffs/Buff.idl(109):  		skillModifiers.setNoDuplicateInsertPlan();
	(&skillModifiers)->setNoDuplicateInsertPlan();
	// server/zone/objects/creature/buffs/Buff.idl(110):  		skillModifiers.setNullValue(0);
	(&skillModifiers)->setNullValue(0);
}

void BuffImplementation::activate() {
	// server/zone/objects/creature/buffs/Buff.idl(120):  		activate(true);
	activate(true);
}

void BuffImplementation::deactivate() {
	// server/zone/objects/creature/buffs/Buff.idl(124):  		deactivate(true);
	deactivate(true);
}

void BuffImplementation::setAttributeModifier(byte attribute, int value) {
	// server/zone/objects/creature/buffs/Buff.idl(148):  
	if ((&attributeModifiers)->contains(attribute))	// server/zone/objects/creature/buffs/Buff.idl(149):  			attributeModifiers.get(attribute) = value;
	(&attributeModifiers)->get(attribute) = value;

	else 	// server/zone/objects/creature/buffs/Buff.idl(151):  			attributeModifiers.put(attribute, value);
	(&attributeModifiers)->put(attribute, value);
}

void BuffImplementation::setSkillModifier(const String& modname, int value) {
	// server/zone/objects/creature/buffs/Buff.idl(155):  
	if ((&skillModifiers)->contains(modname))	// server/zone/objects/creature/buffs/Buff.idl(156):  			skillModifiers.get(modname) = value;
	(&skillModifiers)->get(modname) = value;

	else 	// server/zone/objects/creature/buffs/Buff.idl(158):  			skillModifiers.put(modname, value);
	(&skillModifiers)->put(modname, value);
}

void BuffImplementation::setSpeedMultiplierMod(float multiplier) {
	// server/zone/objects/creature/buffs/Buff.idl(162):  		speedMultiplierMod = multiplier;
	speedMultiplierMod = multiplier;
}

void BuffImplementation::setAccelerationMultiplierMod(float multiplier) {
	// server/zone/objects/creature/buffs/Buff.idl(166):  		accelerationMultiplierMod = multiplier;
	accelerationMultiplierMod = multiplier;
}

void BuffImplementation::setFillAttirbutesOnBuff(bool val) {
	// server/zone/objects/creature/buffs/Buff.idl(170):  		fillAttirbutesOnBuff = val;
	fillAttirbutesOnBuff = val;
}

void BuffImplementation::setStackable(bool val) {
	// server/zone/objects/creature/buffs/Buff.idl(174):  		stackable = val;
	stackable = val;
}

String BuffImplementation::getBuffName() {
	// server/zone/objects/creature/buffs/Buff.idl(179):  		return buffName;
	return buffName;
}

int BuffImplementation::getBuffCRC() {
	// server/zone/objects/creature/buffs/Buff.idl(183):  		return buffCRC;
	return buffCRC;
}

float BuffImplementation::getBuffDuration() {
	// server/zone/objects/creature/buffs/Buff.idl(187):  		return buffDuration;
	return buffDuration;
}

int BuffImplementation::getBuffType() {
	// server/zone/objects/creature/buffs/Buff.idl(191):  		return buffType;
	return buffType;
}

int BuffImplementation::getAttributeModifierValue(byte attribute) {
	// server/zone/objects/creature/buffs/Buff.idl(195):  		return 
	if ((&attributeModifiers)->contains(attribute))	// server/zone/objects/creature/buffs/Buff.idl(196):  			return attributeModifiers.get(attribute);
	return (&attributeModifiers)->get(attribute);
	// server/zone/objects/creature/buffs/Buff.idl(198):  0;
	return 0;
}

int BuffImplementation::getSkillModifierValue(const String& modname) {
	// server/zone/objects/creature/buffs/Buff.idl(202):  		return 
	if ((&skillModifiers)->contains(modname))	// server/zone/objects/creature/buffs/Buff.idl(203):  			return skillModifiers.get(modname);
	return (&skillModifiers)->get(modname);
	// server/zone/objects/creature/buffs/Buff.idl(205):  0;
	return 0;
}

bool BuffImplementation::isSpiceBuff() {
	// server/zone/objects/creature/buffs/Buff.idl(211):  		return (buffType == BuffType.SPICE);
	return (buffType == BuffType::SPICE);
}

bool BuffImplementation::isAttributeBuff() {
	// server/zone/objects/creature/buffs/Buff.idl(215):  		return (attributeModifiers.size() != 0);
	return ((&attributeModifiers)->size() != 0);
}

bool BuffImplementation::isStackable() {
	// server/zone/objects/creature/buffs/Buff.idl(219):  		return stackable;
	return stackable;
}

/*
 *	BuffAdapter
 */

BuffAdapter::BuffAdapter(BuffImplementation* obj) : ManagedObjectAdapter(obj) {
}

Packet* BuffAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	case 6:
		initializeTransientMembers();
		break;
	case 7:
		init();
		break;
	case 8:
		sendTo((PlayerCreature*) inv->getObjectParameter());
		break;
	case 9:
		sendDestroyTo((PlayerCreature*) inv->getObjectParameter());
		break;
	case 10:
		activate(inv->getBooleanParameter());
		break;
	case 11:
		deactivate(inv->getBooleanParameter());
		break;
	case 12:
		activate();
		break;
	case 13:
		deactivate();
		break;
	case 14:
		applyAttributeModifiers();
		break;
	case 15:
		applySkillModifiers();
		break;
	case 16:
		removeAttributeModifiers();
		break;
	case 17:
		removeSkillModifiers();
		break;
	case 18:
		clearBuffEvent();
		break;
	case 19:
		setBuffEventNull();
		break;
	case 20:
		scheduleBuffEvent();
		break;
	case 21:
		parseAttributeModifierString(inv->getAsciiParameter(_param0_parseAttributeModifierString__String_));
		break;
	case 22:
		parseSkillModifierString(inv->getAsciiParameter(_param0_parseSkillModifierString__String_));
		break;
	case 23:
		resp->insertAscii(getAttributeModifierString());
		break;
	case 24:
		resp->insertAscii(getSkillModifierString());
		break;
	case 25:
		resp->insertFloat(getTimeLeft());
		break;
	case 26:
		setAttributeModifier(inv->getByteParameter(), inv->getSignedIntParameter());
		break;
	case 27:
		setSkillModifier(inv->getAsciiParameter(_param0_setSkillModifier__String_int_), inv->getSignedIntParameter());
		break;
	case 28:
		setSpeedMultiplierMod(inv->getFloatParameter());
		break;
	case 29:
		setAccelerationMultiplierMod(inv->getFloatParameter());
		break;
	case 30:
		setFillAttirbutesOnBuff(inv->getBooleanParameter());
		break;
	case 31:
		setStackable(inv->getBooleanParameter());
		break;
	case 32:
		resp->insertAscii(getBuffName());
		break;
	case 33:
		resp->insertSignedInt(getBuffCRC());
		break;
	case 34:
		resp->insertFloat(getBuffDuration());
		break;
	case 35:
		resp->insertSignedInt(getBuffType());
		break;
	case 36:
		resp->insertSignedInt(getAttributeModifierValue(inv->getByteParameter()));
		break;
	case 37:
		resp->insertSignedInt(getSkillModifierValue(inv->getAsciiParameter(_param0_getSkillModifierValue__String_)));
		break;
	case 38:
		resp->insertBoolean(isActive());
		break;
	case 39:
		resp->insertBoolean(isSpiceBuff());
		break;
	case 40:
		resp->insertBoolean(isAttributeBuff());
		break;
	case 41:
		resp->insertBoolean(isStackable());
		break;
	default:
		return NULL;
	}

	return resp;
}

void BuffAdapter::initializeTransientMembers() {
	((BuffImplementation*) impl)->initializeTransientMembers();
}

void BuffAdapter::init() {
	((BuffImplementation*) impl)->init();
}

void BuffAdapter::sendTo(PlayerCreature* player) {
	((BuffImplementation*) impl)->sendTo(player);
}

void BuffAdapter::sendDestroyTo(PlayerCreature* player) {
	((BuffImplementation*) impl)->sendDestroyTo(player);
}

void BuffAdapter::activate(bool applyModifiers) {
	((BuffImplementation*) impl)->activate(applyModifiers);
}

void BuffAdapter::deactivate(bool removeModifiers) {
	((BuffImplementation*) impl)->deactivate(removeModifiers);
}

void BuffAdapter::activate() {
	((BuffImplementation*) impl)->activate();
}

void BuffAdapter::deactivate() {
	((BuffImplementation*) impl)->deactivate();
}

void BuffAdapter::applyAttributeModifiers() {
	((BuffImplementation*) impl)->applyAttributeModifiers();
}

void BuffAdapter::applySkillModifiers() {
	((BuffImplementation*) impl)->applySkillModifiers();
}

void BuffAdapter::removeAttributeModifiers() {
	((BuffImplementation*) impl)->removeAttributeModifiers();
}

void BuffAdapter::removeSkillModifiers() {
	((BuffImplementation*) impl)->removeSkillModifiers();
}

void BuffAdapter::clearBuffEvent() {
	((BuffImplementation*) impl)->clearBuffEvent();
}

void BuffAdapter::setBuffEventNull() {
	((BuffImplementation*) impl)->setBuffEventNull();
}

void BuffAdapter::scheduleBuffEvent() {
	((BuffImplementation*) impl)->scheduleBuffEvent();
}

void BuffAdapter::parseAttributeModifierString(const String& modifierstring) {
	((BuffImplementation*) impl)->parseAttributeModifierString(modifierstring);
}

void BuffAdapter::parseSkillModifierString(const String& modifierstring) {
	((BuffImplementation*) impl)->parseSkillModifierString(modifierstring);
}

String BuffAdapter::getAttributeModifierString() {
	return ((BuffImplementation*) impl)->getAttributeModifierString();
}

String BuffAdapter::getSkillModifierString() {
	return ((BuffImplementation*) impl)->getSkillModifierString();
}

float BuffAdapter::getTimeLeft() {
	return ((BuffImplementation*) impl)->getTimeLeft();
}

void BuffAdapter::setAttributeModifier(byte attribute, int value) {
	((BuffImplementation*) impl)->setAttributeModifier(attribute, value);
}

void BuffAdapter::setSkillModifier(const String& modname, int value) {
	((BuffImplementation*) impl)->setSkillModifier(modname, value);
}

void BuffAdapter::setSpeedMultiplierMod(float multiplier) {
	((BuffImplementation*) impl)->setSpeedMultiplierMod(multiplier);
}

void BuffAdapter::setAccelerationMultiplierMod(float multiplier) {
	((BuffImplementation*) impl)->setAccelerationMultiplierMod(multiplier);
}

void BuffAdapter::setFillAttirbutesOnBuff(bool val) {
	((BuffImplementation*) impl)->setFillAttirbutesOnBuff(val);
}

void BuffAdapter::setStackable(bool val) {
	((BuffImplementation*) impl)->setStackable(val);
}

String BuffAdapter::getBuffName() {
	return ((BuffImplementation*) impl)->getBuffName();
}

int BuffAdapter::getBuffCRC() {
	return ((BuffImplementation*) impl)->getBuffCRC();
}

float BuffAdapter::getBuffDuration() {
	return ((BuffImplementation*) impl)->getBuffDuration();
}

int BuffAdapter::getBuffType() {
	return ((BuffImplementation*) impl)->getBuffType();
}

int BuffAdapter::getAttributeModifierValue(byte attribute) {
	return ((BuffImplementation*) impl)->getAttributeModifierValue(attribute);
}

int BuffAdapter::getSkillModifierValue(const String& modname) {
	return ((BuffImplementation*) impl)->getSkillModifierValue(modname);
}

bool BuffAdapter::isActive() {
	return ((BuffImplementation*) impl)->isActive();
}

bool BuffAdapter::isSpiceBuff() {
	return ((BuffImplementation*) impl)->isSpiceBuff();
}

bool BuffAdapter::isAttributeBuff() {
	return ((BuffImplementation*) impl)->isAttributeBuff();
}

bool BuffAdapter::isStackable() {
	return ((BuffImplementation*) impl)->isStackable();
}

/*
 *	BuffHelper
 */

BuffHelper* BuffHelper::staticInitializer = BuffHelper::instance();

BuffHelper::BuffHelper() {
	className = "Buff";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void BuffHelper::finalizeHelper() {
	BuffHelper::finalize();
}

DistributedObject* BuffHelper::instantiateObject() {
	return new Buff(DummyConstructorParameter::instance());
}

DistributedObjectServant* BuffHelper::instantiateServant() {
	return new BuffImplementation(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* BuffHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new BuffAdapter((BuffImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

