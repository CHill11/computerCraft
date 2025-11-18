--id = 174
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
sleep(10)
print("Started...")

rednet.open("right")
local itemNames = {}
local itemsToPauseForRaw = {"oak_slab","spruce_slab","birch_slab","jungle_slab","acacia_slab","dark_oak_slab","mangrove_slab","cherry_slab","pale_oak_slab"}

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
			local event, id, message = os.pullEvent("rednet_message")
			if message == "sort" then
				print("Resuming...")
				break
			end
		end
	end
end