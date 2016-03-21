/*
 * CustomizationDataMap.h
 *
 *  Created on: Feb 11, 2011
 *      Author: crush
 */

#ifndef CUSTOMIZATIONDATAMAP_H_
#define CUSTOMIZATIONDATAMAP_H_

#include "engine/engine.h"
#include "CustomizationData.h"

#include "zone/templates/datatables/DataTableIff.h"
#include "zone/templates/datatables/DataTableRow.h"
#include "zone/templates/datatables/DataTableCell.h"

class CustomizationDataMap : public VectorMap<String, CustomizationData> {
public:
	CustomizationDataMap() {
		setAllowDuplicateInsertPlan();
	}

	void parseFromIffStream(IffStream* iffStream) {
	}
};

#endif /* CUSTOMIZATIONDATAMAP_H_ */
