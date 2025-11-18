local usefulFunctions = require("usefulFunctions")
local baseLocation = require("baseLocation")
BASEX,BASEY,BASEZ =  baseLocation.xyz()-- get the base coordinates from the startup file
HEIGHT = 150
CHESTX,CHESTY,CHESTZ = gps.locate() -- get the chest coordinates
local side = "bottom"
local function goBase()
    if WHATTODO == 1 then
        local _,y,_ = gps.locate()
        usefulFunctions.y(y,HEIGHT) -- move up past any obstacles
        WHATTODO = 2
    end
    if WHATTODO == 2 then
        local _,_,z = gps.locate()
        usefulFunctions.z(z,BASEZ) -- move to the base z coordinate
        WHATTODO = 3
    end
    if WHATTODO == 3 then
        local x,_,_ = gps.locate()
        usefulFunctions.x(x,BASEX) -- move to the base x coordinate
        WHATTODO = 4
    end
    if WHATTODO == 4 then
        local _,y,_ = gps.locate()
        usefulFunctions.y(y,BASEY) -- move down on y to base coordinate
        WHATTODO = 5
    end
    usefulFunctions.emptyInvDown() -- empty inventory into chest below
    turtle.select(1) -- select first slot so the inventory will fill up fully
    rednet.send(63,"Emptied inventory at base.","routine")
end

local function goChest()
    if WHATTODO == 5 then
        local _,y,_ = gps.locate()
        usefulFunctions.y(y,HEIGHT) -- move up past any obstacles
        WHATTODO = 6
    end
    if WHATTODO == 6 then
        local x,_,_ = gps.locate()
        usefulFunctions.x(x,CHESTX)
        WHATTODO = 7
    end
    if WHATTODO == 7 then
        local _,_,z = gps.locate()
    usefulFunctions.z(z,CHESTZ)
        WHATTODO = 8
    end
    if WHATTODO == 8 then
        usefulFunctions.y(HEIGHT,CHESTY) -- move down to chest level
        WHATTODO = 1
    end
    rednet.send(63,"Returned to chest.","routine")
end

local function getItems() -- get items from chest
    local CHEST = peripheral.wrap(side) -- find the chest peripheral
    if CHEST then
        print("in chest")
        local chestList = CHEST.list()
        local slotsFull = 0
        for slot, item in pairs(chestList) do -- count full slots
            slotsFull = slotsFull + 1
        end
        if slotsFull >= 10 then -- if there are at least 10 slots full, start getting items
            print("in slotFull")
            for i=1,16 do
                if side == "bottom" then
                    turtle.suckDown()
                elseif side == "top" then
                    turtle.suckUp()
                elseif side == "front" then
                    turtle.suck()
                end
                local lastSlot turtle.getItemDetail(16)
                if lastSlot then
                    break
                end
            end
        else -- not enough items to collect
            rednet.send(1,"continue") -- send message to excavate to continue
            local time = 60
            for i = 1,6 do
                time = time - 10
                print("Resuming in " .. time)
                sleep(10) -- wait 10 seconds before checking again
            end
        end
    end
end

local function getLocation()
    local id,message,protocal = rednet.receive()
    if id == 63 and message == "location" then
        local x,y,z = gps.locate()
        rednet.send(63,"Current Coordinates X:"..x.." Y:"..y.." Z:"..z) -- send current location
    end
end

SIDE = nil
CHEST = nil
WHATTODO = 1
rednet.send(63,"This is my position X:"..CHESTX.." Y:"..CHESTY.." Z:"..CHESTZ)
print("Started delivery...")
while true do
    parallel.waitForAny(getItems,getLocation)
    local lastSlot = turtle.getItemDetail(16)
    if lastSlot then
        local x,y,z = nil,nil,nil
        while x ~= BASEX and y ~= BASEY and z ~= BASEZ do
            x,y,z = gps.locate()
            parallel.waitForAny(goBase,getLocation) -- go to base and empty inventory
        end

    while x ~= CHESTX and y ~= CHESTY and z ~= CHESTZ do
            x,y,z = gps.locate()
            parallel.waitForAny(goChest,getLocation) -- return to chest
        end
    end
end