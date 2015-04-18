/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

/**
 * \file ResourceTreeNode.cpp
 * \author Kyle Burkhardt
 * \date 5-03-10
 */

#include "ResourceTreeNode.h"

ResourceTreeNode::ResourceTreeNode(const String& t, const String& n, const int d) {

	stfName = t;
	name = n;
	depth = d;

	parentNode = NULL;

	maxtype = mintype = maxpool = minpool = 0;
}

ResourceTreeNode::~ResourceTreeNode() {
	while (nodes.size() > 0)
		delete nodes.remove(0);

	while (entries.size() > 0)
		delete entries.remove(0);

	parentNode = NULL;
}

String ResourceTreeNode::getName() {
	return name;
}

String ResourceTreeNode::getStfName() {
	return stfName;
}

void ResourceTreeNode::setParentNode(ResourceTreeNode* parent) {
	parentNode = parent;
}

ResourceTreeNode* ResourceTreeNode::getParentNode() {
	return parentNode;
}

void ResourceTreeNode::add(ResourceTreeEntry* entry) {


	 //Find out which child node this entry belongs to, and
	 //if it doesn't exist, create it
	for(int ii = 0; ii < nodes.size(); ++ii) {

		ResourceTreeNode* node = nodes.get(ii);
		if(node->getName() == entry->getClass(depth)) {
			node->add(entry);
			return;
		}
	}

	//The entry doesn't belong to an existing child node, now we
	//determine if it belong on this node, or on a new child node.
	if(entry->getClassCount() > depth + 1) {

		String stfType = "";

		for(int i = 0; i < entries.size(); ++i) {
			ResourceTreeEntry* ent = entries.get(i);
			if(ent->getFinalClass() == entry->getClass(depth)) {
				stfType = ent->getType();
				ent->setChildren(true);
				break;
			}
		}

		ResourceTreeNode* newnode = new ResourceTreeNode(stfType, entry->getClass(depth), depth + 1);
		nodes.add(newnode);
		newnode->add(entry);
		newnode->setParentNode(this);

	} else {

		entry->setMyNode(this);
		entries.add(entry);
	}
}

ResourceTreeEntry* ResourceTreeNode::find(const String& type, ResourceTreeEntry* entry) {
	if (entry != NULL)
		return entry;

	for(int i = 0; i < entries.size(); ++i) {
		ResourceTreeEntry* ent = entries.get(i);

		if(ent->getType() == type || ent->getFinalClass() == type) {
			return ent;
		}
	}

	for(int i = 0; i < nodes.size(); ++i) {
		ResourceTreeNode* node = nodes.get(i);
		entry = node->find(type, entry);
	}
	return entry;
}

ResourceTreeNode* ResourceTreeNode::findNode(const String& type, ResourceTreeNode* node) {
	if (node != NULL)
		return node;

	for (int i = 0; i < nodes.size(); ++i) {
		ResourceTreeNode* n = nodes.get(i);

		if (n->getStfName() == type || n->getName() == type)
			return n;

		node = n->findNode(type, node);
	}

	return node;
}

ResourceTreeEntry* ResourceTreeNode::getEntry(const String& type,
		const Vector<String>& excludes, const String& zoneName) {

	ResourceTreeEntry* entry = NULL;
	entry = find(type, entry);

	if(entry == NULL)
		return NULL;

	// If the entry has no childen, it means
	// that a specific resource was requested
	if(!entry->hasChildren())
		return entry;

	 ResourceTreeNode* node = entry->getMyNode()->findNode(type);

	if(node == NULL)
		return NULL;

	if (zoneName != "") {

		return node->getPlanetSpecificEntry(zoneName);

	} else {

		Vector<ResourceTreeEntry*> candidates;

		node->getEntryPool(candidates, excludes);

		if(candidates.size() == 0)
			return NULL;

		int random = System::random(candidates.size() - 1);

		return candidates.get(random);
	}
}

ResourceTreeEntry* ResourceTreeNode::getPlanetSpecificEntry(const String& planet) {
	for(int i = 0; i < entries.size(); ++i) {
		ResourceTreeEntry* ent = entries.get(i);
		if(ent->getType().indexOf(planet) != -1) {
			return ent;
		}
	}
	return NULL;
}

void ResourceTreeNode::getEntryPool(Vector<ResourceTreeEntry*>& candidates,
		const Vector<String> excludes) {
	for(int i = 0; i < entries.size(); ++i) {

		ResourceTreeEntry* ent = entries.get(i);
		bool valid = true;

		if(!ent->isRecycled() && !ent->hasChildren()) {

			for(int ii = 0; ii < excludes.size(); ++ii) {
				if(ent->isType(excludes.get(ii))) {
					valid = false;
					break;
				}
			}

			if(valid)
				candidates.add(ent);
		}
	}


	for(int i = 0; i < nodes.size(); ++i) {
		ResourceTreeNode* node = nodes.get(i);
		node->getEntryPool(candidates, excludes);
	}

}

/*void ResourceTreeNode::updateEntries() {
	for(int i = 0; i < entries.size(); ++i) {
		ResourceTreeEntry* ent = entries.get(i);
		ResourceTreeNode* node = ent->getMyNode();
		ent->addClass(ent->getType());
		while(node->getParentNode() != NULL) {
			ent->addClass(node->getName());
			node = node->getParentNode();
		}
		ent->toString();
	}

	for(int i = 0; i < nodes.size(); ++i) {
		ResourceTreeNode* node = nodes.get(i);
		node->updateEntries();
	}
}*/

void ResourceTreeNode::addToSuiListBox(SuiListBox* suil) {
	suil->setPromptTitle("@veteran:resource_title"); //Resources

	for(int i = 0; i < nodes.size(); ++i) {
		if (parentNode != NULL)
			suil->setPromptText("@veteran:choose_sub_class"); //Chose resource class from
		else
			suil->setPromptText("@veteran:choose_class"); //Choose resource class
		ResourceTreeNode* node = nodes.get(i);
		suil->addMenuItem(node->getName(), 0);
	}

	for(int i = 0; i < entries.size(); ++i) {
		suil->setPromptText("@veteran:choose_type"); //Choose resource type from
		ResourceTreeEntry* ent = entries.get(i);
		if(!ent->hasChildren() && !ent->isRecycled())
			suil->addMenuItem(ent->getFinalClass());
	}
}

void ResourceTreeNode::toString() {
	System::out << "--- Node " << depth << " : " << name << "---" << stfName << endl;

	System::out << "NODES" << endl;
	for(int i = 0; i < nodes.size(); ++i)
		System::out << nodes.get(i)->getName() << " " <<
				nodes.get(i)->getStfName() << endl;

	System::out << "ENTRIES" << endl;
	for(int i = 0; i < entries.size(); ++i)
		//System::out << entries.get(i)->getType() << " Has Children = " << entries.get(i)->hasChildren() << endl;
		entries.get(i)->toString();

	for(int i = 0; i < nodes.size(); ++i)
		nodes.get(i)->toString();
}
