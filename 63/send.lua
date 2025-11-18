usefulFunctions = require("usefulFunctions")
if not rednet.isOpen() then
	usefulFunctions.openRednet()
end

local id, message = ...

if not id then id = 1 end

if not message then	message = "continue" end

rednet.send(tonumber(id),tostring(message))	
