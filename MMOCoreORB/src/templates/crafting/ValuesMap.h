/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef VALUESMAP_H_
#define VALUESMAP_H_

#include "ValuesClasses.h"

//class ValuesMap : public VectorMap<String, Reference<Subclasses*> >, public Logger {
class ValuesMap : public Object, public Logger {
	SortedVector<String> attributes;
	SortedVector<String> visibleGroups;
	VectorMap<String, String> attributeGroups;
	VectorMap<String, Reference<Values*>> attributeValues;

	const static String EMPTY;

public:
	static float VALUENOTFOUND;

	// Ingredient combine types
	static const short RESOURCECOMBINE = 0x00;
	static const short LINEARCOMBINE = 0x01;
	static const short PERCENTAGECOMBINE = 0x02;
	static const short BITSETCOMBINE = 0x03;
	static const short OVERRIDECOMBINE = 0x04;
	static const short LIMITEDCOMBINE = 0x05;

	ValuesMap() {
		setLoggingName("ValuesMap");

		attributes.setNoDuplicateInsertPlan();
		visibleGroups.setNoDuplicateInsertPlan();
		attributeGroups.setNoDuplicateInsertPlan();
		attributeValues.setNoDuplicateInsertPlan();

		attributeValues.setNullValue(nullptr);
	}

	~ValuesMap() {
	}

	void addExperimentalAttribute(const String& attribute, const String& group, const float min, const float max, const int precision, const bool filler, const int combine);

	// Returns the attribute name from the index
	const String& getAttribute(const int i) const;

	const String& getAttributeGroup(const String& attribute) const;
	const String& getAttributeGroup(const int i) const;

	const String& getVisibleAttributeGroup(const int i) const;
	int getTotalVisibleAttributeGroups() const;

	bool hasAttribute(const String& attribute) const;

	bool isHidden(const String& attribute) const;
	void setHidden(const String& attribute);
	void unsetHidden(const String& attribute);

	short getCombineType(const String& attribute) const;

	void setCurrentValue(const String& attribute, const float value);
	void setCurrentValue(const String& attribute, const float value, const float min, const float max);

	float getCurrentValue(const String& attribute) const;
	float getCurrentValue(const int i) const;

	void lockValue(const String& attribute);
	void unlockValue(const String& attribute);
	void resetValue(const String& attribute);

	void setCurrentPercentage(const String& subtitle, const float value);
	void setCurrentPercentage(const String& subtitle, const float value, const float max);

	float getCurrentPercentage(const String& attribute) const;
	float getCurrentPercentage(const int i) const;

	float getCurrentVisiblePercentage(const String title) const;

	void setMaxPercentage(const String& attribute, const float value);

	float getMaxPercentage(const String& attribute) const;
	float getMaxPercentage(const int i) const;

	float getMaxVisiblePercentage(const int i) const;

	float getMinValue(const String& attribute) const;
	float getMaxValue(const String& attribute) const;

	void setMinValue(const String& attribute, const float value);
	void setMaxValue(const String& attribute, const float value);

	int getPrecision(const String& attribute) const;
	void setPrecision(const String& attribute, const int precision);

	inline int getSize() const {
		return attributes.size();
	}
};

#endif /*VALUESMAP_H_*/
