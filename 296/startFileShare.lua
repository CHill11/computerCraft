local usefulFunctions = require("usefulFunctions")

-- Open the modem on a side (e.g., "right")
local modem = usefulFunctions.openRednet()
local serverID = os.getComputerID()
print("Server running on ID: " .. serverID)

while true do
    local id, message, protocol = rednet.receive()
    if type(message) == "table" then
		if message.type == "file_request" then
			if message.fileName then
				print("Received request for " .. message.fileName .. " from ID " .. id)
				usefulFunctions.sendFile(message.fileName, id)
			else
				print("message.fileName")
				print(message.fileName)
			end
		else
			print("message.type == file_request")
		end
	else
		print("message does not == table")
    end
end
