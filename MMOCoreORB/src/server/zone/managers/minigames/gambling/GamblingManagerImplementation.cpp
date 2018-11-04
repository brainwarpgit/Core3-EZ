/*
 * GamblingManagerImplementation.cpp
 *
 *  Created on: Apr 11, 2010
 *      Author: swgemu
 */

#include "server/zone/managers/minigames/gambling/GamblingManager.h"
#include "server/zone/managers/minigames/gambling/GamblingGameData.h"
#include "server/zone/managers/minigames/gambling/SlotGameData.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/managers/stringid/StringIdManager.h"
#include "server/zone/objects/tangible/terminal/gambling/GamblingTerminal.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/minigames/events/GamblingTimeoutEvent.h"
#include "server/zone/objects/player/sui/callbacks/GamblingSlotSuiCallback.h"

void GamblingManagerImplementation::initialize() {
	Lua* lua = new Lua();
	lua->init();

	if (!lua->runFile("scripts/managers/gambling_manager.lua")) {
		error("Unable to load GamblingManager data.");
		delete lua;
		return;
	}

	gamblingEnabled = lua->getGlobalInt("gamblingEnabled");
	betTimeout = lua->getGlobalLong("betTimeout");

	LuaObject luaObject = lua->getGlobalObject("gameData");

	if (luaObject.isValidTable()) {
		for(int i = 1; i <= luaObject.getTableSize(); ++i) {
			LuaObject entry = luaObject.getObjectAt(i);

			int gameType = entry.getIntAt(1);
			int minPlayers = entry.getIntAt(2);
			int maxPlayers = entry.getIntAt(3);
			int minBet = entry.getIntAt(4);
			int maxBet = entry.getIntAt(5);

			Reference<GamblingGameData*> data = new GamblingGameData(gameType, minPlayers, maxPlayers, minBet, maxBet);

			gameData.put(gameType, data);

			entry.pop();
		}
	}

	luaObject.pop();

	luaObject = lua->getGlobalObject("slotData");

	if (luaObject.isValidTable()) {
		for(int i = 1; i <= luaObject.getTableSize(); ++i) {
			LuaObject entry = luaObject.getObjectAt(i);

			String pattern = entry.getStringAt(1);
			int minPay = entry.getIntAt(2);
			int maxPay = entry.getIntAt(3);

			Vector<short>* resultList = new Vector<short>();

			if (pattern.beginsWith("*")) { // *1|2|3 - combo
				Vector<byte>* tempList = new Vector<byte>();
				tempList->add(Integer::valueOf(pattern.subString(2, 1)));
				tempList->add(Integer::valueOf(pattern.subString(4, 1)));
				tempList->add(Integer::valueOf(pattern.subString(6, 1)));

				for (int j = 0; j < tempList->size(); j++) {
					for (int k = 0; k < tempList->size(); k++) {
						for (int l = 0; l < tempList->size(); l++) {
							short fullNum = (tempList->get(j) * 100) + (tempList->get(k) * 10) + tempList->get(l);
							resultList->add(fullNum);
						}
					}
				}
			} else {
				resultList->add(Integer::valueOf(pattern));
			}

			Reference<SlotGameData*> data = new SlotGameData(pattern, minPay, maxPay);

			for (int m = 0; m < resultList->size(); m++)
				data->addResult(resultList->get(m));

			slotResults.add(data);

			entry.pop();
		}
	}

	luaObject = lua->getGlobalObject("slotWeights");

	if (luaObject.isValidTable()) {
		for(int i = 1; i <= luaObject.getTableSize(); ++i) {
			LuaObject entry = luaObject.getObjectAt(i);

			int reelNum = entry.getIntAt(1);
			int weight = entry.getIntAt(2);

			for (int j = 0; j < weight; j++)
				slotWeights.add(reelNum);

			entry.pop();
		}
	}

	luaObject.pop();
}

void GamblingManagerImplementation::addPlayerToTable(uint64 tableID, uint64 playerID) {
	Vector<uint64>* tableList = playerList.get(tableID);

	if (tableList != nullptr) {
		if (!tableList->contains(playerID))
			tableList->add(playerID);
	} else {
		tableList = new Vector<uint64>();
		tableList->add(playerID);
		playerList.put(tableID, tableList);
	}
}

