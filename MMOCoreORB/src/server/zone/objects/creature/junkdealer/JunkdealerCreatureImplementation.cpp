/*
 * TrainerCreatureImplementation.cpp
 *
 *  Created on: 26/05/2010
 *      Author: victor
 */

#include "JunkdealerCreature.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/packets/object/StartNpcConversation.h"
#include "server/zone/packets/object/StringList.h"
#include "server/zone/packets/object/StopNpcConversation.h"
#include "server/zone/packets/object/NpcConversationMessage.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/SuiWindowType.h"
#include "server/zone/objects/tangible/loot/LootkitObject.h"
#include "server/chat/StringIdChatParameter.h"
#include "server/zone/objects/creature/junkdealer/sui/JunkDealerSellListSuiCallback.h"



void JunkdealerCreatureImplementation::sendConversationStartTo(SceneObject* obj) {
	if (!obj->isPlayerCreature())
		return;

	CreatureObject* player = cast<CreatureObject*>( obj);

	PlayerObject* ghost = player->getPlayerObject();

	String stffile = getConversationString(_this.get()->getJunkDealerBuyerType());

	StartNpcConversation* conv = new StartNpcConversation(player, getObjectID(), "");
	player->sendMessage(conv);
	ghost->setLastNpcConvStr(getObjectNameStringIdName());

	ghost->setLastNpcConvMessStr("");
	sendInitialMessage(player);

}


void JunkdealerCreatureImplementation::sendInitialMessage(CreatureObject* player) {
	String stffile = getConversationString(_this.get()->getJunkDealerBuyerType());
	String stfname = "s_bef51e38";

	StringIdChatParameter params(stffile, stfname);
	NpcConversationMessage* m1 = new NpcConversationMessage(player, params);
	player->sendMessage(m1);

	PlayerObject* ghost = player->getPlayerObject();

	ghost->setLastNpcConvMessStr("junkdealer_initial");
	sendInitialChoices(player);
}


void JunkdealerCreatureImplementation::sendInitialChoices(CreatureObject* player) {
	StringList* slist = new StringList(player);

	slist->insertOption(getConversationString(_this.get()->getJunkDealerBuyerType()), "s_54fab04f");
	slist->insertOption(getConversationString(_this.get()->getJunkDealerBuyerType()), "s_cd7a3f41");
	slist->insertOption(getConversationString(_this.get()->getJunkDealerBuyerType()), "s_3aa18b2d");

	PlayerObject* ghost = player->getPlayerObject();
	ghost->setLastNpcConvMessStr("junkdealer_options");

	player->sendMessage(slist);
}

