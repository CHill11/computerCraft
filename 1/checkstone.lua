-- Function to find the desired block in the inventory and select it.
local function selectBlockForReplacement()
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
	cont = false
    return false
end

local function checkDown() --checks for the same block thats in the inventory
	-- Select the correct block before comparing or placing.
    if not selectBlockForReplacement() then
        return -- Out of blocks
    end
    if not turtle.compareDown() then
        --print("Replacing floor block...")
        turtle.digDown() -- Digs the wrong block
        if not turtle.placeDown() then
            print("Error: Failed to place block down.")
        end
    end
end

local function checkUp() --checks for the same block thats in the inventory
	if not selectBlockForReplacement() then
        return -- Out of blocks
    end
    if not turtle.compareUp() then
        --print("Replacing ceiling block...")
        turtle.digUp() -- Digs the wrong block
        if not turtle.placeUp() then
            print("Error: Failed to place block up.")
        end
    end
end

local function checkForward() --checks for the same block thats in the inventory
	if not selectBlockForReplacement() then
        return -- Out of blocks
    end
    if not turtle.compare() then
        print("Replacing wall block...")
        turtle.dig() -- Digs the wrong block
        if not turtle.place() then
            print("Error: Failed to place block forward.")
        end
    end
end

local function forward()
    -- Use a loop to try moving forward, digging if necessary.
    while not turtle.forward() do
        -- If forward fails, it means there is a block in the way.
        -- We try to dig it out. If it is the desired block, we exit (problem).
        -- Here, we assume anything blocking the path shouldn't be there.
        if turtle.detect() then
            print("Path blocked. Digging...")
            turtle.dig()
        else
            -- If we can't move and there's nothing to dig (e.g., edge of world, full inventory)
            error("Cannot move forward. Aborting.")
        end
    end
end



--start of main 
print("Make sure the turtle is placed in the left side of the tunnel")
print("How far to check walls?")
dist = tonumber(read())
cont = true
if not dist or dist < 1 then
	print("Error: Invalid distance. Exiting.")
	return
end
blocks = nil
turtle.select(1)
itemInSlot1 = turtle.getItemDetail()

if itemInSlot1 then
	blockName = itemInSlot1.name
	print("Block name found. Block is " .. blockName)
	print("Starting block replacement...")
else
	print("Error:No blocks found.")
	return
end
for i = 1, 3 do --Check the floor
    for o = 1, (dist - 1) do --go the lenght the user specified
		if cont == false then
			return
		end
        checkDown()
        forward()
        print("i is " .. i)
        print("o is " .. o)
    end
	if i == 3 then
		checkDown()
		break
	end
	if i % 2 == 1 then --check the direction to turn
			turtle.turnRight()
			checkDown()
			forward()
			turtle.turnRight()
			print("I is " .. i)
		else
			print("I is " .. i)
			turtle.turnLeft()
			checkDown()
			forward()
			turtle.turnLeft()
	end    
end--end of check the floor
turtle.turnRight() --face the right wall
for i = 1, 3 do--check right wall
	for o = 1, (dist - 1) do--go the lenght the user specified
		if i % 2 == 1 then--check the direction to turn
			checkForward()
			turtle.turnRight()
			forward()
			turtle.turnLeft()
			checkForward()
		else
			checkForward()
			turtle.turnLeft()
			forward()
			turtle.turnRight()
			checkForward()
		end
	end
	if i <= 2 then
		turtle.up()
	end
end--end of check right wall
turtle.turnLeft()--face down the tunnel
for i = 1, 3 do --Check the ceiling
    for o = 1, (dist - 1) do --go the lenght the user specified
        checkUp()
        forward()
        print("i is " .. i)
        print("o is " .. o)
    end
	if i == 3 then
		checkUp()
		break
	end
	if i % 2 == 1 then --check the direction to turn
			turtle.turnLeft()
			checkUp()
			forward()
			turtle.turnLeft()
			print("I is " .. i)
		else
			print("I is " .. i)
			turtle.turnRight()
			checkUp()
			forward()
			turtle.turnRight()
	end    
end--end of check the ceiling
turtle.turnLeft()
for i = 1, 3 do--check left wall
	for o = 1, (dist - 1) do--go the lenght the user specified
		if i % 2 == 1 then--check the direction to turn
			checkForward()
			turtle.turnLeft()
			forward()
			turtle.turnRight()
			checkForward()
		else
			checkForward()
			turtle.turnRight()
			forward()
			turtle.turnLeft()
			checkForward()
		end
	end
	turtle.down()
end--end of check left wall
turtle.turnRight()
print("Finished")
