local usefulFunctions = require("usefulFunctions")

local server = 207

local function timer()-- the timeout timer for downloading usefulFunctions
	sleep(3)
end

local function getFileItemInFilterUpdated()
	shell.run("getfile",server,"itemsInFilter.lua")
	if fs.exists(shell.resolve("itemsInFilter.lua")) then
		GOTFILEITEMINFILTER = true
	end
end

local function getFileUsefulFunctions()
	shell.run("getfile",server,"usefulFunctions.lua")
	if fs.exists(shell.resolve("usefulFunctions.lua")) then
		GOTUSEFULFUNCTIONS = true
	end
end

if fs.exists(shell.resolve("itemsInFilter.lua")) then
	fs.delete(shell.resolve("itemsInFilter.lua"))
	if not fs.exists(shell.resolve("itemsInFilter.lua")) then
		print("Deleted itemsInFilter")
	else
		print("Error:Could not delete itemsInFilter")
	end
end

while rednet.isOpen() == false do
	usefulFunctions.openRednet()
	sleep(0.5)
	print(rednet.isOpen())
end

while not GOTFILEITEMINFILTER do
	GOTFILEITEMINFILTER = false
	parallel.waitForAny(getFileItemInFilterUpdated, timer)-- the download for usefulFunctions or timeout
	if GOTFILEITEMINFILTER then
		print("Downloaded itemsInFilter")
	end
end

while not GOTUSEFULFUNCTIONS do
	GOTUSEFULFUNCTIONS = false
	parallel.waitForAny(getFileUsefulFunctions, timer)-- the download for usefulFunctions or timeout
	if GOTFILEITEMINFILTER then
		print("Downloaded usefulFunctions")
	end
end
shell.run("filterOutNotSortedItems.lua")