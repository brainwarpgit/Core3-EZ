--Generated by SWGEmu Conversation Editor
RebelPilotConversationTemplate = ConvoTemplate:new {
	initialScreen = "rebel_pilot_start",
	templateType = "Normal",
	luaClassHandler = "",
	screens = {}
}
rebel_pilot_accept_mission = ConvoScreen:new {
	id = "rebel_pilot_accept_mission",
	leftDialog = "@conversation/corvette_rebel_pilot:s_500c4dc0",  --I think I heard about that one recently... some Rebel intel was discovered recently and word of it managed to cross my path. A Corellian CR-90 corvette, I believe. I think I can help you. Once on the corvette, you'll have a limited amount of time to complete your mission. Be sure to finish and escape in less than an hour.
	stopConversation = "false",
	options = {
		{"@conversation/corvette_rebel_pilot:s_62aa5014","rebel_pilot_board"},
		--Good, when can we go?
		{"@conversation/corvette_rebel_pilot:s_e851c3db","rebel_pilot_not_yet"}
		--I've changed my mind, and I think I'll be going.
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_accept_mission);
rebel_pilot_start = ConvoScreen:new {
	id = "rebel_pilot_start",
	leftDialog = "@conversation/corvette_rebel_pilot:s_669e781c", --I am so bored, they've kept me in here managing flight schedules for what feels like an eternity now. Please tell me you're here with my reassignment orders?
	stopConversation = "false",
	options = {
		{"@conversation/corvette_rebel_pilot:s_6e257495","rebel_pilot_no_ticket"}
		--No, I'm just passing through.
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_start);
rebel_pilot_no_ticket = ConvoScreen:new {
	id = "rebel_pilot_no_ticket",
	leftDialog = "@conversation/corvette_rebel_pilot:s_c1674c48", --Passing through? This is a military base. You should be more... oh, who am I kidding. Just try not to get into trouble, okay.
	stopConversation = "true",
	options = {
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_no_ticket);
rebel_pilot_explain_mission = ConvoScreen:new {
	id = "rebel_pilot_explain_mission",
	leftDialog = "@conversation/corvette_rebel_pilot:s_e2aa2143", --Oh, there's lots of things I could help you with. And possibly even something like that. What's your story?
	stopConversation = "false",
	options = {
		{"@conversation/corvette_rebel_pilot:s_1ab00f5e","rebel_pilot_accept_mission"}
		--[Tell him about your mission]
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_explain_mission);
rebel_pilot_board = ConvoScreen:new {
	id = "rebel_pilot_board",
	leftDialog = "@conversation/corvette_rebel_pilot:s_52a4b87d", --Eager to go... I like that. Let's get things rolling. First I'll need to see your authorization form...
	stopConversation = "true",
	options = {
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_board);
rebel_pilot_not_yet = ConvoScreen:new {
	id = "rebel_pilot_not_yet",
	leftDialog = "@conversation/corvette_rebel_pilot:s_35e19d9c", --What? But this is... oh, I get it. Need to stock up on supplies or something like that. I understand. I'll be here when you're ready.
	stopConversation = "true",
	options = {
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_not_yet);
rebel_pilot_too_many_and_not_rebel = ConvoScreen:new {
	id = "rebel_pilot_too_many_and_not_rebel",
	leftDialog = "@conversation/corvette_rebel_pilot:s_221a046", --Ah yes, I was briefed about something like that earlier today. It was one of our Corellian CR-90 corvettes, I believe. I'm glad we're going to do something about it. I can definitely help you, but the transportation I can provide only has room for 10 or less. Plus, I'm only allowed to transport members of the Rebel Alliance. You'll need to adjust your group and then speak with me again.
	stopConversation = "true",
	options = {
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_too_many_and_not_rebel);
rebel_pilot_not_rebel = ConvoScreen:new {
	id = "rebel_pilot_not_rebel",
	leftDialog = "@conversation/corvette_rebel_pilot:s_808bd5e8", --Ah yes, I was briefed about something like that earlier today. It was one of our Corellian CR-90 corvettes, I believe. I'm glad we're going to do something about it. I can definitely help you, but I'm only allowed to transport members of the Rebel alliance. You'll need to adjust your group and then speak with me again.
	stopConversation = "true",
	options = {
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_not_rebel);
rebel_pilot_too_many = ConvoScreen:new {
	id = "rebel_pilot_too_many",
	leftDialog = "@conversation/corvette_rebel_pilot:s_a538ed35", --Ah yes, I was briefed about something like that earlier today. It was one of our Corellian CR-90 corvettes, I believe. I'm glad we're going to do something about it. I can definitely help you, but the transportation I can provide only has room for 10 or less. You'll need to reduce your group size and then speak with me again.
	stopConversation = "true",
	options = {
	}
}
RebelPilotConversationTemplate:addScreen(rebel_pilot_too_many);
addConversationTemplate("RebelPilotConversationTemplate", RebelPilotConversationTemplate);
