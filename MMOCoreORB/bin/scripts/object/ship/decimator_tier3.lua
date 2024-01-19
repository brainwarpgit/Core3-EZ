--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 


object_ship_decimator_tier3 = object_ship_shared_decimator_tier3:new {
	objectName = "@space/space_mobile_type:decimator_tier3",

	name = "decimator_tier3",
	type = "decimator_tier3",
	faction = "imperial",
	difficulty = "tier3",

	slideFactor = 1.69,
	chassisHitpoints = 2400,
	chassisMass = 5000,

	gameObjectType = 536870919,

	pvpStatusBitmask = ATTACKABLE,
	shipBitmask = NONE,
	optionsBitmask = AIENABLED,

	customShipAiMap = "",

	reactor = {name = "rct_generic", hitpoints = 2160, armor = 2160},
	engine = {name = "eng_incom_fusialthrust", hitpoints = 2160, armor = 2160, speed = 44.56, acceleration = 10.82, deceleration = 9.23, yaw = 19.41, yawRate = 40.74, pitch = 24.51, pitchRate = 49.01, roll = 30.34, rollRate = 55.27},
	shield_0 = {name = "shd_generic", hitpoints = 2160, armor = 2160, front = 8640, back = 8640, regen = 18.47},
	armor_0 = {name = "arm_generic", hitpoints = 4608, armor = 4608},
	armor_1 = {name = "arm_generic", hitpoints = 4608, armor = 4608},
	capacitor = {name = "cap_generic", hitpoints = 2160, armor = 2160, energy = 5000, rechargeRate = 100},
	weapon_0 = {name = "wpn_tieadvanced_blaster", hitpoints = 2160, armor = 2160, rate = 0.78, drain = 1, maxDamage = 325.25, minDamage = 222.26, shieldEfficiency = 0.56, armorEfficiency = 0.56, ammo = 0, ammo_type = 0},
	weapon_1 = {name = "wpn_tieadvanced_blaster", hitpoints = 2160, armor = 2160, rate = 0.78, drain = 1, maxDamage = 325.25, minDamage = 222.26, shieldEfficiency = 0.56, armorEfficiency = 0.56, ammo = 0, ammo_type = 0},
	weapon_2 = {name = "wpn_seinar_concussion_missile_s01", hitpoints = 2160, armor = 2160, rate = 3, drain = 1, maxDamage = 975.75, minDamage = 444.52, shieldEfficiency = 0.75, armorEfficiency = 0.75, ammo = 4, ammo_type = 18},
}

ObjectTemplates:addTemplate(object_ship_decimator_tier3, "object/ship/decimator_tier3.iff")
