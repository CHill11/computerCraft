usefulFunctions = require("usefulFunctions")

local length = 15
local width = 26
for o = 1,width do
    
    for i = 1,length do
        usefulFunctions.moveForward()
        usefulFunctions.placeDown(0, "minecraft:quartz_slab")
    end
    if o % 2 == 1 then 
        turtle.turnRight()
        usefulFunctions.moveForward()
        usefulFunctions.placeDown(0, "minecraft:quartz_slab")
        turtle.turnRight()
    else
        turtle.turnLeft()
        usefulFunctions.moveForward()
        usefulFunctions.placeDown(0, "minecraft:quartz_slab")
        turtle.turnLeft()
    end
end
    
