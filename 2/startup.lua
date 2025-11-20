local function timer()-- the timeout timer for downloading usefulFunctions
	sleep(5)
end

local function getFiles()
	local server = 207
	local fileName = {	"treeFarm.lua","usefulFunctions.lua"}
	for names in ipairs(fileName) do
		if shell.run("getfile.lua",server, fileName[names]) then
			print("Updated ", fileName[names])
		else
			print("Could not update ", fileName[names])
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

if fs.exists(shell.resolve("usefulFunctions.lua")) then
	shell.run("startTreeFarm")
end