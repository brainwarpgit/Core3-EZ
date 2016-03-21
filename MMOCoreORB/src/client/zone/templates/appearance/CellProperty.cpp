#include "CellProperty.h"
#include "zone/managers/templates/DataArchiveStore.h"
#include "MeshAppearanceTemplate.h"
#include "PathNode.h"
#include "FloorMesh.h"
#include "engine/util/u3d/AStarAlgorithm.h"

CellProperty::CellProperty() : Object(), Logger("CellProperty"), canSeeParentCell(false), numberOfPortals(0),
	floorMesh(NULL), appearanceTemplate(NULL), cellID(0) {

}

CellProperty::CellProperty(int cellID) : Logger("CellProperty"), canSeeParentCell(false), numberOfPortals(0),
	floorMesh(NULL), appearanceTemplate(NULL), cellID(cellID) {
}

CellProperty::CellProperty(const CellProperty& c) : Object(), Logger("CellProperty"),
		name(c.name), canSeeParentCell(c.canSeeParentCell), numberOfPortals(c.numberOfPortals),
			floorMesh(c.floorMesh), appearanceTemplate(c.appearanceTemplate), cellID(c.cellID) {

}

CellProperty& CellProperty::operator=(const CellProperty& c) {
	if (this == &c)
		return *this;

	name = c.name;
	numberOfPortals = c.numberOfPortals;
	canSeeParentCell = c.canSeeParentCell;
	floorMesh = c.floorMesh;
	appearanceTemplate = c.appearanceTemplate;
	cellID = c.cellID;

	return *this;
}

void CellProperty::readObject(IffStream* iffStream) {
	iffStream->openForm('CELL');

	try {
		uint32 nextForm = iffStream->getNextFormType();

		if (nextForm != '0005') {
			String message = String("wrong cell form ") + iffStream->getFileName();
			error(message);

			throw Exception(message);
		}

		iffStream->openForm('0005');

		Chunk* dataChunk = iffStream->openChunk('DATA');

		numberOfPortals = iffStream->getInt();

		canSeeParentCell = iffStream->getByte();

		iffStream->getString(name);

		String meshFile;
		iffStream->getString(meshFile);

		if (meshFile.length() > 1) {
			AppearanceTemplate* app = new AppearanceTemplate();//TemplateManager::instance()->getAppearanceTemplate(meshFile);
			IffStream *stream = DataArchiveStore::instance()->openIffFile(meshFile);
			//app->readObject(stream);
			if (app != NULL) {
				appearanceTemplate = dynamic_cast<MeshAppearanceTemplate*>(app->getFirstMesh());
			}
		}

		int readCase2 = iffStream->getByte();

		if (dataChunk->hasData()) {
			String floorFile;
			iffStream->getString(floorFile);

			if (floorFile.length() > 1) {
				floorMesh = new FloorMesh();//TemplateManager::instance()->getFloorMesh(floorFile);
				IffStream *stream = DataArchiveStore::instance()->openIffFile(floorFile);
				floorMesh->readObject(stream);
				floorMesh->setCellID(cellID);
			}
		}

		iffStream->closeChunk();

		iffStream->closeForm('0005');
	} catch (Exception& e) {
		error(e.getMessage());
		error("parsing CELL for " + iffStream->getFileName());
		e.printStackTrace();
	} catch (...) {
		error("parsing CELL for " + iffStream->getFileName());
	}

	iffStream->closeForm('CELL');
}
