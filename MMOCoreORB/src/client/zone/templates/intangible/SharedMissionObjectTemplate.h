/*
 * SharedMissionObjectTemplate.h
 *
 *  Created on: 06/05/2010
 *      Author: victor
 */

#ifndef SHAREDMISSIONOBJECTTEMPLATE_H_
#define SHAREDMISSIONOBJECTTEMPLATE_H_

#include "../SharedIntangibleObjectTemplate.h"

class SharedMissionObjectTemplate : public SharedIntangibleObjectTemplate {

public:
	SharedMissionObjectTemplate() {

	}

	~SharedMissionObjectTemplate() {

	}

	void readObject(IffStream* iffStream) {
		uint32 nextType = iffStream->getNextFormType();

		if (nextType != 'SMSO') {
			//Logger::console.error("expecting SHOT got " + String::hexvalueOf((int)nextType));

			SharedIntangibleObjectTemplate::readObject(iffStream);

			return;
		}

		iffStream->openForm('SMSO');

		uint32 derv = iffStream->getNextFormType();

		if (derv == 'DERV') {
			loadDerv(iffStream);

			derv = iffStream->getNextFormType();
		}


		iffStream->openForm(derv);

		try {
			//parseFileData(iffStream);
		} catch (Exception& e) {
			String msg;
			msg += "exception caught parsing file data ->";
			msg += e.getMessage();

			Logger::console.error(msg);
		}

		iffStream->closeForm(derv);

		if (iffStream->getRemainingSubChunksNumber() > 0) {
			readObject(iffStream);
		}

		iffStream->closeForm('SMSO');
	}

};


#endif /* SHAREDMISSIONOBJECTTEMPLATE_H_ */
