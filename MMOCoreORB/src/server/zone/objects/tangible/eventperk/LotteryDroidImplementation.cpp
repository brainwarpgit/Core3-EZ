#include "server/zone/objects/tangible/eventperk/LotteryDroid.h"
#include "server/chat/ChatManager.h"
#include "server/zone/Zone.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/templates/tangible/EventPerkDeedTemplate.h"
#include "server/zone/objects/tangible/tasks/RemoveEventPerkItemTask.h"
#include "server/zone/objects/tangible/tasks/LotteryDroidPulseTask.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/creature/sui/LotteryDroidSuiCallback.h"
#include "server/zone/objects/tangible/deed/eventperk/EventPerkDeed.h"
#include "server/zone/objects/tangible/components/EventPerkDataComponent.h"

void LotteryDroidImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	gameDurationChoices.add(1);
	gameDurationChoices.add(2);
	gameDurationChoices.add(4);
	gameDurationChoices.add(8);
	gameDurationChoices.add(24);
	gameDurationChoices.add(48);
	gameDurationChoices.add(72);
	gameDurationChoices.add(96);
	gameDurationChoices.add(120);
	gameDurationChoices.add(144);
	gameDurationChoices.add(168);

	// Payout percent increments of 5 from 100 to 50
	for (int i = 0; i <= 10; i++) {
		payoutPercentChoices.add(100 - (i * 5));
	}

	activateRemoveEvent();
}

void LotteryDroidImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	ManagedReference<CreatureObject*> perkOwner = getDeedOwner();

	if (perkOwner == NULL)
		return;

	if (gameStatus == 0 && perkOwner == player) {
		menuResponse->addRadialMenuItem(132, 3, "@event_perk:lottery_menu_setup"); // Lottery Setup
		menuResponse->addRadialMenuItem(133, 3, "@event_perk:lottery_menu_add_creds"); // Add Bonus Credits to Pot
		menuResponse->addRadialMenuItem(134, 3, "@event_perk:lottery_menu_instructions"); // Instructions

		if (gameDuration >= 1 && payoutPercent > .4 && ticketPrice > 1)
			menuResponse->addRadialMenuItem(135, 3, "@event_perk:lottery_menu_start_game"); // Start Lottery
	} else if (gameStatus == 1) {
		menuResponse->addRadialMenuItem(136, 3, "@event_perk:lottery_menu_lottery_info"); // Lottery Information
		menuResponse->addRadialMenuItem(137, 3, "@event_perk:lottery_menu_register"); // Register for Lottery

		if (perkOwner == player)
			menuResponse->addRadialMenuItem(133, 3, "@event_perk:lottery_menu_add_creds"); // Add Bonus Credits to Pot
	} else if (gameStatus == 2) {
		menuResponse->addRadialMenuItem(138, 3, "@event_perk:lottery_menu_show_winner"); // Display Lottery Results
	}
}


int LotteryDroidImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	ManagedReference<CreatureObject*> perkOwner = getDeedOwner();

	bool isOwner = perkOwner != NULL && player == perkOwner;


	if (selectedID == 132) { // Lottery Setup
		if (gameStatus == 1 || gameStatus == 2 || !isOwner)
			return 0;

		sendDurationSUI(player);
	} else if (selectedID == 133) { // Add Bonus Credits to Pot
		if (gameStatus == 2 || !isOwner)
			return 0;

		sendAddCreditsSUI(player);
	} else if (selectedID == 134) { // Instructions
		if (gameStatus == 1 || gameStatus == 2 || !isOwner)
			return 0;

		sendLotteryInstructionsSUI(player);
	} else if (selectedID == 135) {
		if (gameStatus == 1 || gameStatus == 2 || !isOwner)
			return 0;

		startLottery(player);
	} else if (selectedID == 136) {  // Lottery Information
		if (gameStatus == 2)
			return 0;

		sendLotteryInfoSUI(player);
	} else if (selectedID == 137) { // Register for Lottery
		if (gameStatus == 0 || gameStatus == 2)
			return 0;

		sendRegistrationSUI(player);
	} else if (selectedID == 138) { // Display Lottery Results
		if (gameStatus == 0 || gameStatus == 1)
			return 0;

		ManagedReference<CreatureObject*> winner = server->getZoneServer()->getObject(winnerID).castTo<CreatureObject*>();

		if (winner != NULL) {
			StringIdManager* sMan = StringIdManager::instance();

			String resultMsg = sMan->getStringId(String("@event_perk:lottery_complete_show_winner").hashCode()).toString() + " " + winner->getCustomObjectName().toString() + ".";
			player->sendSystemMessage(resultMsg);
		}
	}

	return 0;
}

