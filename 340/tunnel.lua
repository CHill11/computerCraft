local usefulFunctions = require("usefulFunctions")
if not fs.exists("undergroundBaseLocation") then shell.run("getfile",207,"undergroundBaseLocation.lua") end
local undergroundBaseLocation = require("undergroundBaseLocation")

local function dump(tbl, indent) -- use to debug tables
    if not indent then
        indent = ""
    end
    
    local str = "{\n"
    local new_indent = indent .. "  "
    
    for k, v in pairs(tbl) do
        -- Convert the key to a printable string
        local key_str = type(k) == "number" and "[" .. k .. "]" or '["' .. tostring(k) .. '"]'
        
        -- Handle value types
        if type(v) == "table" then
            str = str .. new_indent .. key_str .. " = " .. dump(v, new_indent)
        elseif type(v) == "string" then
            str = str .. new_indent .. key_str .. ' = "' .. v .. '",\n'
        else
            str = str .. new_indent .. key_str .. " = " .. tostring(v) .. ",\n"
        end
    end
    
    str = str .. indent .. "}"
    return str
end

local function getReply()
    local id = nil
    local message = nil
    local protocal = nil
	if rednet.isOpen() then
	    id,message,protocal = rednet.receive("reply",5)
	end
    return id,message,protocal
end

local function confirm(id)
    rednet.send(id,"confirm", "reply")
    return true
end

local function broadCastToHelppers()
    print("Broadcasting...")
    rednet.send(rednet.CHANNEL_BROADCAST,"tunnel","assistTunnel")
end


---Get out of the way of the other turtles and get the direction facing
---@return number x
---@return number y
---@return number z
---@return string facing
local function getFacing()
    usefulFunctions.moveForward() -- move forward to get out of the way of other turtle
    local x,y,z = gps.locate()
    local facing, turned = usefulFunctions.northSouth(z) -- get the facing
    for i = 1,turned do --realign the turtle the direction it was placed
        facing = usefulFunctions.turnLeft(facing)
    end
    print(facing)
    read()
    usefulFunctions.moveBack()
    return x,y,z,facing
end


local baseXYZ = undergroundBaseLocation.xyz() --  the location of the base
local customDest = false
local assist = false -- if using helpers
local destXYZ = {x = nil,y = nil,z = nil}-- location of destination
local leaderID = nil -- the leadersID
local helperIDs = {}
local helperCoords = {}
local facing = nil
local moved = 0
local dug = 0
local startX = nil
local startY = nil
local startZ = nil
local x = nil
local y = nil
local z = nil
local offset = 0


print("Should I tunnel in assest mode? (Y/N)")
local assistTemp = string.lower(read())
print(usefulFunctions.yesNo(assistTemp))
if usefulFunctions.yesNo(assistTemp) then
    assist = true
end

