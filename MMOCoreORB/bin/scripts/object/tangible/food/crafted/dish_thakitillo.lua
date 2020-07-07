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


object_tangible_food_crafted_dish_thakitillo = object_tangible_food_crafted_shared_dish_thakitillo:new {
	templateType = CONSUMABLE,

	duration = 796,
	filling = 43,
	nutrition = 107,
	useCount = 99,

	effectType = 4,

	fillingMin = 47,
	fillingMax = 33,
	flavorMin = 540,
	flavorMax = 1080,
	nutritionMin = 30,
	nutritionMax = 50,
	quantityMin = 1,
	quantityMax = 3,

	modifiers = { "knockdown_defense", 0 },

	buffName = "food.dish_thakitillo",
	buffCRC = 0xDC5D4FD7,
	speciesRestriction = "",

	numberExperimentalProperties = {1, 1, 1, 2, 2, 2, 2},
	experimentalProperties = {"XX", "XX", "XX", "OQ", "PE", "DR", "FL", "DR", "PE", "DR", "OQ"},
	experimentalWeights = {1, 1, 1, 1, 2, 1, 2, 1, 3, 3, 1},
	experimentalGroupTitles = {"null", "null", "null", "exp_nutrition", "exp_flavor", "exp_quantity", "exp_filling"},
	experimentalSubGroupTitles = {"null", "null", "hitpoints", "nutrition", "flavor", "quantity", "filling"},
	experimentalMin = {0, 0, 1000, 75, 60, 60, 80},
	experimentalMax = {0, 0, 1000, 120, 120, 100, 120},
	experimentalPrecision = {0, 0, 0, 0, 10, 0, 0},
	experimentalCombineType = {0, 0, 4, 1, 1, 1, 1},
}

ObjectTemplates:addTemplate(object_tangible_food_crafted_dish_thakitillo, "object/tangible/food/crafted/dish_thakitillo.iff")
