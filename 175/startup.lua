local function timer()
	os.sleep(5)
end

local function getFiles()
	local server = 207
	local fileName = {"farmer.lua","getLava.lua","usefulFunctions.lua"}
	for names in ipairs(fileName) do
		if shell.run("getfile.lua",server, fileName[names]) then
			print("Updated ", fileName[names])
		else
			print("Could not update ", fileName[names])
			read()
		end
	end
end

local complete = false
repeat
	local finishedFirst = parallel.waitForAny(getFiles,timer)
	if finishedFirst == 1 then
		complete = true
	end
until complete == true
term.clear()
print("Ready!")

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