uint64 GamblingManagerImplementation::getPlayerTable(uint64 playerID) {
	for (int i = 0; i < playerList.size(); i++) {
		VectorMapEntry<uint64, Vector<uint64>* > entry = playerList.elementAt(i);

		uint64 tableID = entry.getKey();
		Vector<uint64>* tableList = entry.getValue();

		if (tableList != nullptr && tableList->contains(playerID))
			return tableID;
	}

	return 0;
}

int GamblingManagerImplementation::getTablePlayerCount(uint64 tableID) {
	if (!playerList.contains(tableID))
		return 0;

	Vector<uint64>* tableList = playerList.get(tableID);

	return tableList->size();
}

int GamblingManagerImplementation::getMaxPlayers(int tableType) {
	if (!gameData.contains(tableType))
		return 0;

	Reference<GamblingGameData*> gameTypeData = gameData.get(tableType);

	return gameTypeData->getMaxPlayers();
}

String GamblingManagerImplementation::getGameName(int tableType) {
	switch (tableType) {
	case SLOTS: return "slot_standard";
	case ROULETTE: return "roulette";
	case SABACC: return "sabacc";
	default: return "";
	}
}

void GamblingManagerImplementation::joinTable(CreatureObject* player, GamblingTerminal* terminal) {
	int availableCredits = player->getCashCredits() + player->getBankCredits();
	int tableType = terminal->getTableType();
	uint64 tableID = terminal->getObjectID();

	if (availableCredits < 1) {
		player->sendSystemMessage("@gambling/default_interface:player_broke"); // You do not have any money to bet.
		return;
	}

	if (getPlayerTable(player->getObjectID()) != 0)
		return;

	if (getTablePlayerCount(tableID) >= getMaxPlayers(tableType)) {
		StringIdChatParameter param("@gambling/default_interface:prose_station_full"); // The selected %TT is completely occupied and may not accept new players.
		param.setTT(tableID);
		player->sendSystemMessage(param);

		return;
	}

	addPlayerToTable(tableID, player->getObjectID());

	String gameStf = "@gambling/game_n:" + getGameName(tableType);
	String gameType = StringIdManager::instance()->getStringId(gameStf.hashCode()).toString();

	StringIdChatParameter param("@gambling/default_interface:prose_player_join"); // You join the station for a game of %TO.
	param.setTO(gameType);
	player->sendSystemMessage(param);

	switch (tableType) {
	case SLOTS: startSlots(player, terminal); break;
	case ROULETTE: break;
	case SABACC: break;
	default: break;
	}
}

void GamblingManagerImplementation::leaveTable(CreatureObject* player) {

}

void GamblingManagerImplementation::startSlots(CreatureObject* player, GamblingTerminal* terminal) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == nullptr)
		return;

	String suiPrompt = "The following is the payout schedule for this slot machine.\n\nLegend:\nXXX: denotes any 3 of the same number\n*X|Y|Z: denotes any combination of the 3 numbers\n";

	ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::GAMBLING_SLOT_PAYOUT, SuiListBox::HANDLESINGLEBUTTON);
	box->setUsingObject(terminal);
	box->setOkButton(true, "@ok");
	box->setForceCloseDistance(8.f);
	box->setCancelButton(false, "@cancel");
	box->setPromptText(suiPrompt);
	box->setPromptTitle("Payout Schedule");

	for (int i = 0; i < slotResults.size(); i++) {
		Reference<SlotGameData*> slotData = slotResults.get(i);

		if (slotData == nullptr)
			continue;

		String rowText = slotData->getSlotPattern() + " -> base:" + String::valueOf(slotData->getBasePayout()) + " max:" + String::valueOf(slotData->getMaxPayout());

		box->addMenuItem(rowText);
	}

	ghost->addSuiBox(box);
	player->sendMessage(box->generateMessage());

	sendSlotsSUI(player, terminal);
}

