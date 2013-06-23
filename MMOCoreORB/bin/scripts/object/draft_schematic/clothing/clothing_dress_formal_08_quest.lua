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


object_draft_schematic_clothing_clothing_dress_formal_08_quest = object_draft_schematic_clothing_shared_clothing_dress_formal_08_quest:new {

  templateType = DRAFTSCHEMATIC,

   customObjectName = "Exquisite Dancer\'s Leotard",

   craftingToolTab = 8, -- (See DraftSchemticImplementation.h)
   complexity = 23, 
   size = 4, 

   xpType = "crafting_clothing_general", 
   xp = 330, 

   assemblySkill = "clothing_assembly", 
   experimentingSkill = "clothing_experimentation", 
   customizationSkill = "clothing_customization", 

   customizationOptions = {2},
   customizationStringNames = {"/private/index_color_1"},
   customizationDefaults = {31},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"trim_and_binding", "extra_trim", "jewelry_setting", "hardware", "skirt", "bodice", "sequins", "tiny_gemstones", "clothing_treatment_crystalline"},
   ingredientSlotType = {0, 1, 1, 0, 1, 1, 0, 0, 2},
   resourceTypes = {"hide", "object/tangible/component/clothing/shared_trim.iff", "object/tangible/component/clothing/shared_jewelry_setting.iff", "metal", "object/tangible/component/clothing/shared_synthetic_cloth.iff", "object/tangible/component/clothing/shared_synthetic_cloth.iff", "copper_mythra", "gemstone_armophous", "object/tangible/component/clothing/shared_clothing_treatment_crystalline.iff"},
   resourceQuantities = {60, 3, 2, 50, 3, 2, 20, 20, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/dress/dress_s08_quest.iff",

    additionalTemplates = {
             },
      
        skillMods = {
	    {"healing_dance_mind", 5},
	    {"healing_dance_shock", 5},
	    {"healing_dance_wound", 5},
	},
}

ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_dress_formal_08_quest, "object/draft_schematic/clothing/clothing_dress_formal_08_quest.iff")
