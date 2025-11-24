local usefulFunctions = require("usefulFunctions")
if usefulFunctions.openRednet() then
	shell.run("startupForRowFilter.lua")
end