bestineRumor04ConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "bestine_rumor_conv_handler",
	screens = {}
}
election_started = ConvoScreen:new {
	id = "election_started",
	leftDialog = "@conversation/bestine_rumor04:s_e4577019", -- NPC: Victor or Sean? Defense or Commerce? Oh! I didn't see you there. I'm trying to decide for whom I should vote in the upcoming election. The more votes, the better. I suggest you talk with the governor at the capitol for more information.
	stopConversation = "true",
	options = {}
}

bestineRumor04ConvoTemplate:addScreen(election_started);

election_ended = ConvoScreen:new {
	id = "election_ended",
	leftDialog = "@conversation/bestine_rumor04:s_156c9c13", -- NPC: I never really got around to voting. I'm too scared to even go out sometimes. The Sand People raids are really getting to me. I need to do some shopping... if you'll excuse me.
	stopConversation = "true",
	options = {}
}

bestineRumor04ConvoTemplate:addScreen(election_ended);


addConversationTemplate("bestineRumor04ConvoTemplate", bestineRumor04ConvoTemplate);
