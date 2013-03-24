DantooineImperialOutpostScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "DantooineImperialOutpostScreenPlay"
}

registerScreenPlay("DantooineImperialOutpostScreenPlay", true)

function DantooineImperialOutpostScreenPlay:start()
	if (isZoneEnabled("dantooine")) then
		self:spawnMobiles()
	end
end

function DantooineImperialOutpostScreenPlay:spawnMobiles()
	spawnMobile("dantooine", "at_st", 900, -4230, 3, -2330, 80, 0)
	spawnMobile("dantooine", "at_st", 900, -4230, 3, -2475, 0, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4212, 3, -2380, 300, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4217, 3, -2389, 330, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4232, 3, -2390, 40, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4234, 3, -2382, 330, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4222, 3, -2398, 340, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4228, 3, -2398, 10, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4249, 3, -2395, 160, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4267, 3, -2388, 120, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4275, 3, -2404, 80, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4275, 3, -2412, 60, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4266, 3, -2431, 20, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4287, 3, -2414, 230, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4293, 3, -2397, 320, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4199, 3, -2342, 40, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4164, 3, -2400, 10, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4167, 3, -2410, 0, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4180, 3, -2408, 90, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4228, 3, -2410, 190, 0)
	spawnMobile("dantooine", "stormtrooper", 450, -4240, 3, -2421, 350, 0)
	spawnMobile("dantooine", "imperial_corporal", 450, -4229, 3, -2431, 20, 0)
	spawnMobile("dantooine", "imperial_corporal", 450, -4204, 3, -2421, 0, 0)
	spawnMobile("dantooine", "imperial_private", 450, -4241, 3, -2403, 300, 0)
	spawnMobile("dantooine", "imperial_private", 450, -4198, 3, -2404, 240, 0)

end
