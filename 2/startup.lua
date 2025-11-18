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

if fs.exists(shell.resolve("usefulFunctions.lua")) then
	shell.run("startTreeFarm")
end