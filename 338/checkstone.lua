local usefulFunctions = require("usefulFunctions")
-- Function to find the desired block in the inventory and select it.
local function selectBlockForReplacement(blockName)
    if not blockName then
        print("Error: Desired block name is not set. Aborting checks.")
        return false
    end

    -- Iterate through all 16 inventory slots
    for i = 1, 16 do
        turtle.select(i) -- Select the slot
        local item = turtle.getItemDetail() -- Get details of the item in the slot

        -- Check if the item exists AND its name matches the desired block
        if item and item.name == blockName then
            -- Block found and selected. The turtle is ready to compare and place.
            return true
        end
    end

    -- If the loop finishes without returning true, we are out of blocks.
    print("Warning: Ran out of " .. blockName .. ". Cannot continue placing.")
    return false
end

local function checkDown(blockName) --checks for the same block thats in the inventory
	-- Select the correct block before comparing or placing.
    if not selectBlockForReplacement(blockName) then
        return -- Out of blocks
    end
    if not turtle.compareDown(blockName) then
        --print("Replacing floor block...")
        usefulFunctions.digDown() -- Digs the wrong block
        if not turtle.placeDown() then
            print("Error: Failed to place block down.")
        end
    end
end

local function checkUp(blockName) --checks for the same block thats in the inventory
	if not selectBlockForReplacement(blockName) then
        return -- Out of blocks
    end
    if not turtle.compareUp() then
        --print("Replacing ceiling block...")
        usefulFunctions.digUp() -- Digs the wrong block
        if not turtle.placeUp() then
            print("Error: Failed to place block up.")
        end
    end
end

local function checkForward(blockName) --checks for the same block thats in the inventory
	if not selectBlockForReplacement(blockName) then
        return -- Out of blocks
    end
    if not turtle.compare() then
        print("Replacing wall block...")
        usefulFunctions.dig() -- Digs the wrong block
        if not turtle.place() then
            print("Error: Failed to place block forward.")
        end
    end
end

--start of main 
print("Make sure the turtle is placed in the left side of the tunnel")
print("How far to check walls?")
local dist = tonumber(read())
if not dist or dist < 1 then
	print("Error: Invalid distance. Exiting.")
	return
end
local blocks = nil
turtle.select(1)
local itemInSlot1 = turtle.getItemDetail()
local blockName

if itemInSlot1 then
	blockName = itemInSlot1.name
	print("Block name found. Block is " .. blockName)
	print("Starting block replacement...")
else
	print("Error:No blocks found.")
	return
end
for i = 1, 3 do --Check the floor
    for o = 1, dist do --go the lenght the user specified
        checkDown(blockName)
        usefulFunctions.moveForward()
        print("i is " .. i)
        print("o is " .. o)
    end
	if i == 3 then
		checkDown(blockName)
		break
	end
	if i % 2 == 1 then --check the direction to turn
			usefulFunctions.turnRight()
			checkDown(blockName)
			usefulFunctions.moveForward()
			usefulFunctions.turnRight()
			print("I is " .. i)
		else
			print("I is " .. i)
			usefulFunctions.turnLeft()
			checkDown(blockName)
			usefulFunctions.moveForward()
			usefulFunctions.turnLeft()
	end    
end--end of check the floor
usefulFunctions.turnRight() --face the right wall
for i = 1, 3 do--check right wall
	for o = 1, dist do--go the lenght the user specified
		if i % 2 == 1 then--check the direction to turn
			checkForward(blockName)
			usefulFunctions.turnRight()
			usefulFunctions.moveForward()
			usefulFunctions.turnLeft()
			checkForward(blockName)
		else
			checkForward(blockName)
			usefulFunctions.turnLeft()
			usefulFunctions.moveForward()
			usefulFunctions.turnRight()
			checkForward(blockName)
		end
	end
	usefulFunctions.moveUp()
end--end of check right wall
usefulFunctions.turnLeft()--face down the tunnel
for i = 1, 3 do --Check the ceiling
    for o = 1, dist do --go the lenght the user specified
        checkUp(blockName)
        usefulFunctions.moveForward()
        print("i is " .. i)
        print("o is " .. o)
    end
	if i == 3 then
		checkUp(blockName)
		break
	end
	if i % 2 == 1 then --check the direction to turn
			usefulFunctions.turnLeft()
			checkUp(blockName)
			usefulFunctions.moveForward()
			usefulFunctions.turnLeft()
			print("I is " .. i)
		else
			print("I is " .. i)
			usefulFunctions.turnRight()
			checkUp(blockName)
			usefulFunctions.moveForward()
			usefulFunctions.turnRight()
	end    
end--end of check the ceiling
usefulFunctions.turnLeft()
for i = 1, 3 do--check left wall
	for o = 1, dist do--go the lenght the user specified
		if i % 2 == 1 then--check the direction to turn
			checkForward(blockName)
			usefulFunctions.turnLeft()
			usefulFunctions.moveForward()
			usefulFunctions.turnRight()
			checkForward(blockName)
		else
			checkForward(blockName)
			usefulFunctions.turnRight()
			usefulFunctions.moveForward()
			usefulFunctions.turnLeft()
			checkForward(blockName)
		end
	end
	usefulFunctions.down()
end--end of check left wall
usefulFunctions.turnRight()
print("Finished")