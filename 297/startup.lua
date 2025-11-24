if not fs.exists(shell.resolve("usefulFunctions.lua")) then
	shell.run("getfile",207,"usefulFunctions.lua")
end
local usefulFunctions = require("usefulFunctions")
local hopper = peripheral.wrap("back")

while true do
	term.clear()
	term.setCursorPos(1,1)
	print("ID is " .. os.getComputerID())
	local charcoal = 0
	local hopperInv = hopper.list()
	for _,items in pairs(hopperInv) do
		if items.name == "minecraft:charcoal" then
			charcoal = charcoal + items.count
		end
	end
	if charcoal > 64 then
		redstone.setOutput("back",false)
	else
		redstone.setOutput("back",true)
	end
	print("Charcoal ammount:" .. charcoal)
	usefulFunctions.wait(5,5)
end