--id = 
MAIN_COMMAND_COMPUTER = 207
ROW_COMMAND_COMPUTER = 255

local function timer()-- the timeout timer for downloading usefulFunctions
	sleep(5)
end

local function serverGetFiles()
	local serverFilesToUpdate = require("serverFilesToUpdate")
	local fileName = serverFilesToUpdate.FILES()
	for _,names in ipairs(fileName) do
		if shell.run("getfile.lua",MAIN_COMMAND_COMPUTER, names) then
			print("Updated ", names)
		else
			print("Could not update ", names)
		end
	end
end

local function rowGetFiles()
	local fileNames = require("rowFilesToUpdate")
	for _,names in ipairs(fileNames) do
		if shell.run("getfile.lua",ROW_COMMAND_COMPUTER, names) then
			print("Updated " .. names)
		else
			print("Error updateing " .. names)
		end
	end
end

------------------main------------------------------------
if term.isColor() then -- server update
	print("in Color")
	repeat
		local success = false
		print(fs.exists(shell.resolve("serverFilesToUpdate.lua")))
		if fs.exists(shell.resolve("serverFilesToUpdate.lua")) then
			local firstToFinish = parallel.waitForAny(serverGetFiles,timer)
			if firstToFinish == 1 then
				success = true
			end
		else
			repeat
				local gotServerFilesToUpdate = false
				shell.run("getfile.lua",MAIN_COMMAND_COMPUTER,"serverFilesToUpdate.lua")
				if fs.exists(shell.resolve("serverFilesToUpdate.lua")) then
					gotServerFilesToUpdate = true
				end
			until gotServerFilesToUpdate == true
		end
	until success == true
	term.clear()
	term.setCursorPos(1,1)
	shell.run("startFileShare")

else-- row update
	while not fs.exists(shell.resolve("itemsToFilter.lua")) do
		shell.run("getfile",ROW_COMMAND_COMPUTER,"itemsToFilter.lua")
	end
	repeat
		os.sleep(3)
		local success = false
		if fs.exists(shell.resolve("rowFilesToUpdate.lua")) then
			local firstToFinish = parallel.waitForAny(rowGetFiles,timer)
			if firstToFinish == 1 then
				success = true
			end
		else
			repeat
				local gotRowFilesToUpdate = false
				shell.run("getfile.lua",MAIN_COMMAND_COMPUTER,"rowFilesToUpdate.lua")
				if fs.exists(shell.resolve("rowFilesToUpdate.lua")) then
					gotRowFilesToUpdate = true
				end
			until gotRowFilesToUpdate == true
		end
	until success == true
	term.clear()
	term.setCursorPos(1,1)
	shell.run("rowFilter")
end