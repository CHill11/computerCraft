local server = 207

local function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end

local function getFileUsefulFunctionUpdated()
	shell.run("getfile",server,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		GOTFILEUSEFULFUNCTIONS = true
	end
end
---------------main program starts here------------------

GOTFILEUSEFULFUNCTIONS = false -- flag for having downloaded usefulFunctions

if fs.exists(shell.resolve("usefulFunctions.lua")) then
	fs.delete(shell.resolve("usefulFunctions.lua"))
	if not fs.exists(shell.resolve("usefulFunctions.lua")) then
		print("Deleted usefulFunctions")
	else
		print("Error:Could not delete usefulFunctions")
	end
end
while not GOTFILEUSEFULFUNCTIONS do
	GOTFILEUSEFULFUNCTIONS = false
	parallel.waitForAny(getFileUsefulFunctionUpdated, timer)-- the download for usefulFunctions or timeout
end

local usefulFunctions = require("usefulFunctions")

local x,y,z = nil, -0, -0

while x == nil do
	x,y,z = gps.locate()
end

local homeX = -173
local homeY = 59
local homeZ = 62


local startPlantX = -173
local startPlantY = 65
local startPlantZ = 63

if y <= 63 then
	print("y <= 63")
	usefulFunctions.y(y, homeY)
	usefulFunctions.x(x, homeX) 
	usefulFunctions.z(z, homeZ)
	usefulFunctions.eastWest(homeX,"west")
else
	print("y > 63")
	usefulFunctions.y(y, startPlantY)
	usefulFunctions.x(x, startPlantX) 
	usefulFunctions.z(z, startPlantZ)
	usefulFunctions.eastWest(homeX,"west")
	rednet.send(8, "open")
    rednet.send(62, "open")
	turtle.turnRight()
	for i = 1,3 do
		usefulFunctions.moveForward()
	end
	turtle.turnRight()
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	for i = 1,3 do
		usefulFunctions.moveDown()
	end
	turtle.turnLeft()
	turtle.turnLeft()
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	turtle.turnLeft()
	for i = 1,3 do
		usefulFunctions.moveDown()
	end
	for i = 1,2 do
		usefulFunctions.moveForward()
	end
	turtle.turnRight()
	rednet.send(8, "close")
	rednet.send(62, "close")
end
print("At location running replant program.")
turtle.select(1)
if fs.exists(shell.resolve("usefulFunctions.lua")) then
	shell.run("replant")
end