local turtleID = os.getComputerID()-- get the computers id
rs.setOutput("bottom",true)-- set the bottom redstone signel on 
local hopper = peripheral.wrap("bottom")-- set the hopper as a readable object
if rednet.isOpen() then-- makes sure the turtle rednet is open
	print("Rednet is open.")
else
	print("Could not open rednet.")
	return
end

local itemsToFilter = require("itemsToFilter") -- items name are stored in another file
local items, turtleToMessage,spotInRow, passDirection, noHopper = itemsToFilter.items()-- loads the correct variables

if not noHopper then --if the turtle passes down to a hopper
	noHopper = false
end

local usefulFunctions = require("usefulFunctions")-- get the usefulFunctions functions

print("My turtle ID is " .. turtleID .. ".")
local fuelLevel = usefulFunctions.refuel()-- makes sure the turtle has fuel to check direction

-- face the correct way
sleep(10 - spotInRow) -- set to a value that makes sure the other turtles dont move till this turtle is done checking
local facingCorrectWay = usefulFunctions.faceTheCorrectWay("right")


print("Fuel level is " .. fuelLevel .. ".")
print("Started sorting " .. string.sub(items.top, 11) .. ", " .. string.sub(items.middle, 11) .. ", and " .. string.sub(items.bottom, 11) .. ".")

if facingCorrectWay then -- check to make sure the turtle is facing the crate
	local startup = true --  if its the first time the turtle is going through the code 
	while true do
		if startup then -- check to see if the turtle shutdown in the middle of sorting
			turtle.select(1)
			if passDirection == "left" then
				usefulFunctions.sortToCrate(items.top,items.middle,items.bottom,turtleToMessage,hopper,noHopper)
			else
				usefulFunctions.sortToCrateRight(items.top,items.middle,items.bottom,turtleToMessage,hopper,noHopper)
			end
		end
		os.pullEvent("turtle_inventory")
		turtle.select(1)
		if passDirection == "left" then
			usefulFunctions.sortToCrate(items.top,items.middle,items.bottom,turtleToMessage,hopper,noHopper)
		else
			usefulFunctions.sortToCrateRight(items.top,items.middle,items.bottom,turtleToMessage,hopper,noHopper)
		end
	end
end