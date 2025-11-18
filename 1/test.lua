local usefulFunctions = require("usefulFunctions")
--[[
---@param totalMoved number? The total number of blocks moved
---@param mined number? The number of blocks mined
---@param list table The list of blocks to avoid
---@param blocksUpFromMiningLayer number The number of blocks that the turtle is above the mining layer
---@return number moved
---@return number totalMoved
---@return number mined
---@return string whatToDo
---@return number blocksUpFromMiningLayer
local function avoidBlockFront(totalMoved,mined,list,blocksUpFromMiningLayer)
    totalMoved = totalMoved or 0
    mined = mined or 0
    print("totalMoved " .. totalMoved .. " mined " .. mined .. " blocksUpFromMiningLayer " .. tostring(blocksUpFromMiningLayer)) --debug
    read() --debug
    list = list or {}
    local moved = nil -- initialize moved variable
    local whatToDo = nil
    local success = false -- initialize success variable
    local _,blockFront = turtle.inspect() -- get the block's details
    if list[blockFront.name] then -- if its in the list
        print("avoidBlockFront if") --debug
        local _, blockUp = turtle.inspectUp() -- get the block above details
        if list[blockUp.name] then -- if block above is in the list
            whatToDo = "up"
            moved = -1 -- went back one block
            print("avoidBlockFront inner if") --debug
            success,totalMoved = usefulFunctions.moveBack(totalMoved) -- move back to avoid the block in front
            return moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer  -- return the amount moved and up becaues the block 
        else -- the block is mineable
            whatToDo = "forward"
            moved = 0 -- did not move forward
            print("avoidBlockFront inner else") --debug
            success,totalMoved,mined = usefulFunctions.moveUp(totalMoved,mined)
            if success then
                blocksUpFromMiningLayer = blocksUpFromMiningLayer + 1
            end
            return moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer
        end
    else --else it not in the list or no block in front
        moved = 1 -- went forwad 1 block
        if blocksUpFromMiningLayer > 0 then -- go forward one then let down try and get back to the mining layer
            whatToDo = "down"
            print("avoidBlockFront else if") --debug
            success,totalMoved,mined = usefulFunctions.moveForward(totalMoved,mined)
            return moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer
        end
        whatToDo = "forward"
        print("avoidBlockFront else") --debug
        _,totalMoved,mined = usefulFunctions.moveForward(totalMoved,mined) --this will run if blocksUpFromMiningLayer is 0
        return 1,totalMoved,mined,whatToDo,blocksUpFromMiningLayer
    end
end

---@param totalMoved number? The total number of blocks moved
---@param mined number? The number of blocks mined
---@param list table The list of blocks to avoid
---@return number moved
---@return number toalMoved
---@return number mined
---@return string whatToDo
local function avoidBlockUp(totalMoved,mined,list)
    totalMoved = totalMoved or 0
    mined = mined or 0
    local moved = nil -- initialize moved variable
    local whatToDo = nil -- initialize whatToDo variable
    local success = false -- initialize success variable
    local _, blockUp = turtle.inspectUp()
    if list[blockUp.name] then -- if block above is in the list
    print("avoidBlockUp if") --debug
        moved = -1 -- went back one block
        whatToDo = "up"
        success,totalMoved = usefulFunctions.moveBack(totalMoved) --go back one block
        return moved,totalMoved,mined,whatToDo
    else
        moved = 1 -- went up one block
        whatToDo = "forward"
        print("avoidBlockUp else") --debug
        success,totalMoved,mined = usefulFunctions.moveUp(totalMoved,mined)
        return moved,totalMoved,mined,whatToDo -- went up a block so try going forword again
    end
end


---comment
---@param totalMoved number? The total number of blocks moved
---@param mined number? The number of blocks mined
---@param list table The list of blocks to avoid
---@param blocksUpFromMiningLayer number The number of blocks that the turtle is above the mining layer
---@return number toalMoved
---@return number mined
---@return string shatToDo
---@return number blocksUpFromMiningLayer
local function avoidBlockDown(totalMoved,mined,list,blocksUpFromMiningLayer)
    totalMoved = totalMoved or 0
    mined = mined or 0
    local whatToDo = "forward" -- initialize whatToDo variable
    while blocksUpFromMiningLayer ~= 0 do --keep trying to dig down unless the block should not be dug
        local _,blockDown = turtle.inspectDown()
        if list[blockDown.name] then -- if there is a block down and it is in the list
            return totalMoved,mined,whatToDo,blocksUpFromMiningLayer -- stop trying to go down, block is in the way
        else
            local success
            success,totalMoved,mined = usefulFunctions.moveDown(totalMoved,mined)
            if success then
                blocksUpFromMiningLayer = blocksUpFromMiningLayer - 1
            end
        end
    end
    return totalMoved,mined,whatToDo,blocksUpFromMiningLayer
end
]]
local startX,startY,startZ = gps.locate() -- starting location
local facing, turned = usefulFunctions.eastWest(startX)

for i = 1,turned do
    facing = usefulFunctions.turnLeft(facing)
end

local list = {["minecraft:coal_ore"] = true, ["minecraft:iron_ore"] = true}
local totalMoved = 0 --the total amount of blocks move forwards and backwards
local mined = 0 -- total number of blocks mined
local userDist = 5 -- the distance the user wants to go
local length = 0
local whatToDo = "forward" -- what to do next
local blocksUpFromMiningLayer = 0 -- the number of blocks the turtle is above the mining layer
local moved = nil
while true do
    local isBlock, block = turtle.inspect()
    --[[print("whatToDo: " .. whatToDo .. " Length: " .. length .. " blocksUpFromMiningLayer " .. blocksUpFromMiningLayer)--debug
    read()--debug
    --]]
    --switch like logic for what to do
    --forward
    if whatToDo == "forward" then
        moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer = usefulFunctions.avoidBlockFront(totalMoved,mined,list,blocksUpFromMiningLayer)
        print("before " .. length)
        length = length + moved
        print("after" .. length)

    --up
    elseif whatToDo == "up" then
        moved,totalMoved,mined,whatToDo = usefulFunctions.avoidBlockUp(totalMoved,mined,list)
        if moved == 1 then -- if the turtle moved up add one to blocksUpFromMiningLayer
            blocksUpFromMiningLayer = blocksUpFromMiningLayer + moved
        else -- the turtle moved back. Subtract one from length
            length = length + moved -- needs to stay as addition because moved is negative and needs to be diffrent then then 1 that is coming for blocksUpFromMiningLayer
        end
    --down
    elseif whatToDo == "down" then
        print("Try down")
        totalMoved,mined,whatToDo,blocksUpFromMiningLayer = usefulFunctions.avoidBlockDown(totalMoved,mined,list,blocksUpFromMiningLayer)
        else -- if whatToDo is not recognized
        print("Something went wrong")
        return
    end
    if length >= userDist then
        print("At dist")
        read()
        return
    end
end