void JunkdealerCreatureImplementation::selectConversationOption(int option, SceneObject* obj) {
	if (!obj->isPlayerCreature())
		return;

	CreatureObject* player = cast<CreatureObject*>( obj);
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost->getLastNpcConvStr() != getObjectNameStringIdName())
		return;

	String stffile = getConversationString(_this.get()->getJunkDealerBuyerType());

	String choice;

	if (ghost->countLastNpcConvOptions() > 0) {
		if (ghost->getLastNpcConvMessStr() == "junkdealer_kit5")
			choice = ghost->getLastNpcConvOption(0);
		else if (ghost->countLastNpcConvOptions() > (uint32)option)
			choice = ghost->getLastNpcConvOption(option);
	}

	ghost->clearLastNpcConvOptions();


	if (ghost->getLastNpcConvMessStr() == "junkdealer_options") {
		switch (option) {
			case 0: {
				StringIdChatParameter params(stffile, "s_84a67771");
				NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
				ghost->setLastNpcConvMessStr("junkdealer_sell");
				ghost->addLastNpcConvOptions(choice);
				player->sendMessage(skillmsg);

				createSellJunkLootSelection(player);
				player->sendMessage(new StopNpcConversation(player, getObjectID()));
				break;
			}
			case 1: {
				StringIdChatParameter params(stffile, "s_4bd9d15e");
				NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
				ghost->setLastNpcConvMessStr("junkdealer_nosell");
				ghost->addLastNpcConvOptions(choice);
				player->sendMessage(skillmsg);

				break;
			}
			case 2: {
				StringIdChatParameter params(stffile, "s_d9e6b751");
				NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
				ghost->setLastNpcConvMessStr("junkdealer_kit1");
				ghost->addLastNpcConvOptions(choice);
				player->sendMessage(skillmsg);

				StringList* slist = new StringList(player);

				slist->insertOption(stffile, "s_6d53d062");

				player->sendMessage(slist);

				break;
			}
		}
	} else if (ghost->getLastNpcConvMessStr() == "junkdealer_kit1") {
		if (option == 0) {
			StringIdChatParameter params(stffile, "s_e29f48dc");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_kit2");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

			StringList* slist = new StringList(player);

			slist->insertOption(stffile, "s_324b9b0f");

			player->sendMessage(slist);

		}
	} else if (ghost->getLastNpcConvMessStr() == "junkdealer_kit2") {
		if (option == 0) {
			StringIdChatParameter params(stffile, "s_12fe83a6");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_kit3");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

			StringList* slist = new StringList(player);

			slist->insertOption(stffile, "s_e1a103e5");

			player->sendMessage(slist);

		}
	} else if (ghost->getLastNpcConvMessStr() == "junkdealer_kit3") {
		if (option == 0) {
			StringIdChatParameter params(stffile, "s_4d65752");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_kit4");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

			StringList* slist = new StringList(player);

			slist->insertOption(stffile, "s_d347bee3");
			slist->insertOption(stffile, "s_b60b73f8");

			player->sendMessage(slist);

		}
	} else if (ghost->getLastNpcConvMessStr() == "junkdealer_kit4") {
		if (option == 0) {
			StringIdChatParameter params(stffile, "s_3fc7eb45");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_kit5");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

			StringList* slist = new StringList(player);

			slist->insertOption(stffile, "s_ee977dee");
			slist->insertOption(stffile, "s_8f39769");
			slist->insertOption(stffile, "s_fe657cdd");
			slist->insertOption(stffile, "s_9ede4b84");
			slist->insertOption(stffile, "s_87c5851b");

			player->sendMessage(slist);

		} else {
			StringIdChatParameter params(stffile, "s_3633b5a5");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_nokit");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);
		}

	} else if (ghost->getLastNpcConvMessStr() == "junkdealer_kit5") {
		ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

		bool found = false;

		uint32 CRC = 0;

		switch (option) {
			case 0: {
				CRC = ORANGERUG;
				break;
			}
			case 1: {
				CRC = BLUERUG;
				break;
			}
			case 2: {
				CRC = GONG;
				break;
			}
			case 3: {
				CRC = TABLE;
				break;
			}
			default: {
				CRC = SCULPTURE;
				break;
			}
		}

		Locker locker(inventory);

		for (int i = 0; i < inventory->getContainerObjectsSize(); i++) {
			uint32 objectCRC = inventory->getContainerObject(i)->getServerObjectCRC();
			if (objectCRC == BLUERUG || objectCRC == ORANGERUG || objectCRC == GONG || objectCRC == TABLE || objectCRC == SCULPTURE) {
				found = true;
			}
		}

		ManagedReference<SceneObject*> bank = player->getSlottedObject("bank");

		Locker blocker(bank);

		for (int j = 0; j < bank->getContainerObjectsSize(); j++) {
			uint32 objectCRC = bank->getContainerObject(j)->getServerObjectCRC();
			if (objectCRC == BLUERUG || objectCRC == ORANGERUG || objectCRC == GONG || objectCRC == TABLE || objectCRC == SCULPTURE) {
				found = true;
			}
		}

		if (found) {
			StringIdChatParameter params(stffile, "s_3df21ea0");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_alreadyhavekit");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

		} else if (inventory->hasFullContainerObjects()) {
			StringIdChatParameter params(stffile, "s_5b10c0b9");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_inventoryfull");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

		} else {
			StringIdChatParameter params(stffile, "s_14efaaa2");
			NpcConversationMessage* skillmsg = new NpcConversationMessage(player, params);
			ghost->setLastNpcConvMessStr("junkdealer_givekit");
			ghost->addLastNpcConvOptions(choice);
			player->sendMessage(skillmsg);

			ManagedReference<LootkitObject*> lootkit = (server->getZoneServer()->createObject(CRC, 2)).castTo<LootkitObject*>();

			lootkit->sendTo(player, true);
			if (!inventory->transferObject(lootkit, -1, true))
				info("Could not add object.", true);
		}
	} else
		player->sendMessage(new StopNpcConversation(player, getObjectID()));
}

