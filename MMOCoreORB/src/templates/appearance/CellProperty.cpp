#include "CellProperty.h"

#include "templates/manager/TemplateManager.h"
#include "templates/appearance/AppearanceTemplate.h"
#include "templates/appearance/MeshAppearanceTemplate.h"
#include "templates/appearance/DetailAppearanceTemplate.h"

#include "templates/appearance/PathNode.h"
#include "templates/appearance/FloorMesh.h"
#include "engine/util/u3d/AStarAlgorithm.h"


void CellPortal::load_0004(IffStream *iff) {

}
void CellPortal::readObject(IffStream *iff) {
	Chunk *chunk = iff->openChunk();
	
	uint32 formType = chunk->getChunkID();
	
	if (formType == '0004') {
		solid = (bool)iff->getByte();
		geometryIndex = iff->getInt();
		winding = (bool)iff->getByte();
		int unk = iff->getInt();
		iff->getString(doorName);
		transformFlag = (bool)iff->getByte();
		
		doorTransform[0][0] = iff->getFloat();
		doorTransform[1][0] = iff->getFloat();
		doorTransform[2][0] = iff->getFloat();
		doorTransform[3][0] = iff->getFloat();
		
		doorTransform[0][1] = iff->getFloat();
		doorTransform[1][1] = iff->getFloat();
		doorTransform[2][1] = iff->getFloat();
		doorTransform[3][1] = iff->getFloat();
		
		doorTransform[0][2] = iff->getFloat();
		doorTransform[1][2] = iff->getFloat();
		doorTransform[2][2] = iff->getFloat();
		doorTransform[3][2] = iff->getFloat();
	} else {
		TemplateManager::instance()->error("Invalid CellPortal type");
	}
	
	iff->closeChunk();
}
CellProperty::CellProperty() : Object(), Logger("CellProperty"), numberOfPortals(0),
	floorMesh(NULL), appearanceTemplate(NULL), cellID(0) {

}

CellProperty::CellProperty(int cellID) : Logger("CellProperty"), numberOfPortals(0),
	floorMesh(NULL), appearanceTemplate(NULL), cellID(cellID), boundingVolume(NULL) {
}

CellProperty::CellProperty(const CellProperty& c) : Object(), Logger("CellProperty"),
		name(c.name), numberOfPortals(c.numberOfPortals),
			floorMesh(c.floorMesh), appearanceTemplate(c.appearanceTemplate), cellID(c.cellID), boundingVolume(c.boundingVolume), portals(c.portals) {

}

CellProperty& CellProperty::operator=(const CellProperty& c) {
	if (this == &c)
		return *this;

	name = c.name;
	numberOfPortals = c.numberOfPortals;
	floorMesh = c.floorMesh;
	appearanceTemplate = c.appearanceTemplate;
	cellID = c.cellID;
	boundingVolume = c.boundingVolume;
	portals = c.portals;
	
	return *this;
}

void CellProperty::load_0005(IffStream* iffStream) {
	iffStream->openForm('0005');
	
	Chunk* dataChunk = iffStream->openChunk('DATA');
	
	numberOfPortals = iffStream->getInt();
	
	Byte unk = iffStream->getByte();
	
	iffStream->getString(name);
	
	String meshFile;
	iffStream->getString(meshFile);
	
	if (meshFile.length() > 1) {
		AppearanceTemplate* app = TemplateManager::instance()->getAppearanceTemplate(meshFile);
		if (app != NULL) {
			appearanceTemplate = app;
		} else {
			info("Error reading mesh " + meshFile, true);
		}
		DetailAppearanceTemplate *mesh = dynamic_cast<DetailAppearanceTemplate*>(app);
		MeshAppearanceTemplate *meshAppearance = dynamic_cast<MeshAppearanceTemplate*>(app);
		if(mesh != NULL)
		{
			meshAppearance = (MeshAppearanceTemplate*)mesh->getFirstMesh();
			if(meshAppearance == NULL)
				error("ClientProperty loaded appearance other than MeshAppearanceTemplate " + meshFile);
		} else if(meshAppearance == NULL){
			error("CellProperty not a detailappearancetemplate " + meshFile);
		}
	}
	
	bool flag = (bool)iffStream->getByte();
	
	if (flag) {
		String floorFile;
		iffStream->getString(floorFile);
		floorMesh = TemplateManager::instance()->getFloorMesh(floorFile);
		
	}
	
	iffStream->closeChunk();
	
	// get bounding volume, usually CMSH
	boundingVolume = BoundingVolumeFactory::getVolume(iffStream);
	
//	if(dynamic_cast<CollisionMeshVolume*>(boundingVolume) == NULL) {
//		error("Cell does not have a collision mesh");
//	}
	
	for (int i=0; i<numberOfPortals; i++) {
		iffStream->openForm('PRTL');
		
		Reference<CellPortal*> portal = new CellPortal();
		portal->readObject(iffStream);
		
		iffStream->closeForm('PRTL');
		
		portals.add(portal);
		
	}
	
	iffStream->closeForm('0005');
}
void CellProperty::load_0004(IffStream* iffStream) {
	iffStream->openForm('0004');
	
	Chunk* dataChunk = iffStream->openChunk('DATA');
	
	numberOfPortals = iffStream->getInt();
	
	Byte unk = iffStream->getByte();
	
	iffStream->getString(name);
	
	String meshFile;
	iffStream->getString(meshFile);
	
	if (meshFile.length() > 1) {
		AppearanceTemplate* app = TemplateManager::instance()->getAppearanceTemplate(meshFile);
		if (app != NULL) {
			appearanceTemplate = app;
		} else {
			info("Error reading mesh " + meshFile, true);
		}
	}
	
	bool flag = (bool)iffStream->getByte();
	
	if (flag) {
		String floorFile;
		iffStream->getString(floorFile);
		floorMesh = TemplateManager::instance()->getFloorMesh(floorFile);

	}
	
	iffStream->closeChunk();
	
	for (int i=0; i<numberOfPortals; i++) {
		iffStream->openForm('PRTL');
		
		Reference<CellPortal*> portal = new CellPortal();
		portal->readObject(iffStream);
		
		iffStream->closeForm('PRTL');
		
		portals.add(portal);
		
	}
	
	iffStream->closeForm('0004');
}

void CellProperty::readObject(IffStream* iffStream) {
	iffStream->openForm('CELL');
	
	try {
		uint32 nextForm = iffStream->getNextFormType();
		
		if(nextForm == '0004') {
			load_0004(iffStream);
		} else if(nextForm == '0005') {
			load_0005(iffStream);
		} else {
			String message = String("wrong cell form ") + iffStream->getFileName();
			error(message);
			
			throw Exception(message);
		}
		
		
	} catch (Exception& e) {
		error(e.getMessage());
		error("parsing CELL for " + iffStream->getFileName());
		e.printStackTrace();
	} catch (...) {
		error("parsing CELL for " + iffStream->getFileName());
	}
	
	iffStream->closeForm('CELL');
}
