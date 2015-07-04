local ExperienceConverter = require("screenplays.village.convos.convohelpers.experience_converter")
local ObjectManager = require("managers.object.object_manager")

fs_experience_converter_conv_handler = Object:new {}

function fs_experience_converter_conv_handler:getNextConversationScreen(pConversationTemplate, pConversingPlayer, selectedOption)
  local convosession = CreatureObject(pConversingPlayer):getConversationSession()

  local lastConversationScreen = nil

  if (convosession ~= nil) then
    local session = LuaConversationSession(convosession)
    lastConversationScreen = session:getLastConversationScreen()
  end

  local conversation = LuaConversationTemplate(pConversationTemplate)

  local nextConversationScreen

  if (lastConversationScreen ~= nil) then
    local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)

    --Get the linked screen for the selected option.
    local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)

    nextConversationScreen = conversation:getScreen(optionLink)

    if nextConversationScreen ~= nil then
      local nextLuaConversationScreen = LuaConversationScreen(nextConversationScreen)
    else
      nextConversationScreen = conversation:getScreen("init")
    end
  else
    nextConversationScreen = conversation:getScreen("init")
  end
  return nextConversationScreen
end

function fs_experience_converter_conv_handler:runScreenHandlers(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
  local screen = LuaConversationScreen(pConversationScreen)

  local screenID = screen:getScreenID()

  if screenID == "init" then
    pConversationScreen = fs_experience_converter_conv_handler.handleInit(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
  elseif screenID == "cs_jsPlumb_1_7" then
    local nextUnlockableBranches = ExperienceConverter:getNextUnlockableBranches(pConversingPlayer)

    pConversationScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(pConversationScreen)

    if (nextUnlockableBranches ~= nil) then
      local insertionStringFormatted = nextUnlockableBranches[1]
      for i = 2, table.getn(nextUnlockableBranches), 1 do
        insertionStringFormatted = insertionStringFormatted .. " , " .. nextUnlockableBranches[i]
      end
      clonedConversation:setDialogTextTO(insertionStringFormatted)
    elseif (nextUnlockableBranches == nil) then
      clonedConversation:setCustomDialogText("I sense you are unable to learn any new skills at this time.")
    end
  elseif screenID == "cs_jsPlumb_1_17" then -- Unlocking new branches.
    fs_experience_converter_conv_handler:chooseBranchToUnlock(pConversingPlayer)
  elseif screenID == "cs_jsPlumb_1_11" then -- Transferring Experience of first type.
    fs_experience_converter_conv_handler:chooseExperienceTypeForRatio(pConversingPlayer, 0)
  elseif screenID == "cs_jsPlumb_1_126" then -- Transferring Experience of second type.
    fs_experience_converter_conv_handler:chooseExperienceTypeForRatio(pConversingPlayer, 1)
  elseif screenID == "cs_jsPlumb_1_139" then -- Transferring Experience of third type.
    fs_experience_converter_conv_handler:chooseExperienceTypeForRatio(pConversingPlayer, 2)
  elseif screenID == "cs_jsPlumb_1_152" then -- Transferring Experience of fourth type.
    fs_experience_converter_conv_handler:chooseExperienceTypeForRatio(pConversingPlayer, 3)
  end
  return pConversationScreen
end

function fs_experience_converter_conv_handler:chooseBranchToUnlock(pCreature)
  if (pCreature == nil) then
    return
  end


  local suiManager = LuaSuiManager()
  local options = ExperienceConverter:getNextUnlockableBranches(pCreature)

  if (options == nil) then
    local player = LuaCreatureObject(pCreature)
    player:sendSystemMessage("@quest/force_sensitive/utils:no_available_branches")
    return
  end

  suiManager:sendListBox(pCreature, pCreature, "@quest/force_sensitive/utils:branch_select_title", "@quest/force_sensitive/utils:select_branch", 2, "@cancel", "", "@ok", "fs_experience_converter_conv_handler", "notifyBranchUnlocked", options)
end

function fs_experience_converter_conv_handler:notifyBranchUnlocked(pCreature, pSui, cancelPressed, arg0)
  if (pCreature == nil or cancelPressed) then
    return
  end

  local arguement = arg0 + 1
  local options = ExperienceConverter:getNextUnlockableBranches(pCreature)
  local tier4Selection = options[arguement]
  local branchTier4 = ExperienceConverter:getHighestBoxForTrainer(tier4Selection)


  ObjectManager.withCreatureObject(pCreature, function(creatureObject)
    ObjectManager.withPlayerObject(creatureObject:getPlayerObject(), function(playerObject)
      playerObject:setForceSensitiveUnlockedBranches(branchTier4)
    end)
    creatureObject:sendSystemMessageWithTO("@quest/force_sensitive/utils:branch_selected_unlock", tier4Selection)
  end)

  -- Remove the screenplay state for the tree they just trained...
  ExperienceConverter:removeScreenPlayState(pCreature, tier4Selection)
end

function fs_experience_converter_conv_handler:chooseExperienceTypeForRatio(pCreature, pExperienceType)
  if (pCreature == nil) then
    return
  end

  local options = ExperienceConverter:getExperienceForConversion(pCreature, pExperienceType)

  if (table.getn(options) <= 0) then
    CreatureObject(pCreature):sendSystemMessage("@quest/force_sensitive/utils:convert_not_enough_for_conversion")
    return
  end

  local experienceTypeFS = nil
  if (pExperienceType == 0) then
    experienceTypeFS = "Force-sensitive Combat"
  elseif (pExperienceType == 1) then
    experienceTypeFS = "Force-sensitive Crafting"
  elseif (pExperienceType == 2) then
    experienceTypeFS = "Force-sensitive Senses"
  elseif (pExperienceType == 3) then
    experienceTypeFS = "Force-sensitive Reflex"
  end

  -- Save the option.
  ObjectManager.withCreatureObject(pCreature, function(creatureObject)
    ExperienceConverter:setSuiTransferExperienceType(tonumber(pExperienceType), creatureObject:getObjectID())
  end)

  if (experienceTypeFS ~= nil) then
    local suiManager = LuaSuiManager()
    suiManager:sendListBox(pCreature, pCreature, "@quest/force_sensitive/utils:xp_transfer_prompt", "Select the Experience you wish to convert to: " .. experienceTypeFS, 2, "@cancel", "", "@ok", "fs_experience_converter_conv_handler", "notifyTransfer", options)
  end
end

function fs_experience_converter_conv_handler:notifyTransfer(pCreature, pSui, cancelPressed, arg0)
  if (pCreature == nil or cancelPressed) then
    return
  end

  local optionsName = ExperienceConverter:getExperienceForConversion(pCreature, ExperienceConverter:getSuiTransferExperienceType(CreatureObject(pCreature):getObjectID()))

  local optionsNameFrom = optionsName[arg0 + 1]

  local experienceTypeFS = nil

  local expTransferType = ExperienceConverter:getSuiTransferExperienceType(CreatureObject(pCreature):getObjectID())

  if (expTransferType == 0) then
    experienceTypeFS = "Force-sensitive Combat"
  elseif (expTransferType == 1) then
    experienceTypeFS = "Force-sensitive Crafting"
  elseif (expTransferType == 2) then
    experienceTypeFS = "Force-sensitive Senses"
  elseif (ExperienceConverter:getSuiTransferExperienceType(CreatureObject(pCreature):getObjectID()) == 3) then
    experienceTypeFS = "Force-sensitive Reflex"
  end

  if (experienceTypeFS ~= nil) then
    -- Save the choice...
    ExperienceConverter:setSuiTransferExperienceSelection(tonumber(arg0 + 1), CreatureObject(pCreature):getObjectID())

    local amount = ExperienceConverter:getExperienceAmount(pCreature, arg0 + 1)
    local ratio = ExperienceConverter:getExperienceRatio(pCreature, arg0 + 1)

    -- Add Options: 1 = string name, 2 = amount, 3 = ratio
    local optionsFrom = {optionsNameFrom, amount, ratio}
    local optionsTo = {experienceTypeFS, 0, 1}
    local suiManager = LuaSuiManager()
    suiManager:sendTransferBox(pCreature, pCreature, "@quest/force_sensitive/utils:xp_transfer_prompt", "How much of that Experience do you wish to convert to: " .. experienceTypeFS, "@ok", "fs_experience_converter_conv_handler", "transferExperiencePoints", optionsTo, optionsFrom)
  end
end

function fs_experience_converter_conv_handler:transferExperiencePoints(pCreature, pSui, cancelPressed, arg0, arg1)
  if (pCreature == nil or cancelPressed) then
    return
  end

  local experienceTypeFS = nil
  local expTransferType = ExperienceConverter:getSuiTransferExperienceType(CreatureObject(pCreature):getObjectID())

  if (expTransferType == 0) then
    experienceTypeFS = "Force-sensitive Combat"
  elseif (expTransferType == 1) then
    experienceTypeFS = "Force-sensitive Crafting"
  elseif (expTransferType == 2) then
    experienceTypeFS = "Force-sensitive Senses"
  elseif (expTransferType == 3) then
    experienceTypeFS = "Force-sensitive Reflex"
  end

  if (arg1 == "0") then
    CreatureObject(pCreature):sendSystemMessage("@quest/force_sensitive/utils:convert_allocate_more_xp")
    return
  end

  -- If they are capped, don't let them transfer any more xp.
  if (ExperienceConverter:getExperienceAmount(pCreature, ExperienceConverter:getSuiTransferExperienceType(CreatureObject(pCreature):getObjectID())) > 500000) then
    CreatureObject(pCreature):getObjectID():sendSystemMessage("@quest/force_sensitive/utils:convert_at_fs_skill_cap")
    return
  end



  if (experienceTypeFS ~= nil) then
    local experienceTypeFSFinal = "@exp_n:" .. experienceTypeFS
    ObjectManager.withCreatureAndPlayerObject(pCreature, function(creatureObject, playerObject)
      local optionsName = ExperienceConverter:getExperienceForConversion(pCreature, ExperienceConverter:getSuiTransferExperienceType(creatureObject:getObjectID()))
      local optionsChoice = tonumber(ExperienceConverter:getSuiTransferExperienceSelection(creatureObject:getObjectID()))
      ExperienceConverter:deleteSuiTransferExperienceSelection(creatureObject:getObjectID())
      ExperienceConverter:deleteSuiTransferExperienceType(creatureObject:getObjectID())
      local optionsNameFrom = tostring(optionsName[optionsChoice + 1])
      local optionsNameFromUnformatted = string.sub(optionsNameFrom, 8, string.len(optionsNameFrom))
      local messageString = LuaStringIdChatParameter("@quest/force_sensitive/utils:xp_convert_lose")
      messageString:setTO(optionsNameFrom)
      local messageString2 = LuaStringIdChatParameter("@quest/force_sensitive/utils:xp_convert_gain")
      messageString2:setTO(experienceTypeFSFinal)
      messageString2:setDI(tonumber(arg1))

      local amount = ExperienceConverter:getExperienceAmount(pCreature, optionsChoice)
      messageString:setDI(amount - tonumber(arg0))
      local subtraction = tonumber(arg0) - playerObject:getExperience(optionsNameFromUnformatted)
      creatureObject:awardExperience(optionsNameFromUnformatted, subtraction)
      creatureObject:awardExperience(experienceTypeFS, playerObject:getExperience(experienceTypeFS) + tonumber(arg1))

      creatureObject:sendSystemMessage(messageString:_getObject())
      creatureObject:sendSystemMessage(messageString2:_getObject())
    end)
  end
end

function fs_experience_converter_conv_handler.handleInit(pConversationTemplate, pConversingPlayer, pConversingNpc, selectedOption, pConversationScreen)
  local conversationTemplate = LuaConversationTemplate(pConversationTemplate)
  local nextScreen = nil

  -- Paemos - "beckon" animation.
  CreatureObject(pConversingNpc):doAnimation("beckon")

  -- See if they have a quest to unlock, or having XP to convert.
  if (ExperienceConverter.qualifiesForConversation(pConversingPlayer) == true) then
    nextScreen = "cs_jsPlumb_1_5"
  elseif ((ExperienceConverter.qualifiesForConversation(pConversingPlayer) == false) or nextScreen == nil) then
    nextScreen = "cs_jsPlumb_1_19"
  end

  return conversationTemplate:getScreen(nextScreen)
end
