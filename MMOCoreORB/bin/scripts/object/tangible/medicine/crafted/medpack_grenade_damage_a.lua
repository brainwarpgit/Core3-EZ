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


object_tangible_medicine_crafted_medpack_grenade_damage_a = object_tangible_medicine_crafted_shared_medpack_grenade_damage_a:new {
	gameObjectType = 8237,
	templateType = RANGEDSTIMPACK,
	useCount = 25,
	medicineUse = 5,
	rangeMod = 1,
	area = 0,
	range = 15,
	effectiveness = 300,
	medicineClass = STIM_A,
	attributes = {0, 3},

	numberExperimentalProperties = {1, 1, 2, 2, 2, 2, 1},
	experimentalProperties = {"XX", "XX", "OQ", "PE", "OQ", "UT", "OQ", "PE", "CD", "OQ", "XX"},
	experimentalWeights = {1, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1},
	experimentalGroupTitles = {"null", "null", "exp_effectiveness", "exp_charges", "expEaseOfUse", "exp_charges", "null"},
	experimentalSubGroupTitles = {"null", "null", "power", "charges", "skillmodmin", "range", "hitpoints"},
	experimentalMin = {0, 0, 75, 10, 5, 15, 1000},
	experimentalMax = {0, 0, 150, 20, 1, 20, 1000},
	experimentalPrecision = {0, 0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 1, 1, 1, 4},
}

ObjectTemplates:addTemplate(object_tangible_medicine_crafted_medpack_grenade_damage_a, "object/tangible/medicine/crafted/medpack_grenade_damage_a.iff")
