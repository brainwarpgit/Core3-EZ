/*
 * PortalLayout.cpp
 *
 *  Created on: 03/12/2010
 *      Author: victor
 */

#include "PortalLayout.h"
#include "MeshAppearanceTemplate.h"
#include "PathNode.h"
#include "FloorMesh.h"
#include "engine/util/u3d/AStarAlgorithm.h"

PortalLayout::PortalLayout() {
	pathGraph = NULL;
	floorMesh = NULL;
	setLoggingName("PortalLayout");
}

PortalLayout::~PortalLayout() {
//	delete pathGraph;
//	pathGraph = NULL;
}
Vector<MeshData*> PortalLayout::getTransformedMeshData(Matrix4 transform) {
	if (cellProperties.size() > 0)
		return cellProperties.get(0).getTransformedMeshData(transform);
	else {
		Vector<MeshData*> dummy;
		return dummy;
	}
}
osg::ref_ptr<osg::Node> PortalLayout::draw() {
	//info("Drawing ComponentAppearanceTemplate " + TemplateManager::instance()->getAppearanceTemplateString(this), true);
	osg::Group* group = new osg::Group();
	

	for (int i=0; i<cellProperties.size(); i++) {
		group->addChild(cellProperties.get(i).draw());
	}
	
	if(floorMesh != NULL)
		group->addChild(floorMesh->draw());
		
	if(pathGraph)
		group->addChild(pathGraph->draw());
	
	return group;
}
uint32 PortalLayout::loadCRC(IffStream* iffStream) {
	uint32 crc = 0;
	try {
		iffStream->openForm('PRTO');
		
		uint32 type = iffStream->getNextFormType();
		
		iffStream->openForm(type);
	
		
		Chunk *chunk = iffStream->openChunk();
		while(chunk != NULL && chunk->getChunkID() != 'CRC ') // Yes the space is intentional
		{
			iffStream->closeChunk();
			chunk = iffStream->openChunk();
		}
		
		if(chunk->getChunkID() == 'CRC ')
			crc = iffStream->getUnsignedInt();
		
		iffStream->closeChunk('CRC ');
		
		iffStream->closeForm(type);
				
		iffStream->closeForm('PRTO');
	} catch (Exception& e) {
		String err = "unable to parse portal crc ";
		err += iffStream->getFileName();
		static Logger logger;
		logger.error(err);
	}
	
	return crc;
}

void PortalLayout::parse(IffStream* iffStream) {
	try {
		iffStream->openForm('PRTO');

		uint32 type = iffStream->getNextFormType();

		if (type != '0001' && type != '0003' && type != '0004') {
			StringBuffer stream;
			stream << "invalid PROTO type 0x" << hex << type;
			error(stream);

			return;
		}

		iffStream->openForm(type);

		Chunk* data = iffStream->openChunk('DATA');

		uint32 var1 = iffStream->getInt();
		uint32 var2 = iffStream->getInt();

		iffStream->closeChunk('DATA');

		iffStream->openForm('PRTS');

		//skipping PRTS
		iffStream->closeForm('PRTS');

		//open CELS form
		parseCELSForm(iffStream);

		//path graph

		uint32 nextType = iffStream->getNextFormType();

		if (nextType == 'PGRF') {
			pathGraph = new PathGraph(NULL);
			pathGraph->readObject(iffStream);
		}
		
		Chunk* crcChunk = iffStream->openChunk();
		crc = iffStream->getUnsignedInt();
		iffStream->closeChunk();

		iffStream->closeForm(type);

		iffStream->closeForm('PRTO');
	} catch (Exception& e) {
		String err = "unable to parse file ";
		err += iffStream->getFileName();
		error(err);
	}

	connectFloorMeshGraphs();
}

int PortalLayout::getCellID(const String& cellName) {
	for (int i = 0; i < cellProperties.size(); ++i) {
		CellProperty& cell = cellProperties.get(i);

		if (cell.getName() == cellName)
			return i;
	}

	return -1;
}

void PortalLayout::connectFloorMeshGraphs() {
	for (int i = 0; i < cellProperties.size(); ++i) {
		FloorMesh* floorMesh = getFloorMesh(i);

		if (floorMesh == NULL)
			continue;

		PathGraph* pathGraph = floorMesh->getPathGraph();

		if (pathGraph == NULL)
			continue;

		Vector<PathNode*> globalNodes = pathGraph->getGlobalNodes();

		for (int j = 0; j < globalNodes.size(); ++j) {
			PathNode* node = globalNodes.get(j);

			int globalID = node->getGlobalGraphNodeID();

			for (int k = 0; k < cellProperties.size(); ++k) {
				if (i != k) {
					FloorMesh* newMesh = getFloorMesh(k);

					if (newMesh != NULL) {
						PathGraph* newPathGraph = newMesh->getPathGraph();

						if (newPathGraph != NULL) {
							Vector<PathNode*> newGlobalNodes = newPathGraph->getGlobalNodes();

							for (int l = 0; l < newGlobalNodes.size(); ++l) {
								PathNode* newNode = newGlobalNodes.get(l);

								int newGlobalID = newNode->getGlobalGraphNodeID();

								if (globalID == newGlobalID)
									node->addChild(newNode);
							}
						}
					}
				}
			}
		}
	}

}

int PortalLayout::getFloorMeshID(int globalNodeID, int floorMeshToExclude) {
	for (int i = 0; i < cellProperties.size(); ++i) {
		if (i == floorMeshToExclude)
			continue;

		FloorMesh* floorMesh = getFloorMesh(i);
		PathNode* node = floorMesh->getGlobalNode(globalNodeID);

		if (node != NULL)
			return i;
	}

	return -1;
}

void PortalLayout::parseCELSForm(IffStream* iffStream) {
	try {
		iffStream->openForm('CELS');

		uint32 nextType;

		while (iffStream->getRemainingSubChunksNumber() > 0 && (nextType = iffStream->getNextFormType()) == 'CELL') {
			CellProperty cell(cellProperties.size());

			try {
				cell.readObject(iffStream);
			} catch (Exception& e) {
				error(e.getMessage());
			} catch (...) {
				error("Unreported exception caught parsing cell property");
			}

			cellProperties.add(cell);
		}

		iffStream->closeForm('CELS');

	} catch (Exception& e) {
		error(e.getMessage());
		error("parsing CELS for " + iffStream->getFileName());
	} catch (...) {
		//error("parsing CELS for " + iffStream->getFileName());

		throw;
	}
}

Vector<PathNode*>* PortalLayout::getPath(PathNode* node1, PathNode* node2) {
	return AStarAlgorithm<PathGraph, PathNode>::search<uint32>(node1->getPathGraph(), node1, node2);
}
