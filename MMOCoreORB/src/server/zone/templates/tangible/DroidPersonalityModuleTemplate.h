/**
 * Droid Module Effects Template
 * 11/26/2014
 */
#ifndef DROIDPERSONALITYMODULETEMPLATE_H_
#define DROIDPERSONALITYMODULETEMPLATE_H_
#include "server/zone/templates/SharedTangibleObjectTemplate.h"
class DroidPersonalityModuleTemplate : public SharedTangibleObjectTemplate {

protected:
	String reactionName;
	String attrName;
	String convTemplate;
public:
	DroidPersonalityModuleTemplate()  {}
	~DroidPersonalityModuleTemplate() {}
	void readObject(LuaObject* templateData) {
		SharedTangibleObjectTemplate::readObject(templateData);
		reactionName = templateData->getStringField("reactionName");
		attrName = templateData->getStringField("attrName");
		convTemplate = templateData->getStringField("conversationTemplate");
	}

	String& getReactionName() {
		return reactionName;
	}
	String& getChipName() {
		return attrName;
	}
	String& getConversationTemplate() {
		return convTemplate;
	}
	 bool isDroidPersonalityModuleTemplate() {
		 return true;
	 }
};
#endif /*DROIDPERSONALITYMODULETEMPLATE_H_*/
