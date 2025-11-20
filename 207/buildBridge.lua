local usefulFunctions = require("usefulFunctions")

print("How far should i build?")
local dist = tonumber(read())
local moved = 1
local placed = 0
for i = 1,moved do
    _,placed = usefulFunctions.placeDown(placed)
    usefulFunctions.turnLeft()
    _,placed = usefulFunctions.placeDown(placed)
    usefulFunctions.turnAround()
    _,placed = usefulFunctions.placeDown(placed)
    usefulFunctions.turnLeft()
    usefulFunctions.moveForward(moved)
    print("Moved ",moved)
    print("Placed ",placed)
end