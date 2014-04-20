local ObjectManager = require("managers.object.object_manager")

RaceTrack =ScreenPlay:new {}

function RaceTrack:createRaceTrack()
	for lc = 1, table.getn(self.trackConfig.waypoints) , 1 do
		local pWaypointAA = spawnSceneObject(self.trackConfig.planetName, "object/active_area.iff", self.trackConfig.waypoints[lc].x, 0, self.trackConfig.waypoints[lc].y, 0, 0, 0, 0, 0)
		if (pWaypointAA ~= nil) then
			local activeArea = LuaActiveArea(pWaypointAA)
			activeArea:setRadius(self.trackConfig.waypointRadius)
			createObserver(ENTEREDAREA, self.trackConfig.className, "enteredWaypoint" , pWaypointAA)
			--printf(" : x=" .. waypoint.x .. " y=" .. waypoint.y .. " Planet :"..planetName.." Radius :"..radius .. "\n")
		end
	end
  self:createResetBestTimeEvent()
end

function RaceTrack:startRacing(pObject)
  ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
  	clearScreenPlayData(pObject,self.trackConfig.trackName )
    self:createResetPlayerUnfinishedEvent(pObject)
		local waypointID = playerObject:addWaypoint(self.trackConfig.planetName,self.trackConfig.trackCheckpoint .. "0",self.trackConfig.trackCheckpoint .. "0",self.trackConfig.waypoints[1].x,self.trackConfig.waypoints[1].y,WAYPOINTWHITE,true,true)
		--local time = os.time()
		local time = getTimestampMilli()
		writeScreenPlayData(pObject, self.trackConfig.trackName, "starttime", time)
		writeScreenPlayData(pObject, self.trackConfig.trackName, "waypointID", waypointID)
		writeScreenPlayData(pObject, self.trackConfig.trackName, "waypoint", 1)
		creatureObject:sendSystemMessage("@theme_park/racing/racing:go_fly")
		creatureObject:playMusicMessage("sound/music_combat_bfield_lp.snd")
   end)
end

function RaceTrack:processWaypoint(pActiveArea, pObject)
	ObjectManager.withCreaturePlayerObject(pObject, function(playerObject)
		local lastIndex =  readScreenPlayData(pObject, self.trackConfig.trackName, "waypoint")
		if lastIndex ~= "" then
			local index = self:getWaypointIndex(pActiveArea)
			if tonumber(lastIndex)==index then
				local lastWaypointID =  readScreenPlayData(pObject, self.trackConfig.trackName, "waypointID")
				if lastWaypointID=="" then
					return nil -- Somethings gone wrong
				end
				playerObject:removeWaypoint(tonumber(lastWaypointID),true)
				if tonumber(index)==table.getn(self.trackConfig.waypoints) then
					self:finalWaypoint(pActiveArea, pObject)
				else
					self:actuallyProcessWaypoint(pObject,index)
				end 
			end
		end
	end)
end

function RaceTrack:roundNumber(num)
  local mult = 10 ^ (self.trackConfig.timeResolution or 0 )
  return math.floor(num * mult + 0.5) / mult
end


function RaceTrack:actuallyProcessWaypoint(pObject,index)
	ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject,playerObject)
		local waypointID = playerObject:addWaypoint(self.trackConfig.planetName,self.trackConfig.trackCheckpoint .. index,self.trackConfig.trackCheckpoint .. index,self.trackConfig.waypoints[index+1].x,self.trackConfig.waypoints[index+1].y,WAYPOINTWHITE,true,true)
		local seconds = self:getLaptime(pObject)
		creatureObject:sendSystemMessage(self.trackConfig.trackLaptime .. index)
		creatureObject:sendSystemMessage("Time " .. self:roundNumber(seconds/1000) .. "s")
		writeScreenPlayData(pObject, self.trackConfig.trackName, "waypointID", waypointID)
		writeScreenPlayData(pObject,self.trackConfig.trackName, "waypoint", index+1)
		creatureObject:playMusicMessage("sound/music_combat_bfield_lp.snd")
	end)
end

function  RaceTrack:finalWaypoint(pActiveArea, pObject)
	ObjectManager.withCreatureObject(pObject, function(creatureObject)
		creatureObject:playMusicMessage("sound/music_combat_bfield_vict.snd")
		self:checkPersonalTime(pObject)
		self:checkServerRecordTime(pObject)
		clearScreenPlayData(pObject,self.trackConfig.trackName )
	end)
end
function RaceTrack:getLaptime(pObject)
	local startTime = readScreenPlayData(pObject, self.trackConfig.trackName, "starttime")
	local seconds = getTimestampMilli() - tonumber(startTime)
	writeScreenPlayData(pObject, self.trackConfig.trackName, "laptime",seconds)
	return seconds
end


function RaceTrack:checkPersonalTime(pObject)
	ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject,playerObject)
		local seconds = self:getLaptime(pObject)
		creatureObject:sendSystemMessage("@theme_park/racing/racing:finish_message")
		creatureObject:sendSystemMessage("Time " .. self:roundNumber(seconds/1000) .. "s")
		local personalTime = tonumber(readScreenPlayData(pObject, self.trackConfig.trackName ..".STATS", "PersonalRecordTime"))
		if personalTime == nil then
			personalTime = 9999999999
		end
		if personalTime > seconds then
			writeScreenPlayData(pObject, self.trackConfig.trackName ..".STATS", "PersonalRecordTime",seconds)
			creatureObject:sendSystemMessage("@theme_park/racing/racing:new_record")
		end
	end)
