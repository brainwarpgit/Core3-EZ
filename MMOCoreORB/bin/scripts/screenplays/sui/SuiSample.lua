SuiSample = {}
function SuiSample:openSample(pCreatureObject)
	local sui = SuiListBox.new()
	sui.subscribeToEvent(0x09, "", "SuiSample:onAccept")
	
	sui.setTitle("test title")
	sui.setPrompt("test prompt")
	
	sui.add("List Item 1", "Value1")
	sui.add("List Item 2", "Value2")
	
	sui.sendTo(pCreatureObject)
end

function SuiSample:onAccept()
	printf("Accepted!")
end