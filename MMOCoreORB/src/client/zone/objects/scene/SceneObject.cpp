#include "SceneObject.h"
#include "../../managers/object/ObjectManager.h"
#include "../../Zone.h"
#include "templates/SharedObjectTemplate.h"
#include "templates/snapshot/WorldSnapshotNode.h"
#include "templates/appearance/AppearanceTemplate.h"
#include "templates/appearance/PortalLayout.h"
#include "templates/manager/TemplateManager.h"
#include "client/zone/managers/appearance/AppearanceManager.h"
#include "client/zone/objects/appearance/ClientAppearance.h"
#include "client/zone/objects/appearance/ClientMeshAppearance.h"

SceneObject::SceneObject(SharedObjectTemplate* templateData) : Logger("SceneObject") {
	parent = NULL;
	if(templateData != NULL) {
		
		templateObject = templateData;
		
		if (templateData->getCollisionActionBlockFlags() == 255) { //loading meshes for line of sight
			templateData->getPortalLayout();
			templateData->getAppearanceTemplate();
		}
		
		objectName.setStringId(templateData->getObjectName());
		//customName = templateData->getCustomName();
		//detailedDescription.setStringId(templateData->getDetailedDescription());
		
		gameObjectType = templateData->getGameObjectType();
		//clientObjectCRC = templateData->getClientObjectCRC();
		containerType = templateData->getContainerType();
		containerVolumeLimit = templateData->getContainerVolumeLimit();
		
		
		AppearanceTemplate *tmpl = getTemplate()->getAppearanceTemplate();
		if(tmpl != NULL) {
			appearance = AppearanceManager::instance()->getAppearance(tmpl);
		} else {
			appearance = NULL;
		}
	}
	objectID = 0;


	containmentType = 4;
	
	if (containerType == 0)
		containerType = 4;
	
	initializePosition(0.f, 0.f, 0.f );
	
	movementCounter = 0;
	
	setGlobalLogging(true);
	setLogging(false);
	
	String fullPath;
	objectName.getFullPath(fullPath);
	
	client = NULL;
	zone = NULL;
	
	info("created " + fullPath);
}

Vector<Reference<MeshData*> > SceneObject::getTransformedMeshData() {
	if(appearance == NULL) {
		Vector<Reference<MeshData*> > emptyData;
		return emptyData;
	}

	Vector<Reference<MeshData*> > meshes = appearance->getTransformedMeshData();
	for(int i=0; i<meshes.size(); i++) {
		Matrix4 transform = getMatrix4Transform();
		meshes.get(i)->transformMeshData(transform);
	}
	
	return meshes;
}

Matrix4 SceneObject::getMatrix4Transform() {
	osg::Matrix rhs = transform->getMatrix();
	Matrix4 transform;
	transform[0][0] = rhs(0, 0);
	transform[0][1] = rhs(0, 1);
	transform[0][2] = rhs(0, 2);
	transform[0][3] = rhs(0, 3);
	
	transform[1][0] = rhs(1, 0);
	transform[1][1] = rhs(1, 1);
	transform[1][2] = rhs(1, 2);
	transform[1][3] = rhs(1, 3);
	
	transform[2][0] = rhs(2, 0);
	transform[2][1] = rhs(2, 1);
	transform[2][2] = rhs(2, 2);
	transform[2][3] = rhs(2, 3);
	
	transform[3][0] = rhs(3, 0);
	transform[3][1] = rhs(3, 1);
	transform[3][2] = rhs(3, 2);
	transform[3][3] = rhs(3, 3);
	return transform;
}

void SceneObject::addToScene() {
	if (appearance != NULL) {
		if (transform == NULL)
			transform = getTransformNode();
		
		transform->addChild(appearance->draw());
	} // else todo: draw BVH
	
	for (int i=0; i<containerObjects.size(); i++) {
		SceneObject* sceno = containerObjects.get(i);
		if (sceno != NULL) {
			transform->addChild(sceno);
		}
	}
	
	if(portalLayout && !isBuildingObject())
		info("Warning: PortalLayout attached to SceneObject " + templateObject->getTemplateFileName(), true);

	//transform->addChild(appearance->draw());
//	Vector<Reference<MeshData*> > meshes = appearance->getTransformedMeshData();
//	for(int i=0; i<meshes.size(); i++) {
//		osg::Matrix rhs = transform->getMatrix();
//		Matrix4 transform;
//		transform[0][0] = rhs(0, 0);
//		transform[0][1] = rhs(0, 1);
//		transform[0][2] = rhs(0, 2);
//		transform[0][3] = rhs(0, 3);
//		transform[1][0] = rhs(1, 0);
//		transform[1][1] = rhs(1, 1);
//		transform[1][2] = rhs(1, 2);
//		transform[1][3] = rhs(1, 3);
//		
//		transform[2][0] = rhs(2, 0);
//		transform[2][1] = rhs(2, 1);
//		transform[2][2] = rhs(2, 2);
//		transform[2][3] = rhs(2, 3);
//		
//		transform[3][0] = rhs(3, 0);
//		transform[3][1] = rhs(3, 1);
//		transform[3][2] = rhs(3, 2);
//		transform[3][3] = rhs(3, 3);
//		meshes.get(i)->transformMeshData(transform);
//		addChild(ClientMeshAppearance::createMeshGeometry(meshes.get(i)));
//	}
//
//	if(tmpl) {
//		transform->addChild(tmpl->draw());
//	} else {
//		osg::TessellationHints* hints = new osg::TessellationHints;
//		hints->setDetailRatio(0.25f);
//		osg::Geode* geode2 = new osg::Geode();
//		geode2->addDrawable( new osg::ShapeDrawable( new osg::Sphere(osg::Vec3(position.getX(), position.getZ()+0.5, position.getY()), 2.0), hints ) );
//		
//		//geode2->getOrCreateStateSet()->setAttribute( new osg::PolygonMode(osg::PolygonMode::FRONT_AND_BACK,osg::PolygonMode::LINE) );
//		transform->addChild(geode2);
//	}
	
}

