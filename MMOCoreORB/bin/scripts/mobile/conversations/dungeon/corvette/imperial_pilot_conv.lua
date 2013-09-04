--Generated by SWGEmu Conversation Editor
ImperialPilotConversationTemplate = ConvoTemplate:new {
	initialScreen = "imperial_pilot_start",
	templateType = "Lua",
	luaClassHandler = "ImperialTravelConversationHandler",
	screens = {}
}
imperial_pilot_accept_mission = ConvoScreen:new {
	id = "imperial_pilot_accept_mission",
	leftDialog = "@conversation/corvette_imperial_pilot:s_500c4dc0",  --I think I heard about that one recently... some Rebel intel was discovered recently and word of it managed to cross my path. A Corellian CR-90 corvette, I believe. I think I can help you. Once on the corvette, you'll have a limited amount of time to complete your mission. Be sure to finish and escape in less than an hour.
	stopConversation = "false",
	options = {
		{"@conversation/corvette_imperial_pilot:s_62aa5014","imperial_pilot_board"},
		--Good, when can we go?
		{"@conversation/corvette_imperial_pilot:s_d553beb4","imperial_pilot_not_yet"}
		--I've changed my mind, and I'm leaving.
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_accept_mission);
imperial_pilot_explain_mission = ConvoScreen:new {
	id = "imperial_pilot_explain_mission",
	leftDialog = "@conversation/corvette_imperial_pilot:s_6cca850b", --Really. Where would you hear that, I wonder. Just out of curiosity, any particular blockade runner?
	stopConversation = "false",
	options = {
		{"@conversation/corvette_imperial_pilot:s_1ab00f5e","imperial_pilot_accept_mission"}
		--[Tell him about your mission]
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_explain_mission);
imperial_pilot_board = ConvoScreen:new {
	id = "imperial_pilot_board",
	leftDialog = "@conversation/corvette_imperial_pilot:s_fbc421e2", --Eager to go... good. Let's get things started. Let me see your authorization, and we'll go from there.
	stopConversation = "true",
	options = {
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_board);
imperial_pilot_start = ConvoScreen:new {
	id = "imperial_pilot_start",
	leftDialog = "@conversation/corvette_imperial_pilot:s_e1b151c2", --Greetings citizen. What brings you to this exclusive retreat at which you probably have no legitimate business?
	stopConversation = "false",
	options = {
		{"@conversation/corvette_imperial_pilot:s_1a71d76e","imperial_pilot_no_ticket"}
		--Um... nothing. Nevermind.
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_start);
imperial_pilot_no_ticket = ConvoScreen:new {
	id = "imperial_pilot_no_ticket",
	leftDialog = "@conversation/corvette_imperial_pilot:s_8bb955f8", --As you say, nothing.
	stopConversation = "true",
	options = {
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_no_ticket);
imperial_pilot_too_many = ConvoScreen:new {
	id = "imperial_pilot_too_many",
	leftDialog = "@conversation/corvette_imperial_pilot:s_37545a64", --I think I heard about that one recently... some Rebel intel was discovered recently and word of it managed to cross my path. A Corellian CR-90 corvette, I believe. I think I can help you, but the transportation I can provide only has room for 10 or less. You'll need to reduce your group size and then speak with me again.
	stopConversation = "true",
	options = {
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_too_many);
imperial_pilot_too_many_and_not_imperial = ConvoScreen:new {
	id = "imperial_pilot_too_many_and_not_imperial",
	leftDialog = "@conversation/corvette_imperial_pilot:s_4044790f", --Well, I'd like to help you, but the transportation I can provide only has room for 10 or less. In addition to that, I'm only authorized to transport those of Imperial standing. You'll need to adjust your group and then speak with me again.
	stopConversation = "true",
	options = {
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_too_many_and_not_imperial);
imperial_pilot_not_yet = ConvoScreen:new {
	id = "imperial_pilot_not_yet",
	leftDialog = "@conversation/corvette_imperial_pilot:s_b5aa0f29", --I suppose it's your choice. But failing to fulfill your mission won't reflect well when your service to the Empire is being considered.
	stopConversation = "true",
	options = {
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_not_yet);
imperial_pilot_not_imperial = ConvoScreen:new {
	id = "imperial_pilot_not_imperial",
	leftDialog = "@conversation/corvette_imperial_pilot:s_dd163c95", --Well, I'd like to help you, but I'm only authorized to transport those of Imperial standing. You'll need to adjust your group and then speak with me again.
	stopConversation = "true",
	options = {
	}
}
ImperialPilotConversationTemplate:addScreen(imperial_pilot_not_imperial);
addConversationTemplate("ImperialPilotConversationTemplate", ImperialPilotConversationTemplate);