void LotteryDroidImplementation::sendDurationSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	ManagedReference<SuiListBox*> listbox = new SuiListBox(player, SuiWindowType::LOTTERY_DURATION_SETUP);
	listbox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	listbox->setPromptTitle("@event_perk:lottery_dur_title"); // Select Duration
	listbox->setPromptText("@event_perk:lottery_dur_description"); // Select the length of time you would like the lottery to run. The timer will start when you begin the game. When the game ends, the payout will be distributed.
	listbox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	listbox->setForceCloseDistance(32.f);
	listbox->setCancelButton(true, "@cancel");

	for (int i = 0; i < gameDurationChoices.size(); i++) {
		int choice = gameDurationChoices.get(i);
		listbox->addMenuItem("@event_perk:lottery_dur_hours_" + String::valueOf(choice));
	}

	ghost->addSuiBox(listbox);
	player->sendMessage(listbox->generateMessage());
}

void LotteryDroidImplementation::sendPayoutSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	ManagedReference<SuiListBox*> listbox = new SuiListBox(player, SuiWindowType::LOTTERY_PAYOUT_SETUP);
	listbox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	listbox->setPromptTitle("@event_perk:lottery_payout_title"); // Select Payout Percentage
	listbox->setPromptText("@event_perk:lottery_payout_description"); // Select the percentage of the total pot you would like to payout to the winner of the lottery. After the game closes, your take of the pot will be automatically transferred to your bank account.
	listbox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	listbox->setForceCloseDistance(32.f);
	listbox->setCancelButton(true, "@cancel");

	for (int i = 0; i < payoutPercentChoices.size(); i++) {
		int choice = payoutPercentChoices.get(i);
		listbox->addMenuItem("@event_perk:lottery_payout_percent_" + String::valueOf(choice));
	}

	ghost->addSuiBox(listbox);
	player->sendMessage(listbox->generateMessage());
}

void LotteryDroidImplementation::sendTicketCostSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	ManagedReference<SuiInputBox*> inputbox = new SuiInputBox(player, SuiWindowType::LOTTERY_COST_SETUP);
	inputbox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	inputbox->setPromptTitle("@event_perk:ticket_cost_title"); // Set Entry Fee
	inputbox->setPromptText("@event_perk:ticket_cost_desc"); // Enter the amount you wish to charge per entry into the lottery. All credits recieved from lottery entries will be added to the pot.
	inputbox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	inputbox->setForceCloseDistance(32.f);
	inputbox->setCancelButton(true, "@cancel");

	ghost->addSuiBox(inputbox);
	player->sendMessage(inputbox->generateMessage());
}

void LotteryDroidImplementation::sendAddCreditsSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	ManagedReference<SuiInputBox*> inputbox = new SuiInputBox(player, SuiWindowType::LOTTERY_ADD_CREDITS);
	inputbox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	inputbox->setPromptTitle("@event_perk:lottery_add_credits_title"); // Add Credits to Pot
	inputbox->setPromptText("@event_perk:lottery_add_credits_desc"); // Enter how much money of your own money you would like to add to the pot. NOTE: Once credits are added to the pot you may NOT withdraw them under any circumstance. If you do not wish to add credits, click cancel.
	inputbox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	inputbox->setForceCloseDistance(32.f);
	inputbox->setCancelButton(true, "@cancel");

	ghost->addSuiBox(inputbox);
	player->sendMessage(inputbox->generateMessage());
}

