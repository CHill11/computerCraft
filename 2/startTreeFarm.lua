local usefulFunctions = require("usefulFunctions")

local x,y,z  = nil 

while x == nil do
	x,y,z = gps.locate(3)
	sleep(3)
end

local farmX = -175
local farmY = 65
local farmZ = 63

usefulFunctions.y(y, farmY)
usefulFunctions.x(x, farmX)
usefulFunctions.z(z, farmZ)
usefulFunctions.eastWest(farmX,"east")
shell.run("treeFarm")