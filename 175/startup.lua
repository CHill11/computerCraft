local server = 207

function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end

function getFileUsefulFunctionUpdated()
	shell.run("getfile",server,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileUsefulFunction = true
	end
end

if fs.exists(shell.resolve("usefulFunctions.lua")) then
	fs.delete(shell.resolve("usefulFunctions.lua"))
	if not fs.exists(shell.resolve("usefulFunctions.lua")) then
		print("Deleted usefulFunctions")
	else 
		print("Error:Could not delete usefulFunctions")
	end
end
while not gotFileUsefulFunction do
	gotFileUsefulFunction = false
	parallel.waitForAny(getFileUsefulFunctionUpdated, timer)-- the download for usefulFunctions or timeout
end

local usefulFunctions = require("usefulFunctions")

local x,y,z = gps.locate()

local farmX = -190
local farmY = 52
local farmZ = 60

usefulFunctions.x(x, farmX)
usefulFunctions.z(z, farmZ)
usefulFunctions.northSouth(farmZ,"south")
if fs.exists(shell.resolve("usefulFunctions.lua")) then
	shell.run("farmer")
end
