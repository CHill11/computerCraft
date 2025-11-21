--id = 
MAIN_COMMAND_COMPUTER = 207
ROW_COMMAND_COMPUTER = nil

local function timer()-- the timeout timer for downloading usefulFunctions
	sleep()
end

local function serverGetFiles()
	local serverFilesToUpdate = require("serverFilesToUpdate")
	local fileName = serverFilesToUpdate()
	for _,names in ipairs(fileName) do
		if shell.run("getfile.lua",MAIN_COMMAND_COMPUTER, names) then
			print("Updated ", names)
		else
			print("Could not update ", names)
		end
	end
end

local function rowGetFiles()
	local rowFilesToUpdate = require("rowFilesToUpdate")
	local fileName = rowFilesToUpdate.files()
	for _,names in ipairs(fileName) do
		if shell.run("getfile.lua",MAIN_COMMAND_COMPUTER, names) then
			print("Updated " .. names)
		else
			print("Error updateing " .. names)
		end
	end
end

------------------main------------------------------------
if term.isColor() then -- server update
	repeat
		local success = false
		if fs.exists(shell.resolve("serverFilesToUpdate.lua")) then
			local firstToFinish = parallel.waitForAny(serverGetFiles,timer)
			if firstToFinish == 1 then
				shell.run("startFileShare")
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
else-- row update
	repeat
		local success = false
		if fs.exists(shell.resolve("rowFilesToUpdate.lua")) then
			local firstToFinish = parallel.waitForAny(rowGetFiles,timer)
			if firstToFinish == 1 then
				shell.run("startFileShare")
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
	shell.run("rowFilter")
end