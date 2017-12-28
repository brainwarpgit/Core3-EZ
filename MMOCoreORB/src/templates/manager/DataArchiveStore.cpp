/*
 * DataArchiveStore.cpp
 *
 *  Created on: 06/09/2013
 *      Author: victor
 */

#include "DataArchiveStore.h"

#include <stddef.h>

#include "engine/util/iffstream/IffStream.h"
#include "system/io/File.h"
#include "system/io/FileReader.h"
#include "system/lang/Exception.h"
#include "system/lang/ref/Reference.h"
#include "system/thread/Locker.h"
#include "system/thread/ReadLocker.h"
#include "tre3/TreeArchive.h"

DataArchiveStore::DataArchiveStore() : Logger("DataArchiveStore") {
	treeDirectory = NULL;
}

DataArchiveStore::~DataArchiveStore() {
	delete treeDirectory;
	treeDirectory = NULL;
}

byte* DataArchiveStore::getData(const String& path, int& size) {
	ReadLocker locker(this);
	//read from local dir else from tres
	File* file = new File(path);
	byte* data = NULL;
	size = 0;

	try {
		Reference<FileReader*> test = new FileReader(file);

		if (file->exists()) {
			size = file->size();

			data = new byte[size];

			test->read((char*)data, size);

			test->close();

			test = NULL;

			delete file;

			return data;
		}
	} catch (Exception& e) {

	}

	delete file;

	if (treeDirectory == NULL)
		return NULL;

	data = treeDirectory->getBytes(path, size);

	if (size == 0) {
		delete [] data;
		return NULL;
	}

	return data;
}

int DataArchiveStore::loadTres(const String& path, const Vector<String>& treFilesToLoad) {
	Locker locker(this);

	if (treeDirectory != NULL) {
		//error("tree directory already loaded");

		return 0;
	}

	if (path.length() <= 1)
		return 2;

	if (treFilesToLoad.size() == 0)
		return 3;

	info("Loading TRE archives...");

	treeDirectory = new TreeArchive();

	int j = 0;


	for (int i = 0; i < treFilesToLoad.size(); ++i) {
		const String& file = treFilesToLoad.get(i);
		String fullPath = path + "/" + file;

		treeDirectory->unpackFile(fullPath);
	}

	info("Finished loading TRE archives.");

	return 0;
}

IffStream* DataArchiveStore::openIffFile(const String& fileName) {
	if (fileName.isEmpty())
		return NULL;

	IffStream* iffStream = NULL;

	int size = 0;

	byte* data = getData(fileName, size);

	if (size == 0)
		return NULL;

	iffStream = new IffStream();

	if (iffStream != NULL) {
		try {
			if (!iffStream->parseChunks(data, size, fileName)) {
				delete iffStream;
				iffStream = NULL;
			}
		} catch (Exception& e) {
			delete iffStream;
			iffStream = NULL;
		}
	}

	delete [] data;

	return iffStream;
}