void LotteryDroidImplementation::sendLotteryInstructionsSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	ManagedReference<SuiMessageBox*> msgBox = new SuiMessageBox(player, SuiWindowType::LOTTERY_INFO);
	msgBox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	msgBox->setPromptTitle("@event_perk:lottery_menu_instructions"); // Instructions
	msgBox->setPromptText("@event_perk:lottery_setup_instructions"); // Lottery Setup: First select how long contestants have to enter the lottery before the drawing. The lottery may run between 1 hour and 7 days. Next, select the percentage of the total pot the winner will recieve. When the lottery ends, you may collect the portion of the pot that is not paid out as the jackpot (your "take"). Finally, enter how many credits it will cost to register for the lottery. All proceeds from registration are added to the total pot. When you are happy with the settings, select "Start Lottery" to put the game in motion. You may sweeten the pot at any time by adding your own credits. Any credits added to the pot are non-refundable.
	msgBox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	msgBox->setForceCloseDistance(32.f);
	msgBox->setCancelButton(true, "@cancel");

	ghost->addSuiBox(msgBox);
	player->sendMessage(msgBox->generateMessage());
}

void LotteryDroidImplementation::sendRegistrationSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	if (isCurrentPlayer(player->getObjectID())) {
		player->sendSystemMessage("@event_perk:lottery_reg_purchase_already");
		return;
	} else if (player->getCashCredits() < ticketPrice) {
		player->sendSystemMessage("@event_perk:lottery_add_credits_nsf");
		return;
	}

	StringIdManager* sMan = StringIdManager::instance();

	String part1 = sMan->getStringId(String("@event_perk:lottery_reg_purchase_desc1").hashCode()).toString();
	String part2 = sMan->getStringId(String("@event_perk:lottery_reg_purchase_desc2").hashCode()).toString();
	String part3 = sMan->getStringId(String("@event_perk:lottery_reg_purchase_desc3").hashCode()).toString();

	String finalMsg = part1 + String::valueOf(ticketPrice) + part2 + String::valueOf(ticketPrice) + part3;

	ManagedReference<SuiMessageBox*> msgBox = new SuiMessageBox(player, SuiWindowType::LOTTERY_REGISTRATION);
	msgBox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	msgBox->setPromptText(finalMsg);
	msgBox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	msgBox->setForceCloseDistance(32.f);
	msgBox->setCancelButton(true, "@cancel");

	ghost->addSuiBox(msgBox);
	player->sendMessage(msgBox->generateMessage());
}

void LotteryDroidImplementation::sendLotteryInfoSUI(CreatureObject* player) {
	PlayerObject* ghost = player->getPlayerObject();

	if (ghost == NULL)
		return;

	int payout = creditPool * payoutPercent;

	uint64 timeLimit = gameDuration * 3600 * 1000;
	Time* startTime = getGameStartTime();

	Time currentTime;
	uint64 timeDelta = currentTime.getMiliTime() - startTime->getMiliTime();
	uint64 timeRemaining = timeLimit - timeDelta;

	StringIdManager* sMan = StringIdManager::instance();

	String parse1 = sMan->getStringId(String("@event_perk:lottery_info_parse1").hashCode()).toString();
	String parse2 = sMan->getStringId(String("@event_perk:lottery_info_parse2").hashCode()).toString();
	String parse3 = sMan->getStringId(String("@event_perk:lottery_info_parse3").hashCode()).toString();
	String parse4 = sMan->getStringId(String("@event_perk:lottery_info_parse4").hashCode()).toString();
	String parse5 = sMan->getStringId(String("@event_perk:lottery_info_parse5").hashCode()).toString();

	String finalString = parse1 + String::valueOf(getNumPlayers()) + parse2 + String::valueOf(payout) + parse3 + getTimeLeft(timeRemaining) + parse4 + String::valueOf(ticketPrice) + parse5;

	ManagedReference<SuiMessageBox*> msgBox = new SuiMessageBox(player, SuiWindowType::LOTTERY_INFO);
	msgBox->setCallback(new LotteryDroidSuiCallback(server->getZoneServer(), 0));
	msgBox->setPromptTitle("@event_perk:lottery_menu_lottery_info"); // Lottery Information
	msgBox->setPromptText(finalString);
	msgBox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	msgBox->setForceCloseDistance(32.f);
	msgBox->setCancelButton(true, "@cancel");

	ghost->addSuiBox(msgBox);
	player->sendMessage(msgBox->generateMessage());
}

void LotteryDroidImplementation::startLottery(CreatureObject* player) {
	if (gameStatus != 0 || gameDuration < 1 || payoutPercent <= .4 || ticketPrice < 1) {
		player->sendSystemMessage("@event_perk:lottery_initialize_error");
		return;
	}

	gameStatus = 1;
	gameStartTime.updateToCurrentTime();
	player->sendSystemMessage("@event_perk:lottery_initialize_success");
	activateGamePulse();
}

