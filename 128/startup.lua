--id = 128
mainCommandComputer = 207
rowCommandComputer = 259
function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end
------------------functions for the fileserver------------------
function getFileUsefulFunctionUpdated()
	shell.run("getfile",mainCommandComputer,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileUsefulFunction = true
	end
end

function getFileRowFilterUpdate()
	shell.run("getfile",mainCommandComputer,"rowFilter.lua")
	if fs.exists(shell.resolve("rowFilter.lua")) then
		gotFileRowFilter = true
	end
end

function getFileStartFileShare()
	shell.run("getfile",mainCommandComputer,"startFileShare.lua")
	if fs.exists(shell.resolve("startFileShare.lua")) then
		gotStartFileShare = true
	end
end

function getFileItemsToFilterUpdate()
	shell.run("getfile",mainCommandComputer,"itemsToFilter.lua")
	gotFileItemsToFilter = true
end

------------------functions for the filter turtles---------------------------
function getFileUsefulFunction()
	shell.run("getfile",rowCommandComputer,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		gotFileUsefulFunction = true
	end
end

function getFileRowFilter()
	shell.run("getfile",rowCommandComputer,"rowFilter.lua")
	if fs.exists(shell.resolve("rowFilter.lua")) then
		gotFileRowFilter = true
	end
end

function getFileItemsToFilter()
	shell.run("getfile",rowCommandComputer,"itemsToFilter.lua")
	gotFileItemsToFilter = true
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
	while not gotFileRowFilter do
		gotFileRowFilter = false
		parallel.waitForAny(getFileRowFilterUpdate, timer)-- the download for usefulFunctions or timeout
	end
	
	gotStartFileShare = fs.exists(shell.resolve("startFileShare.lua"))
	while not gotStartFileShare do
		gotStartFileShare = false
		parallel.waitForAny(getFileStartFileShare, timer)-- the download for usefulFunctions or timeout
	end
	
	if not fs.exists(shell.resolve("itemsToFilter.lua")) then-- checks to see if the file itemsToFilter exists
		gotFileItemsToFilter = false
		while not gotFileItemsToFilter do
			parallel.waitForAny(getFileItemsToFilterUpdate, timer)-- the download for itemsToFilter or timeout
		end
	end
	
	shell.run("startFileShare")
else
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		fs.delete(shell.resolve("usefulFunctions.lua"))
		if not fs.exists(shell.resolve("usefulFunctions.lua")) then
			print("Deleted usefulFunctions")
		else 
			print("Error:Could not delete usefulFunctions")
		end
	end
	if fs.exists(shell.resolve("rowFilter.lua")) then
		fs.delete(shell.resolve("rowFilter.lua"))
		if not fs.exists(shell.resolve("rowFilter.lua")) then
			print("Deleted rowFilter")
		else
			print("Error:Could not delete rowFilter")
		end
	end
	gotFileUsefulFunction = false
	gotFileRowFilter = false

	while not gotFileUsefulFunction do
		parallel.waitForAny(getFileUsefulFunction, timer)-- the download for usefulFunctions or timeout
	end

	while not gotFileRowFilter do
		parallel.waitForAny(getFileRowFilter, timer)-- the download for rowFilter or timeout
	end

	if not fs.exists(shell.resolve("itemsToFilter.lua")) then-- checks to see if the file itemsToFilter exists
		gotFileItemsToFilter = false
		while not gotFileItemsToFilter do
			parallel.waitForAny(getFileItemsToFilter, timer)-- the download for itemsToFilter or timeout
		end
	end
	shell.run("rowFilter")
end
