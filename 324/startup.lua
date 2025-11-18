function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end
------------------functions for the fileserver------------------
function getFileUsefulFunctionUpdated()
	shell.run("getfile",207,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileUsefulFunction = true
	end
end

------------------functions for the coal computers---------------------------
function getFileUsefulFunction()
	shell.run("getfile",264,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileUsefulFunction = true
	end
end

function getFileFurnaceWood()
	shell.run("getfile",264,"furnaceWood.lua")
	if fs.exists(shell.resolve("furnaceWood.lua")) then
		gotFurnaceWood = true
	end
end

------------------main------------------------------------
if term.isColor() then
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
	local furnaceWoodDir = shell.resolve("furnaceWood.lua") 
	local furnaceWoodId = shell.openTab(furnaceWoodDir)
	multishell.setTitle(furnaceWoodId, "furnaceWood")
	
	local fileShareId = shell.openTab("startFileShare")
	multishell.setTitle(fileShareId, "fileShare")
else
	--[[
		if fs.exists(shell.resolve("usefulFunctions.lua")) then
		fs.delete(shell.resolve("usefulFunctions.lua"))
		if not fs.exists(shell.resolve("usefulFunctions.lua")) then
			print("Deleted usefulFunctions")
		else 
			print("Error:Could not delete usefulFunctions")
		end
	end
	--]]
	if fs.exists(shell.resolve("furnaceWood.lua")) then
		fs.delete(shell.resolve("furnaceWood.lua"))
		if not fs.exists(shell.resolve("furnaceWood.lua")) then
			print("Deleted furnaceWood")
		else
			print("Error:Could not delete furnaceWood")
		end
	end
	
	while not gotFurnaceWood do
		gotFurnaceWood = false
		parallel.waitForAny(getFileFurnaceWood, timer)-- the download for usefulFunctions or timeout
	end
	shell.run("furnaceWood")
end