if assist then --if the turtle is expecting help
    print("Am I the leader? (Y/N)")
    local tempLeader = string.lower(read())
    print(usefulFunctions.yesNo(tempLeader))
    --Leader
    if usefulFunctions.yesNo(tempLeader) then -- if the turtle is the leader
        leaderID = os.getComputerID
        print("How many helpers?")
        local helpers = tonumber(read())
        for i = 1,helpers do -- create the proper ammount of values to store the number of helpers
            helperIDs[i] = false
        end
        print("number of helpers in the table " .. #helperIDs)
        while true do
            broadCastToHelppers()
            print("Waiting")
            local id,message,protocal = getReply()
            if protocal == "reply" then
                print("The info from the broadcast reply:" .."id " .. tostring(id) .. "message " .. tostring(message) .. " protocal " .. tostring(protocal))
                if message == "confirm" then
                    confirm(id) -- send the confirmation reply
                    for i,v in pairs(helperIDs) do -- add their ID to the list
                        if v == false then
                            helperIDs[i] = id
                            print(helperIDs[i])
                            goto addedAnID
                        end
                    end
                    ::addedAnID::
                    if helperIDs[#helperIDs] then
                        break
                    end
                end
            else
                print("rednet.recieve timed out")
            end
        end
    --helper
    else
        local confirmation = false
        repeat
            local id, message, protocal = rednet.receive("assistTunnel")
            if message == "tunnel" then
                leaderID = id
                print("Got leader's ID " .. leaderID)
                while not confirmation do -- keep tring to send the confirmation reply
                    confirm(leaderID)
                    id,message,protocal = getReply()
                    if protocal == "reply" then
                        if message == "confirm" then
                            confirmation = true
                            print("confirmation " .. tostring(confirmation) .. " id " .. id .. "message " .. message .. " protocal " .. protocal)
                        end
                    end
                end
            end
        until confirmation == true
    end
end


if assist then
    if leaderID == os.getComputerID then
        print("Do you want to use a custom destination? (Y/N)")
        local tempBase = read()
        if usefulFunctions.yesNo(tempBase) then
            customDest = true
        end
        if customDest then
            print("Where should I go? (x,y,z)")
            local tempXYZ = read()
            tempXYZ = string.gsub(tempXYZ,"[%p%s]", " ") --makes sure the string will get split correctly with only numbers
            local i = 1
            local xyzKeys = {"x", "y", "z"}
            for coord in string.gmatch(tempXYZ,"%S+") do --split the string into the three variables
                local key = xyzKeys[i]
                destXYZ[key] = tonumber(coord)
                i = i + 1
            end
            for o,ids in ipairs(helperIDs) do
                os.sleep(0.2)-- add a small buffer 
                rednet.send(ids, destXYZ, "coords") -- send the coords
                local confirmation = false
                while not confirmation do
                    local id,message,protocal = getReply()
                    if protocal == "reply" then
                        print("confirmation" .. tostring(confirmation) .."id " .. id .. "message " .. message .. " protocal " .. protocal)
                        if message == "confirm" and protocal == "reply" then
                            confirm(ids) -- send the confirmation reply
                            print("Sent confirmation message for coords")
                            confirmation = true
                        end
                    end
                end
            end
        else -- use base destination
            destXYZ = baseXYZ
            for o,ids in ipairs(helperIDs) do
                os.sleep(0.2)-- add a small buffer
                rednet.send(ids, destXYZ, "coords") -- send the coords
                local confirmation = false
                while not confirmation do
                    local id,message,protocal = getReply()
                    if protocal == "reply" then
                        print("confirmation" .. tostring(confirmation) .."id " .. id .. "message " .. message .. " protocal " .. protocal)
                        if message == "confirm" and protocal == "reply" then
                            confirm(ids) -- send the confirmation reply
                            print("Sent confirmation message for coords")
                            confirmation = true
                        end
                    end
                end
            end
        end
    else -- helper
        local confirmation = false
        repeat
            local id, message, protocal = rednet.receive("coords")
            if protocal == "coords" then
                destXYZ = message
                while not confirmation do -- keep tring to send the confirmation reply
                    local sentConfirmation = confirm(leaderID)
                    if sentConfirmation then
                        id,message,protocal = getReply()
                        if protocal == "reply" then
                            print("confirmation " .. tostring(confirmation) .. " id " .. id .. "message " .. message .. " protocal " .. protocal)
                            if message == "confirm" then
                                print("Confirmed coords! X:" .. tostring(destXYZ.x) .. " Y:" .. tostring(destXYZ.y) .. " Z:" .. tostring(destXYZ.z))
                                confirmation = true
                            end
                        end
                    end
                end
            end
        until confirmation == true
    end
else -- if single tutle
print("Do you want to use a custom destination? (Y/N)")
    local tempBase = read()
    if usefulFunctions.yesNo(tempBase) then
        customDest = true
    end
    if customDest then
        print("Where should I go? (x,y,z)")
        local tempXYZ = read()
        tempXYZ = string.gsub(tempXYZ,"[%p%s]", " ") --makes sure the string will get split correctly with only numbers
        local i = 1
        local xyzKeys = {"x", "y", "z"}
        for coord in string.gmatch(tempXYZ,"%S+") do --split the string into the three variables
            local key = xyzKeys[i]
            destXYZ[key] = tonumber(coord)
            i = i + 1
        end
        x,y,z,facing = getFacing() -- get x y z coords and facing
    else -- if heading to the base
        destXYZ = baseXYZ
        x,y,z,facing = getFacing() -- get x y z coords and facing
    end
end

-- generatre the offsets
if assist then
    if leaderID == os.getComputerID then
        local sortedIDs = {}
        for k,ids in ipairs(helperIDs)do
            table.insert(sortedIDs, ids) -- make a tepmorary table to sort the ids
        end
        table.sort(sortedIDs)
        print(dump(sortedIDs))
        for i = 1,#sortedIDs do
            local confirmation = false
            while not confirmation do
                rednet.send(sortedIDs[i],i,"offset")
                local id,message,protocal = getReply()
                if protocal == "reply" then
                    print("confirmation" .. tostring(confirmation) .."id " .. id .. "message " .. message .. " protocal " .. protocal)
                    if message == "confirm" and protocal == "reply" then
                        confirm(id) -- send the confirmation reply
                        print("Sent confirmation for offset.")
                        confirmation = true
                    end
                end
            end
        end
    else -- helper get the offset
        local confirmation = false
        repeat
            print("in repeat")
            local id, message, protocal = rednet.receive("offset")
            if protocal == "offset" then
                offset = message
                while not confirmation do -- keep tring to send the confirmation reply
                    print("in while")
                    local sentConfirmation = confirm(leaderID)
                    id,message,protocal = getReply()
                    if protocal == "reply" then
                        print("confirmation " .. tostring(confirmation) .. " id " .. id .. "message " .. message .. " protocal " .. protocal)
                        if message == "confirm" then
                            print("Got offset.")
                            confirmation = true
                            print(offset)
                        end
                    end
                end
            end
        until confirmation == true
    end
end

if leaderID == os.getComputerID then
    local cont = true
    x,y,z,facing = getFacing() -- get x y z coords and facing
    while cont do
        for _,ids in ipairs(helperIDs) do
            local confirmation = false
            while not confirmation do
                rednet.send(ids,"go","tunnel")
                local id,message,protocal = getReply()
                if protocal == "reply" then
                    print("confirmation" .. tostring(confirmation) .."id " .. id .. "message " .. message .. " protocal " .. protocal)
                    if message == "confirm" and protocal == "reply" then
                        confirm(ids) -- send the confirmation reply
                        print("Sent confirmation message for go")
                        confirmation = true
                    end
                end
            end
        end
        cont = false
    end
elseif assist then--helper
    local confirmation = false
    repeat
        local id, message, protocal = rednet.receive("tunnel")
        if protocal == "tunnel" and message == "go" then
            x,y,z,facing = getFacing() -- get x y z coords and facing
            while not confirmation do -- keep tring to send the confirmation reply
                local sentConfirmation = confirm(leaderID)
                id,message,protocal = getReply()
                if protocal == "reply" then
                    print("confirmation " .. tostring(confirmation) .. " id " .. id .. "message " .. message .. " protocal " .. protocal)
                    if message == "confirm" then
                        print("Confirmed GO!")
                        confirmation = true
                    end
                end
            end
        end
    until confirmation == true
end

print("Ready! X:" .. tostring(destXYZ.x + offset) .. " Y:" .. tostring(destXYZ.y) .. " Z:" .. tostring(destXYZ.z + offset))

if facing == "east" or facing == "west" then -- if x axis is longer than face that way 
    x,y,z = gps.locate()
    _,facing = usefulFunctions.x(x,destXYZ.x,facing,true)
    while x ~= destXYZ.x + offset and y ~= destXYZ.y and z ~= destXYZ.z + offset do -- continue until they are at location
        repeat -- get to the proper y coord
            x,y,z = gps.locate()
            if y ~= destXYZ.y then
                x,y,z = gps.locate()
                usefulFunctions.y(y,destXYZ.y,true)
                usefulFunctions.placeDown()
                _,moved,dug = usefulFunctions.moveForward(moved,dug)
                dug = usefulFunctions.digUp(dug)
            end
        until y == destXYZ.y
        print("Finished y")
        _,facing = usefulFunctions.x(x,destXYZ.x,facing,true)
        repeat
            x,y,z = gps.locate()
            if x ~= destXYZ.x + offset then
                _,moved,dug = usefulFunctions.moveForward(moved,dug)
                dug = usefulFunctions.digUp(dug)
                dug = usefulFunctions.digDown(dug)
            end
        until x == destXYZ.x + offset
        print("Finished x")
        _,facing = usefulFunctions.z(z,destXYZ.z,facing,true)
        repeat
            x,y,z = gps.locate()
            if z ~= destXYZ.z then
                _,moved,dug = usefulFunctions.moveForward(moved,dug)
                dug = usefulFunctions.digUp(dug)
                dug = usefulFunctions.digDown(dug)
            end
        until z == destXYZ.x + offset
        print("Finished z")
    end
else -- goZ
    _,facing = usefulFunctions.z(z,destXYZ.z,facing,true)
    while x ~= destXYZ.x + offset and y ~= destXYZ.y and z ~= destXYZ.z + offset do -- continue until they are at location
        repeat -- get to the proper y coord
            x,y,z = gps.locate()
            if y ~= destXYZ.y then
                x,y,z = gps.locate()
                usefulFunctions.y(y,destXYZ.y,true)
                usefulFunctions.placeDown()
                _,moved,dug = usefulFunctions.moveForward(moved,dug)
                dug = usefulFunctions.digUp(dug)
            end
        until y == destXYZ.y
        print("Finished y")
        _,facing = usefulFunctions.z(z,destXYZ.z,facing,true)
        repeat
            x,y,z = gps.locate()
            if z ~= destXYZ.z then
                _,moved,dug = usefulFunctions.moveForward(moved,dug)
                dug = usefulFunctions.digUp(dug)
                dug = usefulFunctions.digDown(dug)
            end
        until z == destXYZ.x + offset
        print("Finished x")

        _,facing = usefulFunctions.x(x,destXYZ.x,facing,true)
        repeat
            x,y,z = gps.locate()
            if x ~= destXYZ.x + offset then
                _,moved,dug = usefulFunctions.moveForward(moved,dug)
                dug = usefulFunctions.digUp(dug)
                dug = usefulFunctions.digDown(dug)
            end
        until x == destXYZ.x + offset
        print("Finished z")
    end
end
--start the mining loop
