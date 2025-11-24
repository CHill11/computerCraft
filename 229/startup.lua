--id = 
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
sleep(10)
print("Started...")

peripheral.find("modem", rednet.open)
if rednet.isOpen() then
	print("Rednet is open.")
else
	print("Could not open rednet.")
	return
end
local itemNames = {}
if not fs.exists(shell.resolve("itemsToPauseFor.lua")) then
	shell.run("getfile", 207, "itemsToPauseFor.lua")
end
local itemsToPauseForRaw = require("itemsToPauseFor") --- the items in the bottom row

for _, name in ipairs(itemsToPauseForRaw) do
	itemNames["minecraft:" .. name] = true -- Uses a lookup table (hash map) for fast checking
end

local pause = false

while true do
	sleep(1.3)
	pause = false
	local wasSucked = turtle.suckUp()

	if wasSucked then
		local item = turtle.getItemDetail()
		if itemNames[item.name] then
			pause = true
		end
		print(string.sub(item.name, 11) .. " Sorting...")
		turtle.drop()
		while pause do
			print("Pausing...")
			local event, id, message, protocal = os.pullEvent("rednet_message")
			if protocal == "filter" and message == "sort" then
				print("Resuming...")
				break
			end
		end
	end
end