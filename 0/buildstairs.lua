local usefulFunctions = require("usefulFunctions")
print("How far to make stairs?")
local dist = tonumber(read())
for i = 1, dist do
    usefulFunctions.moveDown()
    usefulFunctions.placeDown()
    usefulFunctions.moveForward()
    usefulFunctions.digUp()
end
