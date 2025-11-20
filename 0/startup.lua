local function timer()
	os.sleep(5)
end

local function getFiles()
	local server = 207
	local fileName = {	"buildBridge.lua","buildStairs.lua","buildStairsUp.lua","buildStrip.lua","buildTrack.lua","checkStone.lua","clearWater.lua",
						"destoryStrip.lua","dig.lua","digDown.lua","down.lua","flatten.lua","forward.lua","getLava.lua",
						"keepDiggingDown.lua","mineDown.lua","placeTorch.lua","spruceFarm.lua","ultimateExcavate.lua",
						"up.lua","usefulFunctions.lua"}
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