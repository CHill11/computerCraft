local usefulFunctions = require("usefulFunctions")

local args = { ... }

if #args < 2 or #args > 2 then
    print("Usage: getlib <server_id> <library_fileName>")
    return
end

local serverID = tonumber(args[1])
local fileName = args[2]

if not serverID then -- check to make sure its a valid number
    print("Invalid server ID.")
    return
end

rednet.open("right")

usefulFunctions.getFile(fileName, serverID)
usefulFunctions.receiveFile(fileName,serverID)