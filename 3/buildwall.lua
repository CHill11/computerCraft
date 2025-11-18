local usefulFunctions = require("usefulFunctions")
local x,y,z = gps.locate()

print("How far forward?")
local length = tonumber(read())
print("How high to build? (The y coordanate number)")
local height = tonumber(read())
while y < height do
    for t = 1,4 do
        for i = 1,length - 1 do
            usefulFunctions.placeDown()
            usefulFunctions.moveForward()
        end
        usefulFunctions.turnRight()
    end
    usefulFunctions.moveUp()
    x,y,z = gps.locate()
end
