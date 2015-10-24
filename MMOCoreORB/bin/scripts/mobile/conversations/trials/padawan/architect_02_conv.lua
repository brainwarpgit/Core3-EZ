trialsPadawanArchitect02ConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "trialsPadawanArchitect02ConvoHandler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "@conversation/padawan_architect_02:s_c8e2f57a", -- Yesa, howsa can wesa helps you?
	stopConversation = "false",
	options = {
		{"@conversation/padawan_architect_02:s_17f3f71f", "proclaim_greet"} -- You are trespassing on my client's land.
	}
}
trialsPadawanArchitect02ConvoTemplate:addScreen(intro);

proclaim_greet = ConvoScreen:new {
	id = "proclaim_greet",
	leftDialog = "@conversation/padawan_architect_02:s_a7079eee", -- Trespassing? Wesa lived here for evers. Yousa are the ones trespassing.
	stopConversation = "false",
	options = {
		{"@conversation/padawan_architect_02:s_55ff5c74", "investigate_success"}, -- If that is true, why was this land up for sale?
		{"@conversation/padawan_architect_02:s_7280c4d8", "initiate_attack_fail"} -- I don't care anything about all that. You must leave or else.
	}
}
trialsPadawanArchitect02ConvoTemplate:addScreen(proclaim_greet);

investigate_success = ConvoScreen:new {
	id = "investigate_success",
	leftDialog = "@conversation/padawan_architect_02:s_d7cc9593", -- Wesa don't know anythings abouts no sales. Yousa needs to be moving off our lands now though, yousa starting to upset me. Tell yousa client this land has and always willsa be ours.
	stopConversation = "false",
	options = {
		{"@conversation/padawan_architect_02:s_5e71d8b7"} -- I will do just that. I apologize for intruding and upsetting you.
	}
}
trialsPadawanArchitect02ConvoTemplate:addScreen(investigate_success);

initiate_attack_fail = ConvoScreen:new {
	id = "initiate_attack_fail",
	leftDialog = "@conversation/padawan_architect_02:s_56dcc3ba", -- Wesa sees whosa going to be leavings.
	stopConversation = "true",
	options = {}
}
trialsPadawanArchitect02ConvoTemplate:addScreen(initiate_attack_fail);

noquest_player_talk = ConvoScreen:new {
	id = "noquest_player_talk",
	leftDialog = "@conversation/padawan_architect_02:s_26b9a00f", -- Mesa no have speaksa to yousa.
	stopConversation = "true",
	options = {}
}
trialsPadawanArchitect02ConvoTemplate:addScreen(noquest_player_talk);

addConversationTemplate("trialsPadawanArchitect02ConvoTemplate", trialsPadawanArchitect02ConvoTemplate);