end
function RaceTrack:checkServerRecordTime(pObject)
	ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject,playerObject)
	  local resPos =0
	  local seconds = self:getLaptime(pObject)
    for lc = 1, 5 , 1 do
  		local recordTime = readSharedMemory(self.trackConfig.trackName ..".recordtime."..lc)
  		if recordTime == 0 then
  			recordTime = 9999999999
  		end	
  		if seconds < recordTime then
  		  resPos=lc
  		  break
  		end
  	end
  	printf("Position :"..resPos)
  	if resPos>0 then			
      self:adjustResultPositions(resPos,creatureObject:getFirstName(),seconds)
      if resPos==1 and playerObject:hasBadge(self.trackConfig.badgeToAward) == false then
          creatureObject:sendSystemMessage("@theme_park/racing/racing:beat_the_record")
          playerObject:awardBadge(self.trackConfig.badgeToAward)
      else
          if resPos==1 then
              creatureObject:sendSystemMessage("@theme_park/racing/racing:beat_the_record")
          else
              creatureObject:sendSystemMessage("Congratulations! You have beaten position ".. resPos .. " for this track! Record saved")
          end
      end
    end
	end)
end
function RaceTrack:adjustResultPositions(resPos,playerName,seconds)
  for lc = 5,resPos,-1 do
    writeSharedMemory(self.trackConfig.trackName ..".recordtime."..lc,readSharedMemory(self.trackConfig.trackName ..".recordtime."..(lc-1)))
    writeStringSharedMemory(self.trackConfig.trackName ..".recordholder."..lc,readStringSharedMemory(self.trackConfig.trackName ..".recordholder."..(lc-1)))
  end
  if playerName == nil then
    playerName="[name error]"
  end
  writeStringSharedMemory(self.trackConfig.trackName ..".recordholder."..resPos,playerName)
  writeSharedMemory(self.trackConfig.trackName ..".recordtime."..resPos,seconds)
end
function RaceTrack:getWaypointIndex(pActiveArea)
	return ObjectManager.withSceneObject(pActiveArea, function(sceneObject)
		local index = 0
		local wpX = sceneObject:getPositionX()
		local wpY = sceneObject:getPositionY()
		for lc = 1, table.getn(self.trackConfig.waypoints) , 1 do
			if self.trackConfig.waypoints[lc].x==wpX and self.trackConfig.waypoints[lc].y==wpY then
				index = lc
				break
			end
		end
		return index
	end)
end
function RaceTrack:displayPersonalBestTime(pObject,trackConfig)
	ObjectManager.withCreatureObject(pObject, function(creatureObject)
		local personalTime = tonumber(readScreenPlayData(pObject, self.trackConfig.trackName ..".STATS", "PersonalRecordTime"))
		creatureObject:sendSystemMessage("@theme_park/racing/racing:whats_my_time")
		if personalTime == nil then
			creatureObject:sendSystemMessage("No Time Set!")
		else
			creatureObject:sendSystemMessage("Time " .. self:roundNumber(personalTime/1000) .. "s")
		end
	end)
end

function RaceTrack:displayTrackBestTime(pObject,trackConfig)
	ObjectManager.withCreatureObject(pObject, function(creatureObject)
    local numericPositions = {"1st","2nd","3rd","4th","5th"}
		creatureObject:sendSystemMessage("Record Holders")
		local results =""
		for lc = 1, 5 , 1 do
  		local recordTime = tonumber(readSharedMemory(self.trackConfig.trackName ..".recordtime."..lc))
  		if recordTime == 0 then
  			results=results .. numericPositions[lc].." : No Time Set!\n"
  		else
  			results=results .. numericPositions[lc].." : " .. self:roundNumber(recordTime/1000) .. "s by " .. readStringSharedMemory(self.trackConfig.trackName ..".recordholder."..lc) .."\n"
  		end
		end
		creatureObject:sendSystemMessage(results)
	end)
end

function RaceTrack:createResetBestTimeEvent()
    createEventActualTime(self.trackConfig.resetTime, self.trackConfig.className, "resetBestTimeEventHandler")
    printf("Created CallBack Event for :" .. self.trackConfig.trackName .. "\n")
end

function RaceTrack:resetBestTimeEventHandler()
    printf("Doing resetBestTimeEventHandler Event for :" .. self.trackConfig.trackName .. "\n")
    for lc = 1, 5 , 1 do
      deleteSharedMemory(self.trackConfig.trackName ..".recordtime."..lc)
      deleteSharedMemory(self.trackConfig.trackName ..".recordholder."..lc)
    end
    createEvent(24*60*60*1000, self.trackConfig.className, "resetBestTimeEventHandler",nil)
end

function RaceTrack:createResetPlayerUnfinishedEvent(pObject)
    createEvent(self.trackConfig.expiryTime, self.trackConfig.className, "resetPlayerUnfinishedEventHandler",pObject)
    printf("Created Reset Player CallBack Event for :" .. self.trackConfig.trackName .. "\n")
end
function RaceTrack:resetPlayerUnfinishedEventHandler(pObject)
    local startTime = tonumber(readScreenPlayData(pObject, self.trackConfig.trackName , "starttime"))
    if not(startTime == nil) then 
      local time = getTimestampMilli()
      if  abs((startTime/1000)-(time/1000)) < 60 then
        clearScreenPlayData(pObject,self.trackConfig.trackName )
        printf("Reset Player for :" .. self.trackConfig.trackName .. "\n")
      end 
    end
end

return RaceTrack