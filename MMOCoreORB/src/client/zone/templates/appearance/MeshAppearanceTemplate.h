/*
 * MeshAppearanceTemplate.h
 *
 *  Created on: 07/12/2010
 *      Author: victor
 */

#ifndef MESHAPPEARANCETEMPLATE_H_
#define MESHAPPEARANCETEMPLATE_H_

#include "engine/engine.h"
#include "AppearanceTemplate.h"
#include <osg/Node>
#include <osg/Geometry>
#include <osg/Notify>
#include <osg/MatrixTransform>
#include <osg/Texture2D>
#include <osgViewer/Viewer>
#include <osg/Shape>
#include <osg/ShapeDrawable>
#include <osgGA/StateSetManipulator>
namespace osg {
	class Node;
}
class MeshVertex : public Object {
protected:
	float x, y, z;

public:
	MeshVertex() : x(0), y(0), z(0) {

	}

	MeshVertex(const MeshVertex& vert) : Object() {
		x = vert.x;
		y = vert.y;
		z = vert.z;
	}

	void readObject(IffStream* iffStream) {
		x = iffStream->getFloat();
		y = iffStream->getFloat();
		z = iffStream->getFloat();

	}

	inline float getX() const {
		return x;
	}

	inline float getY() const {
		return y;
	}

	inline float getZ() const {
		return z;
	}

	friend class MeshAppearanceTemplate;
	friend class MeshData;
};

class MeshTriangle : public Object {
protected:
	int vertex1, vertex2, vertex3;

public:
	MeshTriangle() : vertex1(0), vertex2(0), vertex3(0) {

	}

	MeshTriangle(const MeshTriangle& mesh) : Object() {
		vertex1 = mesh.vertex1;
		vertex2 = mesh.vertex2;
		vertex3 = mesh.vertex3;
	}

	friend class MeshData;
	friend class MeshAppearanceTemplate;
};

class MeshData : public Object {
protected:
	Vector<MeshVertex> vertices;
	Vector<MeshTriangle> triangles;

public:
	MeshData() {

	}

	MeshData(const MeshData& data) : Object(){
		vertices = data.vertices;
		triangles = data.triangles;
	}

	void readObject(IffStream* iffStream);
	
	osg::ref_ptr<osg::Node> draw();

	friend class MeshAppearanceTemplate;

};

class MeshAppearanceTemplate : public AppearanceTemplate, Logger {
	Vector<MeshData>* meshes;
	//Vector<Triangle> triangles;

	AABBTree* aabbTree;
	Sphere* boundingSphere;
	//String file;

public:
	MeshAppearanceTemplate() {
		aabbTree = NULL;
		meshes = NULL;
		boundingSphere = NULL;
	}

	~MeshAppearanceTemplate() {
		delete aabbTree;
		aabbTree = NULL;

		delete boundingSphere;
		boundingSphere = NULL;
	}
	
	osg::ref_ptr<osg::Node> draw();

	void createAABB();

	void readObject(IffStream* templateData) {
		parse(templateData);
	}

	void parse(IffStream* iffStream);
	void parseSPS(IffStream* iffStream);
	void parseVertexData(IffStream* iffStream, int idx);

	bool testCollide(float x, float z, float y, float radius);

	AppearanceTemplate* getFirstMesh() {
		return this;
	}

	inline void getTriangles(Vector<Triangle*>& triangles) {
		if (aabbTree != NULL)
			aabbTree->getTriangles(triangles);
	}

	/*inline String& getFileName() {
		return file;
	}*/

	inline AABBTree* getAABBTree() {
		return aabbTree;
	}

	inline Sphere* getBoundingSphere() {
		return boundingSphere;
	}

};

#endif /* MESHAPPEARANCETEMPLATE_H_ */
