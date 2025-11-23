local usefulFunctions = require("usefulFunctions")
local fileName = "startupForRowFilter.lua"
local searchPattern = ""
local replaceString = ""
usefulFunctions.openRednet()

local gotStartupForRowFilter = false
if fs.exists(shell.resolve("startupForRowFilter.lua")) then -- delete the existing file
   fs.delete(shell.resolve("startupForRowFilter.lua"))
end
while not gotStartupForRowFilter do -- get the new file
    if shell.run("getfile.lua",207,"startupForRowFilter.lua") and fs.exists(shell.resolve("startupForRowFilter.lua")) then
        gotStartupForRowFilter = true
    end
end
usefulFunctions.modifyFile(fileName,searchPattern,replaceString)
print("About to start...")
usefulFunctions.wait(3,3)
shell.run("startupForRowFilter.lua")