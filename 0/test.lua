local usefulFunctions = require("usefulFunctions")

local x,y,z = gps.locate()
local facing = usefulFunctions.northSouth(z)
print(facing)
read()
_, facing = usefulFunctions.z(z,-1000,"",true)
print(facing)


