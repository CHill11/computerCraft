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

shell.run("delivery")