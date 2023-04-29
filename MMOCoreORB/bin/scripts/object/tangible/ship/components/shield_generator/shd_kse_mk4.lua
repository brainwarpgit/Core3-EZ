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


object_tangible_ship_components_shield_generator_shd_kse_mk4 = object_tangible_ship_components_shield_generator_shared_shd_kse_mk4:new {
	templateType = SHIPCOMPONENT,

	componentDataName = "shd_kse_mk4",

	attributes = {
		{"shieldRechargeRate", 8.037},
		{"shieldHitpointsMaximumFront", 1190.25},
		{"shieldHitpointsMaximumBack", 1190.25},
		{"currentHitpoints", 793.5},
		{"maximumHitpoints", 793.5},
		{"maximumArmorHitpoints", 396.75},
		{"currentArmorHitpoints", 396.75},
		{"efficiency", 1},
		{"energyMaintenance", 2806},
		{"mass", 13219.2},
		{"reverseEngineeringLevel", 6},
	},

	modifiers = {
		{"shieldRechargeRate", 0.26},
		{"shieldHitpointsMaximumFront", 0.2},
		{"shieldHitpointsMaximumBack", 0.2},
		{"maximumArmorHitpoints", 0.05},
		{"energyMaintenance", 0.3},
		{"mass", 0.2},
	},
}

ObjectTemplates:addTemplate(object_tangible_ship_components_shield_generator_shd_kse_mk4, "object/tangible/ship/components/shield_generator/shd_kse_mk4.iff")
