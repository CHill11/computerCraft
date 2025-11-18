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
local itemsToPauseForRaw = {"red_stained_glass_pane","black_stained_glass_pane","purple_stained_glass_pane","yellow_stained_glass_pane","magenta_stained_glass_pane","spruce_fence","acacia_fence","cherry_fence","sticky_piston"}

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
