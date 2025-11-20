--id = 253
 local function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end
------------------functions for the fileserver------------------
local function getFileUsefulFunctionUpdated()
	shell.run("getfile",207,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		GOTFILE_USEFULFUNCTIONS = true
	end
end

local function getFileRowFilterUpdate()
	shell.run("getfile",207,"rowFilter.lua")
	if fs.exists(shell.resolve("rowFilter.lua")) then
		GOTFILE_ROW_FILTER = true
	end
end

local function getFileStartFileShare()
	shell.run("getfile",207,"startFileShare.lua")
	if fs.exists(shell.resolve("startFileShare.lua")) then
		GOT_START_FILESHARE = true
	end
end

local function getFileItemsToFilterUpdate()
	shell.run("getfile",207,"itemsToFilter.lua")
	GOTFILE_ITEMS_TO_FILTER = true
end

------------------functions for the filter turtles---------------------------
local function getFileUsefulFunction()
	shell.run("getfile",253,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		GOTFILE_USEFULFUNCTIONS = true
	end
end

local function getFileRowFilter()
	shell.run("getfile",253,"rowFilter.lua")
	if fs.exists(shell.resolve("rowFilter.lua")) then
		GOTFILE_ROW_FILTER = true
	end
end

local function getFileItemsToFilter()
	shell.run("getfile",253,"itemsToFilter.lua")
	GOTFILE_ITEMS_TO_FILTER = true
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
	while not GOTFILE_USEFULFUNCTIONS do
		GOTFILE_USEFULFUNCTIONS = false
		parallel.waitForAny(getFileUsefulFunctionUpdated, timer)-- the download for usefulFunctions or timeout
	end
	while not GOTFILE_ROW_FILTER do
		GOTFILE_ROW_FILTER = false
		parallel.waitForAny(getFileRowFilterUpdate, timer)-- the download for usefulFunctions or timeout
	end

	GOT_START_FILESHARE = fs.exists(shell.resolve("startFileShare.lua"))
	while not GOT_START_FILESHARE do
		GOT_START_FILESHARE = false
		parallel.waitForAny(getFileStartFileShare, timer)-- the download for usefulFunctions or timeout
	end

	if not fs.exists(shell.resolve("itemsToFilter.lua")) then-- checks to see if the file itemsToFilter exists
		GOTFILE_ITEMS_TO_FILTER = false
		while not GOTFILE_ITEMS_TO_FILTER do
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
	GOTFILE_USEFULFUNCTIONS = false
	GOTFILE_ROW_FILTER = false

	while not GOTFILE_USEFULFUNCTIONS do
		parallel.waitForAny(getFileUsefulFunction, timer)-- the download for usefulFunctions or timeout
	end

	while not GOTFILE_ROW_FILTER do
		parallel.waitForAny(getFileRowFilter, timer)-- the download for rowFilter or timeout
	end

	if not fs.exists(shell.resolve("itemsToFilter.lua")) then-- checks to see if the file itemsToFilter exists
		GOTFILE_ITEMS_TO_FILTER = false
		while not GOTFILE_ITEMS_TO_FILTER do
			parallel.waitForAny(getFileItemsToFilter, timer)-- the download for itemsToFilter or timeout
		end
	end
	shell.run("rowFilter")
end