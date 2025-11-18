--id = 264
function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end
------------------functions for the fileserver------------------
function getFileUsefulFunctionUpdated()
	shell.run("getfile",207,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileFurnaceCoal = true
	end
end

------------------functions for the coal computers---------------------------
function getFileUsefulFunction()
	shell.run("getfile",264,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileUsefulFunction = true
	end
end

function getFileFurnaceCoal()
	shell.run("getfile",264,"furnaceCoal.lua")
	if fs.exists(shell.resolve("furnaceCoal.lua")) then
		gotFurnaceCoal = true
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
	local furnaceCoalDir = shell.resolve("furnaceCoal.lua") 
	local furnaceCoalId = shell.openTab(furnaceCoalDir)
	multishell.setTitle(furnaceCoalId, "furnaceCoal")
	
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
	if fs.exists(shell.resolve("furnaceCoal.lua")) then
		fs.delete(shell.resolve("furnaceCoal.lua"))
		if not fs.exists(shell.resolve("furnaceCoal.lua")) then
			print("Deleted furnaceCoal")
		else
			print("Error:Could not delete furnaceCoal")
		end
	end
	
	while not gotFurnaceCoal do
		gotFurnaceCoal = false
		parallel.waitForAny(getFileFurnaceCoal, timer)-- the download for usefulFunctions or timeout
	end
	shell.run("furnaceCoal")
end