void JunkdealerCreatureImplementation::createSellJunkLootSelection(CreatureObject* player) {
	if (player == NULL)
		return;
	int dealerType= _this.get()->getJunkDealerBuyerType();
	if (dealerType==0){
		player->sendSystemMessage("Junk Dealer Not Configured at this time :(");
		player->sendMessage(new StopNpcConversation(player, getObjectID()));
	}else{
		bool bHaveStuffToSell = false;
		ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
		for (int i = 0; i < inventory->getContainerObjectsSize(); i++) {
			ManagedReference<TangibleObject*>  item = cast<TangibleObject*>(inventory->getContainerObject(i));
			if ((item->getJunkDealerNeeded() & dealerType) == dealerType && item->getCraftersName().isEmpty() == true ){
				bHaveStuffToSell=true;
				break;
			}
		}

		if (bHaveStuffToSell==true) {
			// create new window
			ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUNK_DEALER_SELL_LIST, SuiListBox::HANDLETHREEBUTTON);
			box->setCallback(new JunkDealerSellListSuiCallback(server->getZoneServer()));

			box->setPromptText("@loot_dealer:sell_prompt");
			box->setOtherButton(true, "@loot_dealer:btn_sell_all");
			box->setPromptTitle("@loot_dealer:sell_title");

			box->setHandlerText("handleUpdateSchematic");
			box->setOkButton(true, "@loot_dealer:btn_sell");
			box->setCancelButton(true, "@cancel");

			for (int i = 0; i < inventory->getContainerObjectsSize(); i++) {
				UnicodeString itemName = StringIdManager::instance()->getStringId(inventory->getContainerObject(i)->getDisplayedName().hashCode());
				ManagedReference<TangibleObject*>  item = cast<TangibleObject*>(inventory->getContainerObject(i));

				//if (item->getCraftersName().isEmpty() == true && item->isWeaponObject()==false && item->isArmorObject()==false
				//		&& item->isAttachment()==false && item->isDeedObject()==false && item->isContainerObject()==false && item->isResourceContainer()==false )
				if ((item->getJunkDealerNeeded() & dealerType) == dealerType && item->getCraftersName().isEmpty() == true && item->isSliced() == false  )
					box->addMenuItem("[" + String::valueOf(item->getJunkValue()) + "Cr] " + itemName.toString(), inventory->getContainerObject(i)->getObjectID());
			}

			box->setUsingObject(_this.get());
			player->getPlayerObject()->addSuiBox(box);
			player->sendMessage(box->generateMessage());
		}else{
			player->sendSystemMessage("You currently have nothing of interest.");
			player->sendMessage(new StopNpcConversation(player, getObjectID()));

		}
	}

}
String JunkdealerCreatureImplementation::getConversationString(int dealerType) {
	switch (dealerType){
		case JUNKCONVGENERIC:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVARMS:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVFINARY:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVDENDERRORI:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVDENDERTHEED:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVLILABORVO:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVMALIKVISTAL:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVNADOWATTOS:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVNATHANTAIKE:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVOLLOBOJABBAS:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVQUICHDANTOOINE:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVREGGINYM:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVSHEANILAKE:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVSNEGVALARIAN:
			{return "conversation/junk_dealer_generic";}
		case JUNKCONVJAWATRADER:
			{return "conversation/junk_dealer_generic";}
		default:
			{return "conversation/junk_dealer_generic";}
		}

}