void LotteryDroidImplementation::activateGamePulse() {
	if (gamePulse == NULL) {
		gamePulse = new LotteryDroidPulseTask(_this.getReferenceUnsafeStaticCast());
		gamePulse->reschedule(5 * 60 * 1000); // 5 minute initial pulse
	} else {
		gamePulse->reschedule(5 * 60 * 1000);
	}
}

void LotteryDroidImplementation::endGame() {
	if (getNumPlayers() <= 0) {
		winnerID = -1;
	} else {
		int winnerNum = System::random(getNumPlayers() - 1);
		winnerID = playerList.get(winnerNum);

		int winnerPayout = creditPool * payoutPercent;
		int ownerPayout = creditPool - winnerPayout;

		ManagedReference<CreatureObject*> winner = server->getZoneServer()->getObject(winnerID).castTo<CreatureObject*>();

		if (winner != NULL) {
			winner->addBankCredits(winnerPayout, true);

			ChatManager* chatManager = server->getZoneServer()->getChatManager();

			StringIdChatParameter params("event_perk", "lottery_mail_winner_body");
			params.setDI(winnerPayout);

			chatManager->sendMail("@event_perk:pro_lottery_droid_game", "@event_perk:lottery_mail_winner_sub", params, winner->getFirstName(), NULL);
		}

		ManagedReference<CreatureObject*> perkOwner = getDeedOwner();

		if (perkOwner != NULL) {
			perkOwner->addBankCredits(ownerPayout, true);

			ChatManager* chatManager = server->getZoneServer()->getChatManager();

			StringIdChatParameter params("event_perk", "lottery_mail_owner_body");
			params.setDI(ownerPayout);

			chatManager->sendMail("@event_perk:pro_lottery_droid_game", "@event_perk:lottery_mail_owner_sub", params, perkOwner->getFirstName(), NULL);
		}
	}

	gameStatus = 2;
}

void LotteryDroidImplementation::activateRemoveEvent(bool immediate) {
	uint64 timeToLive = 15 * 24 * 60 * 60 * 1000;

	if (removeEventPerkItemTask == NULL) {
		removeEventPerkItemTask = new RemoveEventPerkItemTask(_this.getReferenceUnsafeStaticCast());

		Time currentTime;
		uint64 timeDelta = currentTime.getMiliTime() - purchaseTime.getMiliTime();

		if (timeDelta >= timeToLive || immediate) {
			removeEventPerkItemTask->execute();
		} else {
			removeEventPerkItemTask->schedule(timeToLive - timeDelta);
		}
	} else if (immediate) {
		if (removeEventPerkItemTask->isScheduled()) {
			removeEventPerkItemTask->reschedule(1);
		} else {
			removeEventPerkItemTask->execute();
		}
	}
}

CreatureObject* LotteryDroidImplementation::getDeedOwner() {
	EventPerkDataComponent* gameData = cast<EventPerkDataComponent*>(getDataObjectComponent()->get());

	if (gameData == NULL) {
		return NULL;
	}

	EventPerkDeed* deed = gameData->getDeed();

	if (deed == NULL) {
		return NULL;
	}

	ManagedReference<CreatureObject*> owner = deed->getOwner().get();

	return owner;
}

String LotteryDroidImplementation::getTimeLeft(int timeLeft) {

	float hours = timeLeft / (3600 * 1000);
	int minHours = 0;

	if (hours < 1)
		minHours = 1;
	else if (hours < 2)
		minHours = 2;
	else if (hours < 4)
		minHours = 4;
	else if (hours < 8)
		minHours = 8;
	else if (hours < 24)
		minHours = 24;
	else if (hours < 48)
		minHours = 48;
	else if (hours < 72)
		minHours = 72;
	else if (hours < 96)
		minHours = 96;
	else if (hours < 120)
		minHours = 120;
	else if (hours < 144)
		minHours = 144;

	StringIdManager* sMan = StringIdManager::instance();

	String finalStr = sMan->getStringId(String("@event_perk:lottery_dur_hours_" + String::valueOf(minHours)).hashCode()).toString();

	return finalStr;
}
