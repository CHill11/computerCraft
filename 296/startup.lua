local turtleID = os.getComputerID()
local usefulFunctions = require("usefulFunctions")

-- Open the modem on a side (e.g., "right")
local modem = usefulFunctions.openRednet()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")

local crate = peripheral.wrap("front")

function timer()
	sleep(10)
end

function sortCharcoal()
	while true do
		os.pullEvent("turtle_inventory")
		turtle.drop()
	end
end

while true do
	local crateList = crate.list()
	local amount = 0
	for _,item in pairs(crateList) do
		amount = amount + item.count
	end
	rednet.send(155, amount)
	print("Charcoal:" .. amount)
	parallel.waitForAny(sortCharcoal,timer)
end