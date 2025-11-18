local usefulFunctions = require("usefulFunctions")

while true do
    local isBlock, block = turtle.inspect()
    if isBlock and block.name == "minecraft:jungle_log" then
        usefulFunctions.moveUp()
    elseif block.name == "minecraft:jungle_leaves" then
        usefulFunctions.moveForward()
        while true do
            isBlock, block = turtle.inspectDown()
            if block.name == "minecraft:jungle_log" then
                for i = 1, 4 do
                    usefulFunctions.moveForward()
                    usefulFunctions.turnRight()
                end
                usefulFunctions.moveDown()
            else
                return
            end
        end
    end
end