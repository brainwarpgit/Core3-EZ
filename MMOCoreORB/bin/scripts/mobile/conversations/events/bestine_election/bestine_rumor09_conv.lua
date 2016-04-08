bestineRumor09ConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "bestine_rumor_conv_handler",
	screens = {}
}

election_started = ConvoScreen:new {
	id = "election_started",
	leftDialog = "@conversation/bestine_rumor09:s_44776715", --I'm an artist and will definitely vote for Sean Trenwell. I hear he's personally funding the museum so they can hold frequent contests! I really hope one of my paintings will be on display at the museum. I'm definitely going to win! You need to vote as well. Please talk with the governor at the capitol for more information.
	stopConversation = "true",
	options = {}
}

bestineRumor09ConvoTemplate:addScreen(election_started);

election_ended = ConvoScreen:new {
	id = "election_ended",
	leftDialog = "@conversation/bestine_rumor09:s_3415564", --I visit the museum every day. I'm hoping that one of my paintings will be on display there. Others could then purchase copies of my painting and hang them up in their houses. How exciting! I have to practice...
	stopConversation = "true",
	options = {}
}

bestineRumor09ConvoTemplate:addScreen(election_ended);

addConversationTemplate("bestineRumor09ConvoTemplate", bestineRumor09ConvoTemplate);
