local usefulFunctions = require("usefulFunctions")

print("How far should I place torches?")
local dist = tonumber(read())
local moved = 0
local hasTorch = false
repeat
    turtle.select(1)
    local item = turtle.getItemDetail()
    if item then
        if item.name == "minecraft:torch" then
            print("Starting...")
            hasTorch = true
        end
    else
        print("Need torches in slot 1")
        sleep(1)
    end
until hasTorch
while moved < dist do
    _,moved = usefulFunctions.moveForward(moved)
   if moved % 8 == 0 then
       usefulFunctions.turnAround()
       turtle.place()
       usefulFunctions.turnAround()
   end
end