void SceneObject::loadSnapshotNode(WorldSnapshotNode* node) {
	Vector3 position = node->getPosition();
	setPosition(position.getX(), position.getY(), position.getZ());
	direction = node->getDirection();
	
	if(!node->getParentID()) { // don't draw cell contents
		if(node->getUnknown2() != 0) {
			try {
				String name = TemplateManager::instance()->getTemplateFile(node->getUnknown2());
				portalLayout = TemplateManager::instance()->getPortalLayout(name);
				initializePortalLayout(portalLayout);
			} catch(...) {
				
			}
		}
	}
	
	transform = getTransformNode();
	addChild(transform);
	addToScene();
}

osg::ref_ptr<osg::MatrixTransform> SceneObject::getTransformNode() {
	osg::ref_ptr<osg::MatrixTransform> t  = new osg::MatrixTransform( );
	osg::Quat nodeQuat(direction.getX(), direction.getY(), direction.getZ(), direction.getW() );
	osg::Matrix mat = osg::Matrix(nodeQuat) * osg::Matrix::translate( osg::Vec3f(getPositionX(), getPositionY(), getPositionZ()) ) * osg::Matrix::rotate(osg::DegreesToRadians(90.f), 1, 0, 0) * osg::Matrix::rotate(osg::DegreesToRadians(180.f), 0, 0, 1) * osg::Matrix::scale(-1, 1, 1);
	t->setMatrix(mat);
	
	return t;
}

SceneObject::~SceneObject() {
	/*if (parent != NULL) {
		error("DELETING OBJECT WITH PARENT NOT NULL");
	}*/
	info("destroying object");

	if (slottedObjects.size() > 0)
		info("warning slottedObjects not 0 when destroying");

	if (containerObjects.size() > 0)
		info("warning slottedObjects not 0 when destroying");

	/*while (slottedObjects.size() > 0) {
		SceneObject* object = slottedObjects.get(0);

		removeObject(object);

		object->setParent(NULL);

		zone->getObjectManager()->destroyObject(object->getObjectID());
	}


	while (containerObjects.size() > 0) {
		SceneObject* object = containerObjects.get(0);
		object->setParent(NULL);

		containerObjects.drop(object->getObjectID());

		zone->getObjectManager()->destroyObject(object->getObjectID());
	}*/
}

bool SceneObject::transferObject(SceneObject* object, int containmentType, bool ignoreCapacity) {
	info("adding object " + object->getLoggingName());

	if (containmentType >= 4) {
		int arrangementSize = object->getArrangementDescriptorSize();

		for (int i = 0; i < arrangementSize; ++i) {
			String childArrangement = object->getArrangementDescriptor(i);

			if (slottedObjects.contains(childArrangement))
				return false;
		}

		for (int i = 0; i < arrangementSize; ++i) {
			slottedObjects.put(object->getArrangementDescriptor(i), object);
		}
	} else if (containmentType == -1) {
		if (containerObjects.size() >= containerVolumeLimit && ignoreCapacity == false)
			return false;

		if (containerObjects.contains(object->getObjectID()))
			return false;

		containerObjects.put(object->getObjectID(), object);
	} else {
		error("unkown container type");
		return false;
	}

	object->setParent(this);
	object->setContainmentType(containmentType);

	return true;
}

bool SceneObject::removeObject(SceneObject* object) {
	if (containerType == 1) {
		int arrangementSize = object->getArrangementDescriptorSize();

		for (int i = 0; i < arrangementSize; ++i) {
			String childArrangement = object->getArrangementDescriptor(i);

			if (slottedObjects.get(childArrangement) != object)
				return false;
		}

		for (int i = 0; i < arrangementSize; ++i)
			slottedObjects.drop(object->getArrangementDescriptor(i));
	} else if (containerType == 2 || containerType == 3) {
		if (!containerObjects.contains(object->getObjectID()))
			return false;

		containerObjects.drop(object->getObjectID());
	} else {
		error("unkown container type");
		return false;
	}

	object->setParent(NULL);

	return true;
}

