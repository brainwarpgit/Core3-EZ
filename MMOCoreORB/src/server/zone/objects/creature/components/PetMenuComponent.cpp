
#include "PetMenuComponent.h"
#include "server/zone/objects/creature/AiAgent.h"
#include "server/zone/objects/creature/DroidObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/scene/components/ObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/intangible/PetControlDevice.h"
#include "server/zone/objects/group/GroupObject.h"
#include "server/zone/managers/creature/PetManager.h"
#include "server/zone/objects/intangible/tasks/PetControlDeviceStoreObjectTask.h"

void PetMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) {
	if (!sceneObject->isPet())
		return;

	AiAgent* pet = cast<AiAgent*>(sceneObject);

	if (pet->getGroup() != NULL) {
		ManagedReference<GroupObject*> group = player->getGroup();

		if (group == pet->getGroup()) {
			if (group->getLeader() == player) {
				menuResponse->addRadialMenuItem(40, 3, "@ui_radial:group_kick"); // Kick from Group
				menuResponse->addRadialMenuItemToRadialID(40, 41, 3, "@ui_radial:group_disband" ); // Disband Group
			} else {
				menuResponse->addRadialMenuItem(39, 3, "@ui_radial:group_leave"); // Leave Group
			}

		}
	}

	if (pet->isIncapacitated() && pet->isAttackableBy(player))
		menuResponse->addRadialMenuItem(6, 3, "@ui_radial:combat_death_blow"); // Death Blow

	if (!player->getPlayerObject()->isPrivileged() && pet->getLinkedCreature() != player) {
		return;
	}

	menuResponse->addRadialMenuItem(59, 3, "@pet/pet_menu:menu_store"); // Store

	if (pet->getLinkedCreature() != player)
		return;

	ManagedReference<PetControlDevice*> controlDevice = pet->getControlDevice().get().castTo<PetControlDevice*>();
	if( controlDevice == NULL )
		return;

	PetManager* petManager = pet->getZoneServer()->getPetManager();
	if (petManager == NULL)
		return;

	// DROIDS
	if( controlDevice->getPetType() == PetManager::DROIDPET ){
		ManagedReference<DroidObject*> droidObject = dynamic_cast<DroidObject*>(controlDevice->getControlledObject());

		menuResponse->addRadialMenuItem(132, 3, "@pet/pet_menu:droid_options"); // SERVER_ITEM_OPTIONS
		menuResponse->addRadialMenuItemToRadialID(132, 234, 3, "@pet/pet_menu:menu_recharge" ); // PET_FEED
		menuResponse->addRadialMenuItem(141, 3, "@pet/pet_menu:menu_command_droid"); // PET_COMMAND
		menuResponse->addRadialMenuItemToRadialID(141, 142, 3, "@pet/pet_menu:menu_follow" ); // PET_FOLLOW
		menuResponse->addRadialMenuItemToRadialID(141, 143, 3, "@pet/pet_menu:menu_stay" ); // PET_STAY
		if (droidObject != NULL && droidObject->isCombatDroid())
			menuResponse->addRadialMenuItemToRadialID(141, 144, 3, "@pet/pet_menu:menu_guard" ); // PET_GUARD
		menuResponse->addRadialMenuItemToRadialID(141, 145, 3, "@pet/pet_menu:menu_friend" ); // PET_FRIEND
		if (droidObject != NULL && droidObject->isCombatDroid())
			menuResponse->addRadialMenuItemToRadialID(141, 146, 3, "@pet/pet_menu:menu_attack" ); // PET_ATTACK
		menuResponse->addRadialMenuItemToRadialID(141, 147, 3, "@pet/pet_menu:menu_patrol" ); // PET_PATROL
		menuResponse->addRadialMenuItemToRadialID(141, 148, 3, "@pet/pet_menu:menu_get_patrol_point" ); // PET_GET_PATROL_POINT
		menuResponse->addRadialMenuItemToRadialID(141, 149, 3, "@pet/pet_menu:menu_clear_patrol_points" ); // PET_CLEAR_PATROL_POINTS
		menuResponse->addRadialMenuItemToRadialID(141, 150, 3, "@pet/pet_menu:menu_assume_formation_1" ); // PET_ASSUME_FORMATION_1
		menuResponse->addRadialMenuItemToRadialID(141, 151, 3, "@pet/pet_menu:menu_assume_formation_2" ); // PET_ASSUME_FORMATION_2
		menuResponse->addRadialMenuItemToRadialID(141, 158, 3, "@pet/pet_menu:menu_group" ); // PET_GROUP
		if (droidObject != NULL && droidObject->isCombatDroid())
			menuResponse->addRadialMenuItemToRadialID(141, 163, 3, "@pet/pet_menu:menu_ranged_attack" );
		menuResponse->addRadialMenuItemToRadialID(141, 164, 3, "@pet/pet_menu:menu_store" );
		menuResponse->addRadialMenuItemToRadialID(141, 165, 3, "@pet/pet_menu:menu_follow_other" );

		if( droidObject != NULL && droidObject->isPowerDroid() ){
			menuResponse->addRadialMenuItemToRadialID(141, 235, 3, "@pet/pet_menu:menu_recharge_other" );
		}

		if( pet->isIncapacitated() ){
			menuResponse->addRadialMenuItem(166, 3, "@pet/pet_menu:awaken" );
		}

	}
	// FACTION
	else if( controlDevice->getPetType() == PetManager::FACTIONPET ){

		menuResponse->addRadialMenuItem(141, 3, "@pet/pet_menu:menu_command"); // PET_COMMAND
		menuResponse->addRadialMenuItemToRadialID(141, 142, 3, "@pet/pet_menu:menu_follow" ); // PET_FOLLOW
		menuResponse->addRadialMenuItemToRadialID(141, 143, 3, "@pet/pet_menu:menu_stay" ); // PET_STAY
		menuResponse->addRadialMenuItemToRadialID(141, 144, 3, "@pet/pet_menu:menu_guard" ); // PET_GUARD
		menuResponse->addRadialMenuItemToRadialID(141, 145, 3, "@pet/pet_menu:menu_friend" ); // PET_FRIEND
		menuResponse->addRadialMenuItemToRadialID(141, 146, 3, "@pet/pet_menu:menu_attack" ); // PET_ATTACK
		menuResponse->addRadialMenuItemToRadialID(141, 147, 3, "@pet/pet_menu:menu_patrol" ); // PET_PATROL
		menuResponse->addRadialMenuItemToRadialID(141, 148, 3, "@pet/pet_menu:menu_get_patrol_point" ); // PET_GET_PATROL_POINT
		menuResponse->addRadialMenuItemToRadialID(141, 149, 3, "@pet/pet_menu:menu_clear_patrol_points" ); // PET_CLEAR_PATROL_POINTS
		menuResponse->addRadialMenuItemToRadialID(141, 150, 3, "@pet/pet_menu:menu_assume_formation_1" ); // PET_ASSUME_FORMATION_1
		menuResponse->addRadialMenuItemToRadialID(141, 151, 3, "@pet/pet_menu:menu_assume_formation_2" ); // PET_ASSUME_FORMATION_2
		menuResponse->addRadialMenuItemToRadialID(141, 158, 3, "@pet/pet_menu:menu_group" ); // PET_GROUP
		menuResponse->addRadialMenuItemToRadialID(141, 163, 3, "@pet/pet_menu:menu_ranged_attack" );
		menuResponse->addRadialMenuItemToRadialID(141, 164, 3, "@pet/pet_menu:menu_store" );
		menuResponse->addRadialMenuItemToRadialID(141, 165, 3, "@pet/pet_menu:menu_follow_other" );

		if( pet->isIncapacitated() ){
			menuResponse->addRadialMenuItem(166, 3, "@pet/pet_menu:awaken" );
		}

	}
	// CREATURES
	else if( controlDevice->getPetType() == PetManager::CREATUREPET ){

		menuResponse->addRadialMenuItem(234, 3, "@pet/pet_menu:menu_feed" ); // PET_FEED

		menuResponse->addRadialMenuItem(141, 3, "@pet/pet_menu:menu_command"); // PET_COMMAND

		if( player->hasSkill( "outdoors_creaturehandler_novice" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 142, 3, "@pet/pet_menu:menu_follow" ); // PET_FOLLOW
			menuResponse->addRadialMenuItemToRadialID(141, 146, 3, "@pet/pet_menu:menu_attack" ); // PET_ATTACK
			menuResponse->addRadialMenuItemToRadialID(141, 164, 3, "@pet/pet_menu:menu_store" );
		}

		if( player->hasSkill( "outdoors_creaturehandler_training_01" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 143, 3, "@pet/pet_menu:menu_stay" ); // PET_STAY
		}

		if( player->hasSkill( "outdoors_creaturehandler_training_02" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 144, 3, "@pet/pet_menu:menu_guard" ); // PET_GUARD
		}

		if( player->hasSkill( "outdoors_creaturehandler_training_03" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 147, 3, "@pet/pet_menu:menu_patrol" ); // PET_PATROL
			menuResponse->addRadialMenuItemToRadialID(141, 148, 3, "@pet/pet_menu:menu_get_patrol_point" ); // PET_GET_PATROL_POINT
			menuResponse->addRadialMenuItemToRadialID(141, 149, 3, "@pet/pet_menu:menu_clear_patrol_points" ); // PET_CLEAR_PATROL_POINTS
		}

		if( player->hasSkill( "outdoors_creaturehandler_training_04" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 150, 3, "@pet/pet_menu:menu_assume_formation_1" ); // PET_ASSUME_FORMATION_1
			menuResponse->addRadialMenuItemToRadialID(141, 151, 3, "@pet/pet_menu:menu_assume_formation_2" ); // PET_ASSUME_FORMATION_2
		}

		if( player->hasSkill( "outdoors_creaturehandler_healing_01" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 154, 3, "@pet/pet_menu:menu_trick_1" ); // PET_TRICK_1
		}

		if( player->hasSkill( "outdoors_creaturehandler_healing_03" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 155, 3, "@pet/pet_menu:menu_trick_2" ); // PET_TRICK_2
		}

		if( player->hasSkill( "outdoors_creaturehandler_support_01" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 158, 3, "@pet/pet_menu:menu_group" ); // PET_GROUP
		}

		if( player->hasSkill( "outdoors_creaturehandler_support_02" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 165, 3, "@pet/pet_menu:menu_follow_other" );
		}

		if( player->hasSkill( "outdoors_creaturehandler_support_03" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 145, 3, "@pet/pet_menu:menu_friend" ); // PET_FRIEND
		}

		if( player->hasSkill( "outdoors_creaturehandler_taming_03" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 161, 3, "@pet/pet_menu:menu_specialattack_one" ); // PET_SPECIAL_ATTACK_ONE
		}

		if( player->hasSkill( "outdoors_creaturehandler_taming_04" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 162, 3, "@pet/pet_menu:menu_specialattack_two" ); // PET_SPECIAL_ATTACK_TWO
		}

		if( player->hasSkill( "outdoors_creaturehandler_master" ) ){
			menuResponse->addRadialMenuItemToRadialID(141, 163, 3, "@pet/pet_menu:menu_ranged_attack" );
			menuResponse->addRadialMenuItemToRadialID(141, 152, 3, "@pet/pet_menu:menu_transfer" ); // PET_TRANSFER
		}

		if( player->hasSkill( "outdoors_creaturehandler_support_04") && !controlDevice->isTrainedAsMount() && petManager->checkMountEligibility(controlDevice) == PetManager::CANBEMOUNTTRAINED){
			menuResponse->addRadialMenuItemToRadialID(141, 207, 3, "@pet/pet_menu:menu_train_mount" ); // Train Pet As A Mount
		}

		if( pet->isIncapacitated() ){
			menuResponse->addRadialMenuItem(166, 3, "@pet/pet_menu:awaken" );
		}

		if (controlDevice->isTrainedAsMount() && !pet->isDead() && !pet->isIncapacitated()) {
			Reference<SceneObject*> rider = pet->getSlottedObject("rider");

			if (rider == NULL) {
				menuResponse->addRadialMenuItem(205, 3, "@pet/pet_menu:menu_mount"); // Climb Aboard Pet
			} else {
				menuResponse->addRadialMenuItem(206, 3, "@pet/pet_menu:menu_dismount"); // Climb Off Of Pet
			}
		}

	}

}

int PetMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) {
	if (!sceneObject->isPet() || player == NULL)
		return 0;

	AiAgent* pet = cast<AiAgent*>(sceneObject);

	if (!player->getPlayerObject()->isPrivileged() && pet->getLinkedCreature() != player)
		return 0;

	Locker crossLocker(pet, player);

	ManagedReference<PetControlDevice*> petControlDevice = pet->getControlDevice().get().castTo<PetControlDevice*>();

	if (petControlDevice == NULL)
		return 0;

	PetManager* petManager = pet->getZoneServer()->getPetManager();
	if (petManager == NULL)
		return 0;

	// Store
	if (selectedID == 59) {
		if (pet->getLinkedCreature() != player) {
			ManagedReference<CreatureObject*> owner = pet->getLinkedCreature().get();
			if (owner != NULL) {
				Reference<PetControlDeviceStoreObjectTask*> task = new PetControlDeviceStoreObjectTask(petControlDevice, owner, true);
				task->execute();
			}
		} else {
			petControlDevice->storeObject(player);
		}
		return 0;
	}

	if (pet->getLinkedCreature() != player)
		return 0;

	switch(selectedID) {
	case 142: // Train Command: Follow
		if( player->hasSkill( "outdoors_creaturehandler_novice" ) )
			petControlDevice->setTrainingCommand( PetManager::FOLLOW );
		break;
	case 143: // Train Command: Stay
		if( player->hasSkill( "outdoors_creaturehandler_training_01" ) )
			petControlDevice->setTrainingCommand( PetManager::STAY );
		break;
	case 144: // Train Command: Guard
		if( player->hasSkill( "outdoors_creaturehandler_training_02" ) )
			petControlDevice->setTrainingCommand( PetManager::GUARD );
		break;
	case 145: // Train Command: Friend
		if( player->hasSkill( "outdoors_creaturehandler_support_03" ) )
			petControlDevice->setTrainingCommand( PetManager::FRIEND );
		break;
	case 146: // Train Command: Attack
		if( player->hasSkill( "outdoors_creaturehandler_novice" ) )
			petControlDevice->setTrainingCommand( PetManager::ATTACK );
		break;
	case 147: // Train Command: Patrol
		if( player->hasSkill( "outdoors_creaturehandler_training_03" ) )
			petControlDevice->setTrainingCommand( PetManager::PATROL );
		break;
	case 148: // Train Command: Get Patrol Point
		// TODO Handle setting patrol point
		if( player->hasSkill( "outdoors_creaturehandler_training_03" ) )
			player->sendSystemMessage("PET_GET_PATROL_POINT pet command is not yet implemented.");
		break;
	case 149: // Train Command: Clear Patrol Points
		// TODO Handle clearing patrol points
		if( player->hasSkill( "outdoors_creaturehandler_training_03" ) )
			player->sendSystemMessage("PET_CLEAR_PATROL_POINTS pet command is not yet implemented.");
		break;
	case 150: // Train Command: Wedge Formation
		if( player->hasSkill( "outdoors_creaturehandler_training_04" ) )
			petControlDevice->setTrainingCommand( PetManager::FORMATION1 );
		break;
	case 151: // Train Command: Column Formation
		if( player->hasSkill( "outdoors_creaturehandler_training_04" ) )
			petControlDevice->setTrainingCommand( PetManager::FORMATION2 );
		break;
	case 152: // Train Command: Transfer
		if( player->hasSkill( "outdoors_creaturehandler_master" ) )
			petControlDevice->setTrainingCommand( PetManager::TRANSFER );
		break;
	case 154: // Train Command: Trick 1
		if( player->hasSkill( "outdoors_creaturehandler_healing_01" ) )
			petControlDevice->setTrainingCommand( PetManager::TRICK1 );
		break;
	case 155: // Train Command: Trick 2
		if( player->hasSkill( "outdoors_creaturehandler_healing_03" ) )
			petControlDevice->setTrainingCommand( PetManager::TRICK2 );
		break;
	case 158: // Train Command: Group
		if( player->hasSkill( "outdoors_creaturehandler_support_01" ) )
			petControlDevice->setTrainingCommand( PetManager::GROUP );
		break;
	case 161: // Train Command: Special Attack 1
		if( player->hasSkill( "outdoors_creaturehandler_taming_03" ) )
			petControlDevice->setTrainingCommand( PetManager::SPECIAL_ATTACK1 );
		break;
	case 162: // Train Command: Special Attack 2
		if( player->hasSkill( "outdoors_creaturehandler_taming_04" ) )
			petControlDevice->setTrainingCommand( PetManager::SPECIAL_ATTACK2 );
		break;
	case 163: // Train Command: Ranged Attack
		if( player->hasSkill( "outdoors_creaturehandler_master" ) )
			petControlDevice->setTrainingCommand( PetManager::RANGED_ATTACK );
		break;
	case 164: // Train Command: Store
		if( player->hasSkill( "outdoors_creaturehandler_novice" ) )
			petControlDevice->setTrainingCommand( PetManager::STORE );
		break;
	case 165: // Train Command: Follow Other
		if( player->hasSkill( "outdoors_creaturehandler_support_02" ) )
			petControlDevice->setTrainingCommand( PetManager::FOLLOWOTHER );
		break;
	case 166: // Incapacitation Recovery
		petManager->enqueueOwnerOnlyPetCommand(player, pet, String("petRecover").toLowerCase().hashCode(), "");
		break;
	case 207: // Train Pet As A Mount
		petControlDevice->trainAsMount(player);
		break;
	case 234: // Recharge/Feed
		if (petControlDevice->getPetType() == PetManager::DROIDPET) {
			petManager->enqueueOwnerOnlyPetCommand(player, pet, String("petRecharge").toLowerCase().hashCode(), "");
		} else if (petControlDevice->getPetType() == PetManager::CREATUREPET) {
			petManager->enqueueOwnerOnlyPetCommand(player, pet, String("petFeed").toLowerCase().hashCode(), "");
		}
		break;
	case 235: // Train Command: Recharge Other
		petControlDevice->setTrainingCommand( PetManager::RECHARGEOTHER );
		break;
	default:
		break;
	}

	return 0;
}
