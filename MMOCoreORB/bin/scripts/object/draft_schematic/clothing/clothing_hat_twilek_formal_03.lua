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


object_draft_schematic_clothing_clothing_hat_twilek_formal_03 = object_draft_schematic_clothing_shared_clothing_hat_twilek_formal_03:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Twi\'lek Noble\'s Crest",

   craftingToolTab = 8, -- (See DraftSchemticImplementation.h)
   complexity = 25, 
   size = 2, 

   xpType = "crafting_clothing_general", 
   xp = 120, 

   assemblySkill = "clothing_assembly", 
   experimentingSkill = "clothing_experimentation", 
   customizationSkill = "clothing_customization", 

   customizationOptions = {2, 1},
   customizationStringNames = {"/private/index_color_1", "/private/index_color_2"},
   customizationDefaults = {32, 63},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"shell", "binding_and_weatherproofing", "liner", "green_diamond_crusting", "green_diamond_support"},
   ingredientSlotType = {1, 0, 1, 0, 0},
   resourceTypes = {"object/tangible/component/clothing/shared_synthetic_cloth.iff", "petrochem_inert", "object/tangible/component/clothing/shared_synthetic_cloth.iff", "crystalline_green_diamond", "armophous_plexite"},
   resourceQuantities = {3, 20, 3, 10, 10},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/hat/hat_twilek_s03.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_hat_twilek_formal_03, "object/draft_schematic/clothing/clothing_hat_twilek_formal_03.iff")
