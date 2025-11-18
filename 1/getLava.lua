local usefulFunctions = require("usefulFunctions")

while true do -- keep trying to open rednet until it is open
	usefulFunctions.openRednet()
	if rednet.isOpen() then
		break
	end
end

local fuelLevel = turtle.getFuelLevel()
print("Turtle's fuel level is " .. fuelLevel)
print("How full do you want the turtle?")
local maxLevel = tonumber(read())
local bucket = turtle.getItemDetail()
local slot = 1
local movedTotal = 0
local moveBack = 0
local rValue = false
local blockToPlace = "minecraft:cobblestone_slab"
for i = slot, 16 do--find the slot the bucket is in
	if bucket then -- if there is something in the slot
		if bucket.name == "minecraft:bucket" then -- if that something is a bucket
			slot = i -- set slot to that slot
			break
		end
	end
	if i == 16 then -- if we are at the last slot and haven't found a bucket
		print("No bucket found. Exiting...")
		return
	end
	turtle.select(i)
	bucket = turtle.getItemDetail()
end

while fuelLevel < maxLevel do -- while the fuel level is less than the max level
	if not turtle.inspect() then -- if there is no block in front of the turtle
		_, movedTotal = usefulFunctions.moveForward(movedTotal)
		turtle.placeDown()
		turtle.refuel()
	else
		rednet.send(63,"I hit a wall while getting lava fuel.")
		break
	end
	fuelLevel = turtle.getFuelLevel()
end
usefulFunctions.moveDown()
rednet.send(63, "Turtle " .. tostring(os.getComputerID()) .. " is on the way back.")
moveBack = movedTotal
local i = 1
while i <= moveBack do -- move back to the starting location
	local success = false -- to store if the turtle moved back
	success, movedTotal = usefulFunctions.moveBack(movedTotal) -- try to move back
	if success then -- 
		usefulFunctions.place(0,blockToPlace)
		i = i + 1
	else -- if the turtle couldn't move back go up one and then just move back with out placing blocks
		usefulFunctions.moveUp()
		while i <= moveBack do
			usefulFunctions.moveBack()
			i = i + 1
		end
	end
end

fuelLevel = turtle.getFuelLevel()
print("Finish! Fuel level is " .. fuelLevel)