void GamblingManagerImplementation::sendSlotsSUI(CreatureObject* player, GamblingTerminal* terminal) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == nullptr)
		return;

	int tableType = terminal->getTableType();

	Reference<GamblingGameData*> gameTypeData = gameData.get(tableType);

	if (gameTypeData == nullptr)
		return;

	ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::GAMBLING_SLOT_PAYOUT, SuiListBox::HANDLETHREEBUTTON);
	box->setCallback(new GamblingSlotSuiCallback(player, terminal, SLOTS));
	box->setUsingObject(terminal);
	box->setForceCloseDistance(8.f);
	box->setOkButton(true, "@bet_max");

	int bankValue = getBankValue(terminal->getObjectID());

	if (bankValue == 0) {
		box->setCancelButton(true, "@quit");
	} else {
		box->setCancelButton(true, "@spin");
	}

	box->setOtherButton(true, "@bet_one");
	box->setPromptText("Press the button corresponding to the desired action.");
	box->setPromptTitle("@gambling/game_n:slot_standard"); // Standard Lugjack

	int availableCredits = player->getCashCredits() + player->getBankCredits();

	box->addMenuItem("Current Bet: " + String::valueOf(bankValue));
	box->addMenuItem("Max Bet: " + String::valueOf(gameTypeData->getMaxBet()));
	box->addMenuItem("Cash Balance: " + String::valueOf(player->getCashCredits()));
	box->addMenuItem("Bank Balance: " + String::valueOf(player->getBankCredits()));
	box->addMenuItem("Total Money: " + String::valueOf(player->getCashCredits() + player->getBankCredits()));

	ghost->addSuiBox(box);
	player->sendMessage(box->generateMessage());

	addPlayerPid(player->getObjectID(), box->getBoxID());

	Reference<GamblingTimeoutEvent*> timeoutEvent = player->getPendingTask("gamblingTimeout").castTo<GamblingTimeoutEvent*>();

	if (timeoutEvent != nullptr) {
		timeoutEvent->reschedule(betTimeout);
	} else {
		timeoutEvent = new GamblingTimeoutEvent(_this.getReferenceUnsafeStaticCast(), player);
		player->addPendingTask("gamblingTimeout", timeoutEvent, betTimeout);
	}

}

void GamblingManagerImplementation::closePlayerSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == nullptr)
		return;

	uint64 playerID = player->getObjectID();

	uint64 pid = getPlayerPid(playerID);

	if (pid == 0)
		return;

	ManagedReference<SuiBox*> sui = ghost->getSuiBox(pid);

	if (sui != nullptr) {
		player->sendMessage(sui->generateCloseMessage());
		ghost->removeSuiBox(pid);
	}

	removePlayerPid(player->getObjectID());
}

void GamblingManagerImplementation::handleSlotSUI(CreatureObject* player, GamblingTerminal* terminal, bool quitPressed, bool betOne) {
	if (player == nullptr)
		return;

	int betValue = 0;

	Reference<GamblingGameData*> gameTypeData = gameData.get(SLOTS);

	if (gameTypeData == nullptr)
		return;

	uint64 terminalID = terminal->getObjectID();
	int bankValue = getBankValue(terminalID);

	// Quit or Spin if bank has a value
	if (quitPressed) {
		if (bankValue == 0) {
			leaveTable(player);
			return;
		} else {
			return;
		}
	}

	int maxBet = gameTypeData->getMaxBet();

	if (betOne) {
		betValue = 1;
	} else {
		betValue = maxBet - bankValue;
	}

	int availableCredits = player->getCashCredits() + player->getBankCredits();

	if (availableCredits < betValue) {
		player->sendSystemMessage("@gambling/default_interface:bet_failed"); // The system was unable to process your bet.
		return;
	}

	if (betValue <= player->getCashCredits()) {
		player->subtractCashCredits(betValue);
	} else {
		betValue -= player->getCashCredits();
		player->subtractCashCredits(player->getCashCredits());
		player->subtractBankCredits(betValue);
	}

	bankValue += betValue;

	setBankValue(terminalID, bankValue);

	if (bankValue < maxBet) {
		sendSlotsSUI(player, terminal);
	} else {

	}
}

int GamblingManagerImplementation::getRandomSlotRoll() {
	if (slotWeights.size() == 0)
		return 0;

	return slotWeights.get(System::random(slotWeights.size() - 1));
}
