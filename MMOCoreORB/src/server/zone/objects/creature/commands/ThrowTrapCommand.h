/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef THROWTRAPCOMMAND_H_
#define THROWTRAPCOMMAND_H_

#include "server/zone/objects/creature/events/ThrowTrapTask.h"
#include "templates/tangible/TrapTemplate.h"

class ThrowTrapCommand: public CombatQueueCommand {
public:

	ThrowTrapCommand(const String& name, ZoneProcessServer* server) :
		CombatQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target,
			const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		int skillLevel = creature->getSkillMod("trapping");
		if (skillLevel < 1 || !creature->hasSkill("outdoors_scout_novice")) {
			creature->sendSystemMessage("@trap/trap:trap_no_skill");
			return GENERALERROR;
		}

		StringTokenizer tokenizer(arguments.toString());

		if (!tokenizer.hasMoreTokens())
			return INVALIDPARAMETERS;

		try {

			uint64 trapId = tokenizer.getLongToken();
			ManagedReference<TangibleObject*> trap =
					server->getZoneServer()->getObject(trapId).castTo<TangibleObject*>();

			if (trap == nullptr)
				return INVALIDPARAMETERS;

			if (!trap->isTrapObject())
				return INVALIDPARAMETERS;

			if (!trap->isASubChildOf(creature))
				return GENERALERROR;

			ManagedReference<CreatureObject*> targetCreature =
					server->getZoneServer()->getObject(target).castTo<CreatureObject*>();

			if (targetCreature == nullptr || !targetCreature->isCreature()) {
				creature->sendSystemMessage("@trap/trap:sys_creatures_only");
				return GENERALERROR;
			}

			if (!targetCreature->isAttackableBy(creature) || targetCreature->isPet()) {
				creature->sendSystemMessage("@trap/trap:sys_no_pets");
				return GENERALERROR;
			}

			SharedObjectTemplate* templateData =
					TemplateManager::instance()->getTemplate(
							trap->getServerObjectCRC());
			if (templateData == nullptr) {
				error("No template for: " + String::valueOf(trap->getServerObjectCRC()));
				return GENERALERROR;
			}

			TrapTemplate* trapData = cast<TrapTemplate*> (templateData);
			if (trapData == nullptr) {
				error("No TrapTemplate for: " + String::valueOf(trap->getServerObjectCRC()));
				return GENERALERROR;
			}

			/// Check Range
			if(!checkDistance(creature, targetCreature, trapData->getMaxRange()))
			{
				StringIdChatParameter tooFar("cmd_err", "target_range_prose");
				tooFar.setTO("Throw Trap");

				creature->sendSystemMessage(tooFar);
				return GENERALERROR;
			}

			int effectType = 0;

			// No skill Check
			int trappingSkill = creature->getSkillMod("trapping");
			if(trappingSkill < 1) {
				creature->sendSystemMessage("@trap/trap:trap_no_skill");
				return GENERALERROR;
			}

			/// Skill too low check
			if(trappingSkill < trapData->getSkillRequired()) {
				creature->sendSystemMessage("@trap/trap:trap_no_skill_this");
				return GENERALERROR;
			}

			int targetDefense = targetCreature->getSkillMod(trapData->getDefenseMod());
			const Time* cooldown = creature->getCooldownTime("throwtrap");
			if((cooldown != nullptr && !cooldown->isPast()) ||
					creature->getPendingTask("throwtrap") != nullptr) {
				creature->sendSystemMessage("@trap/trap:sys_not_ready");
				return GENERALERROR;
			}

			int attackRoll = System::random(199) + 1;
			int defendRoll = System::random(199) + 1;

			float hitChance = CombatManager::instance()->hitChanceEquation(trappingSkill + attackRoll, targetDefense + defendRoll);

			if (hitChance > 100)
				hitChance = 100.0;
			else if (hitChance < 0)
				hitChance = 0;

			int roll = System::random(100);
			uint64 state = trapData->getState();
			bool hit = roll < hitChance && (state == 0 || (state != 0 && !targetCreature->hasState(state)));

			String animation = trapData->getAnimation();
			uint32 crc = String(animation).hashCode();
			CombatAction* action = new CombatAction(creature, targetCreature, crc, hit, 0L);
			creature->broadcastMessage(action, true);
			creature->addCooldown("throwtrap", 1500);

			Locker clocker(trap, creature);

			trap->decreaseUseCount();

			StringIdChatParameter message;
			ManagedReference<Buff*> buff = nullptr;
			int damage = 0;

			if (hit) {

				message.setStringId("trap/trap" , trapData->getSuccessMessage());

				buff = new Buff(targetCreature, crc, trapData->getDuration(), BuffType::STATE);

				Locker locker(buff);

				if(state != 0)
					buff->addState(state);

				const auto skillMods = trapData->getSkillMods();
				for(int i = 0; i < skillMods->size(); ++i) {
					buff->setSkillModifier(skillMods->elementAt(i).getKey(), skillMods->get(i));
				}

				String startSpam = trapData->getStartSpam();
				if(!startSpam.isEmpty())
					buff->setStartFlyText("trap/trap", startSpam,  0, 0xFF, 0);

				String stopSpam = trapData->getStopSpam();
				if(!stopSpam.isEmpty())
					buff->setEndFlyText("trap/trap", stopSpam,  0xFF, 0, 0);

				damage = System::random(trapData->getMaxDamage() - trapData->getMinDamage()) + trapData->getMinDamage();

			} else {
				if(!trapData->getFailMessage().isEmpty()) {
					message.setStringId("trap/trap" , trapData->getFailMessage());
				}
			}

			message.setTT(targetCreature->getDisplayedName());


			Reference<ThrowTrapTask*> trapTask = new ThrowTrapTask(creature, targetCreature, buff, message, trapData->getPoolToDamage(), damage, hit);
			creature->addPendingTask("throwtrap", trapTask, 2300);

			//Reduce cost based upon player's strength, quickness, and focus if any are over 300
			int healthCost = creature->calculateCostAdjustment(CreatureAttribute::STRENGTH, trapData->getHealthCost());
			int actionCost = creature->calculateCostAdjustment(CreatureAttribute::QUICKNESS, trapData->getActionCost());
			int mindCost = creature->calculateCostAdjustment(CreatureAttribute::FOCUS, trapData->getMindCost());

			creature->inflictDamage(creature, CreatureAttribute::HEALTH, healthCost, false);
			creature->inflictDamage(creature, CreatureAttribute::ACTION, actionCost, false);
			creature->inflictDamage(creature, CreatureAttribute::MIND, mindCost, false);

			return SUCCESS;

		} catch (Exception& e) {

		}

		return GENERALERROR;
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return defaultTime;
	}

};

#endif //THROWTRAPCOMMAND_H_
