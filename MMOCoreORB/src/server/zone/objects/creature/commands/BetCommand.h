/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef BETCOMMAND_H_
#define BETCOMMAND_H_

#include "server/zone/managers/minigames/gambling/GamblingManager.h"
#include "server/zone/objects/creature/CreatureObject.h"

class BetCommand : public QueueCommand {
public:

	BetCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* player, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(player))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(player))
			return INVALIDLOCOMOTION;
/*
		GamblingManager* gamblingManager = server->getGamblingManager();


		Reference<GamblingTerminal*> terminal = server->getZoneServer()->getObject(target, true).castTo<GamblingTerminal*>();

		if (terminal == nullptr)
			return GENERALERROR;

		if (!terminal->isAcceptingBets()) {
			player->sendSystemMessage("The table is not currently accepting bets!");
			return GENERALERROR;
		}

			if (!gamblingManager->isPlaying(player) || !gamblingManager->bettingAllowed(player)) {
			player->sendSystemMessage("You cannot bet on a table you have not joined!");
			return GENERALERROR;
		}

		if(!checkDistance(player, terminal, 15)) {
			player->sendSystemMessage("@gambling/default_interface:bet_failed_distance"); // You are too far from the game station to complete the bet.
			return TOOFAR;
		}

		StringTokenizer args(arguments.toString());
		int amount = 0;
		String bet = "";

		if (args.hasMoreTokens()) {
			amount = args.getIntToken();
		}

		if (args.hasMoreTokens()) {
			args.getStringToken(bet);
			bet.toLowerCase();
		}

		if (amount <= 0) {
			player->sendSystemMessage("@gambling/default_interface:bet_failed_amt"); // You have entered an invalid amount. Please try again.
			return GENERALERROR;
		}

		gamblingManager->handleBet(player, terminal, amount, bet);*/

		return SUCCESS;
	}

};

#endif //BETCOMMAND_H_
