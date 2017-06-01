-- Object ID of Enclave buildings
lightEnclaveID = 8525417
darkEnclaveID = 3435626

petitionInterval = 86400000
votingInterval = 86400000
acceptanceInterval = 86400000
maintenanceInterval = 900000

requestDemotionDuration = 604800
voteChallengeDuration = 604800

baseMaintCost = 100
requestDemotionCost = 2500
voteChallengeCost = 2000

maxPetitioners = 11
missedVotePenalty = 100

enclaveRoomRequirements = {
	-- Light enclave
	{ 8525421, 1 }, -- tier1hall1
	{ 8525420, 1 }, -- tier1room
	{ 8525419, 1 }, -- tier1hall2
	{ 8525424, 5 }, -- tier2hall1
	{ 8525423, 5 }, -- tier2room
	{ 8525422, 5 }, -- tier2hall2
	{ 8525433, 8 }, -- tier3hall1
	{ 8525432, 8 }, -- tier3room
	{ 8525431, 8 }, -- tier3hall2
	{ 8525430, 10 }, -- tier4hall1
	{ 8525429, 10 }, -- tier4room
	{ 8525428, 10 }, -- tier4hall2
	{ 8525427, 11 }, -- tier5hall1
	{ 8525426, 11 }, -- tier5room
	{ 8525425, 11 }, -- tier5hall2
	-- Dark enclave
	{ 3435644, 1 }, -- hallwayb1
	{ 3435650, 1 }, -- council1
	{ 3435637, 5 }, -- hallwaya1
	{ 3435652, 5 }, -- council3
	{ 3435638, 8 }, -- hallwaya2
	{ 3435653, 8 }, -- council4
	{ 3435645, 8 }, -- hallwayb2
	{ 3435639, 10 }, -- hallwaya3
	{ 3435646, 10 }, -- hallwayb3
	{ 3435651, 10 }, -- council2
	{ 3435640, 11 }, -- hallwaya4
	{ 3435647, 11 }, -- hallwayb4
	{ 3435641, 11 }, -- chamberramp
	{ 3435642, 11 }, -- chamber
}
