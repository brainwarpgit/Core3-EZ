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


object_ship_tieoppressor_tier3 = object_ship_shared_tieoppressor_tier3:new {

	name = "tieoppressor_tier3",
	slideFactor = 1.72,
	chassisHitpoints = 1320,
	chassisMass = 5000,
	reactor = { name = "rct_generic", hitpoints = 1132.012, armor = 1156.509,},
	engine = { name = "eng_novaldex_eventhorizon", hitpoints = 1173.833, armor = 1155.167, speed = 42.44903, pitch = 23.7508, roll = 29.18484, yaw = 19.00352, acceleration = 10.7266, rollRate = 54.80518, pitchRate = 46.71277, deceleration = 8.896254, yawRate = 40.20301,},
	shield_0 = { name = "shd_generic", hitpoints = 1132.095, armor = 1130.739, regen = 9.891961, front = 4598.102, back = 4696.745,},
	armor_0 = { name = "arm_generic", hitpoints = 2413.045, armor = 2475.83,},
	armor_1 = { name = "arm_generic", hitpoints = 2503.243, armor = 2480.937,},
	capacitor = { name = "cap_generic", hitpoints = 1134.019, armor = 1144.884, rechargeRate = 99.67863, energy = 4887.025,},
	weapon_0 = { name = "wpn_tieadvanced_blaster", hitpoints = 1173.488, armor = 1184.897, rate = 0.778621, drain = 0.9866201, maxDamage = 156.4046, shieldEfficiency = 0.5489613, minDamage = 108.2981, ammo = 0, ammo_type = 0, armorEfficiency = 0.5325525,},
	weapon_1 = { name = "wpn_seinar_concussion_missile_s01", hitpoints = 1165.158, armor = 1181.345, rate = 2.996833, drain = 0.9603926, maxDamage = 479.1803, shieldEfficiency = 0.7364053, minDamage = 215.2337, ammo = 4, ammo_type = 18, armorEfficiency = 0.7142278,},
}

ObjectTemplates:addTemplate(object_ship_tieoppressor_tier3, "object/ship/tieoppressor_tier3.iff")