--id = 
local mainCommandComputer = 207
local rowCommandComputer = nil
local function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end
------------------functions for the fileserver------------------
local function getFileUsefulFunctionUpdated()
	shell.run("getfile",mainCommandComputer,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		GOT_FILE_USEFULFUNCTION = true
	end
end

local function getFileRowFilterUpdate()
	shell.run("getfile",mainCommandComputer,"rowFilter.lua")
	if fs.exists(shell.resolve("rowFilter.lua")) then
		GOT_FILE_ROW_FILTER = true
	end
end

local function getFileStartFileShare()
	shell.run("getfile",mainCommandComputer,"startFileShare.lua")
	if fs.exists(shell.resolve("startFileShare.lua")) then
		GOT_START_FILE_SHARE = true
	end
end

local function getFileItemsToFilterUpdate()
	shell.run("getfile",mainCommandComputer,"itemsToFilter.lua")
	GOT_FILE_ITEM_TO_FILTER = true
end

------------------functions for the filter turtles---------------------------
local function getFileUsefulFunction()
	shell.run("getfile",rowCommandComputer,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		GOT_FILE_USEFULFUNCTION = true
	end
end

local function getFileRowFilter()
	shell.run("getfile",rowCommandComputer,"rowFilter.lua")
	if fs.exists(shell.resolve("rowFilter.lua")) then
		GOT_FILE_ROW_FILTER = true
	end
end

local function getFileItemsToFilter()
	shell.run("getfile",rowCommandComputer,"itemsToFilter.lua")
	GOT_FILE_ITEM_TO_FILTER = true
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
	while not GOT_FILE_USEFULFUNCTION do
		GOT_FILE_USEFULFUNCTION = false
		parallel.waitForAny(getFileUsefulFunctionUpdated, timer)-- the download for usefulFunctions or timeout
	end
	while not GOT_FILE_ROW_FILTER do
		GOT_FILE_ROW_FILTER = false
		parallel.waitForAny(getFileRowFilterUpdate, timer)-- the download for usefulFunctions or timeout
	end
	
	GOT_START_FILE_SHARE = fs.exists(shell.resolve("startFileShare.lua"))
	while not GOT_START_FILE_SHARE do
		GOT_START_FILE_SHARE = false
		parallel.waitForAny(getFileStartFileShare, timer)-- the download for usefulFunctions or timeout
	end
	
	if not fs.exists(shell.resolve("itemsToFilter.lua")) then-- checks to see if the file itemsToFilter exists
		GOT_FILE_ITEM_TO_FILTER = false
		while not GOT_FILE_ITEM_TO_FILTER do
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
	GOT_FILE_USEFULFUNCTION = false
	GOT_FILE_ROW_FILTER = false

	while not GOT_FILE_USEFULFUNCTION do
		parallel.waitForAny(getFileUsefulFunction, timer)-- the download for usefulFunctions or timeout
	end

	while not GOT_FILE_ROW_FILTER do
		parallel.waitForAny(getFileRowFilter, timer)-- the download for rowFilter or timeout
	end

	if not fs.exists(shell.resolve("itemsToFilter.lua")) then-- checks to see if the file itemsToFilter exists
		GOT_FILE_ITEM_TO_FILTER = false
		while not GOT_FILE_ITEM_TO_FILTER do
			parallel.waitForAny(getFileItemsToFilter, timer)-- the download for itemsToFilter or timeout
		end
	end
	shell.run("rowFilter")
end