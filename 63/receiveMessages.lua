local usefulFunctions = require("usefulFunctions")

if not rednet.isOpen() then
    usefulFunctions.openRednet()
end

while true do
	local id,message = rednet.receive()
	print("Turtle or computer " .. id .. " need attention.")
	print(message)
end