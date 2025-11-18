local usefulFunctions = require("usefulFunctions")

local function buildColumn(height)
    local x,y,z = gps.locate()
    while y <= height do
        usefulFunctions.moveUp()
        usefulFunctions.placeDown()
        x,y,z = gps.locate()
    end
    return true
end

local function turnTheCorrectWay(o)
    if o % 2 == 1 then -- turn the right way
        usefulFunctions.turnRight()
        usefulFunctions.moveForward()
        usefulFunctions.turnRight()
    else
        usefulFunctions.turnLeft()
        usefulFunctions.moveForward()
        usefulFunctions.turnLeft()
    end
end

local function goBackToY(startY)
    while true do
        local _,y,_ = gps.locate()
        if y ~= nil then
            usefulFunctions.y(y,startY)
            return
        end
    end
end

local x,y,z = gps.locate()
local _,startY,_ = gps.locate()
print("How far forward?")
local length = tonumber(read())
print("How far to the right?")
local width = tonumber(read())
print("How high to build? (The y coordanate number)")
local height = tonumber(read())
local skipBlock = nil
print(length .. " is length. " .. width .. " is width.")

while true do
    for o = 1, width do
        if 0 % 2 == 1 then
            skipBlock = false
        else
            skipBlock = true
        end
        for t = 1,length do
            if skipBlock then
                usefulFunctions.moveForward()
                skipBlock = false
            else
                skipBlock = buildColumn(height)
                if t ~= length then
                    usefulFunctions.moveForward()
                    goBackToY(startY)
                else

                end
            end
        end
        turnTheCorrectWay(o)
        goBackToY(startY)
        if 0 == width then
            print("Done")
            return
        end
    end
end
