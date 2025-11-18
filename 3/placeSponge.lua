local usefulFunctions = require("usefulFunctions")

local stopBlocks = {["minecraft:jungle_planks"] = true,["minecraft:oak_planks"] = true}
local stop = 0
local layer = 1
while true do
    local isBlock, block = turtle.inspect()
    if isBlock and stopBlocks[block.name] then
        stop = stop + 1
        if stop == 60 then
            return
        end
        if stop % 2 == 1 then
            usefulFunctions.turnRight()
            for i = 1,4 do
                isBlock,block = turtle.inspect()
                if isBlock and stopBlocks[block.name] then
                    return
                end
                usefulFunctions.moveForward()
            end
            usefulFunctions.turnRight()
        else
            usefulFunctions.turnLeft()
            for i = 1,4 do
                isBlock,block = turtle.inspect()
                if isBlock and stopBlocks[block.name] then
                    return
                end
                usefulFunctions.moveForward()
            end
            usefulFunctions.turnLeft()
        end
    else
        usefulFunctions.placeDown(0,"minecraft:sponge")
        usefulFunctions.moveForward()
    end
end