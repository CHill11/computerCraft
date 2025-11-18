local usefulFunctions = {}--the array of functions

function usefulFunctions.moveForward(moved,dug)
	local moved = moved or 0
	local dug = dug or 0
	if turtle.detect() then
		assert(turtle.dig())
		dug = dug + 1
	end
	if turtle.forward() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

function usefulFunctions.moveUp(moved,dug)
	local moved = moved or 0
	local dug = dug or 0
	if turtle.detectUp() then
		assert(turtle.digUp())
		dug = dug + 1
	end
	if turtle.up() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

function usefulFunctions.moveDown(moved,dug)
	local moved = moved or 0
	local dug = dug or 0
	if turtle.detectDown() then
		assert(turtle.digDown())
		dug = dug + 1
	end
	if turtle.down() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

function usefulFunctions.moveBack(moved)
	local moved = moved or 0
	if turtle.back() then
		moved = moved + 1
		return true, moved
	else
		return false, moved
	end
end

function usefulFunctions.dig(num)
	num = num or 0
	while turtle.detect() do
		turtle.dig()
		num = num + 1
		sleep(0.3)
	end
	return num
end

function usefulFunctions.digUp(num)
	num = num or 0
	while turtle.detectUp() do
		turtle.digUp()
		num = num + 1
		sleep(0.3)
	end
	return num
end

function usefulFunctions.digDown(num)
	num = num or 0
	if turtle.detectDown() then
		turtle.digDown()
		num = num + 1
		return num
	end
end

function usefulFunctions.emptyInv(start, stop)
	local start = start or 1
	local stop = stop or 16
	for i = start, stop do
		turtle.select(i)
		turtle.drop()
		if i == stop then
			return true
		end
	end
	return false
end
	
function usefulFunctions.emptyInvDown(start, stop)
	local start = start or 1
	local stop = stop or 16
	for i = start, stop do
		turtle.select(i)
		turtle.dropDown()
		if i == stop then
			return true
		end
	end
	return false
end
	
function usefulFunctions.turnAround(facing)
    facing = usefulFunctions.turnRight(facing)
    facing = usefulFunctions.turnRight(facing)
	return facing
end
	
function usefulFunctions.hasBlock(block)
    local block = block or ""
	local placeableBlocks = {
        -- WOOD LOGS (Regular and Stripped)
        "minecraft:oak_log", "minecraft:stripped_oak_log",
        "minecraft:spruce_log", "minecraft:stripped_spruce_log",
        "minecraft:birch_log", "minecraft:stripped_birch_log",
        "minecraft:jungle_log", "minecraft:stripped_jungle_log",
        "minecraft:acacia_log", "minecraft:stripped_acacia_log",
        "minecraft:dark_oak_log", "minecraft:stripped_dark_oak_log",
        "minecraft:mangrove_log", "minecraft:stripped_mangrove_log",
        "minecraft:cherry_log", "minecraft:stripped_cherry_log",
        "minecraft:crimson_stem", "minecraft:stripped_crimson_stem",  -- Nether Woods
        "minecraft:warped_stem", "minecraft:stripped_warped_stem",    -- Nether Woods
        "minecraft:bamboo_block", "minecraft:stripped_bamboo_block",  -- Bamboo

        -- WOOD PLANKS
        "minecraft:oak_planks",
        "minecraft:spruce_planks",
        "minecraft:birch_planks",
        "minecraft:jungle_planks",
        "minecraft:acacia_planks",
        "minecraft:dark_oak_planks",
        "minecraft:mangrove_planks",
        "minecraft:cherry_planks",
        "minecraft:bamboo_planks",
        "minecraft:crimson_planks",
        "minecraft:warped_planks",
        "minecraft:bamboo_mosaic", -- A unique plank-like block
        
        -- CORE BUILDING MATERIALS (from previous list)
        "minecraft:stone",
        "minecraft:cobblestone",
        "minecraft:dirt",
        "minecraft:gravel",
        "minecraft:sand"
        }

    for i = 1, 16 do --search the whole inventory for a block
        turtle.select(i)
        local stack = turtle.getItemDetail()
        if stack and stack.count > 0 then
        local itemName = stack.name --get just the items name
            if block == "" then 
                for _, block_id in ipairs(placeableBlocks) do--check the item to see if it matches an approved block
                    if itemName == block_id then
                        print("Placing " .. string.sub(itemName, 11))
                        return true
                    end
                end
            else
                if itemName == block then--get the specific block
                    print("Placing " .. string.sub(itemName, 11))
                    return true
                end
            end
        end
    end
    turtle.select(1)
    return false
end
	
function usefulFunctions.placeLeft(num)
	local num = num or 0
    if usefulFunctions.hasBlock() then
		turtle.turnLeft()
        turtle.place()
		turtle.turnRight()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end
	
function usefulFunctions.placeRight(num, blockName)
	local num = num or 0
	local blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
		turtle.turnRight()
        turtle.place()
		turtle.turnLeft()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end
	
function usefulFunctions.placeUp(num, blockName)
	local num = num or 0
	local blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
        turtle.placeUp()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end

function usefulFunctions.placeDown(num, blockName)
	local num = num or 0
	local blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
        turtle.placeDown()
		num = num + 1
    else
        print("Out of blocks.")
        return false, num
    end
    return true, num
end

function usefulFunctions.place(num, blockName)
	local num = num or 0
	local blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
        turtle.place()
		num = num + 1
    else
        print("Out of blocks.")
        return false
    end
    return true
end

function usefulFunctions.faceTheCorrectWay(direction)
	local direction = direction or "left"
	local facingCorrectWay = false
	if direction == "left" then
		for _ = 1,4 do 
			if turtle.back() then -- if it can move back then it is facing the correct way
				turtle.forward()
				return true -- if turtle is facing the crate
			else 
				turtle.turnRight()
			end
		end
	elseif direction == "right" then
		for _ = 1,4 do 
			if turtle.back() then -- if it can move back then it is facing the correct way
				turtle.forward()
				return true -- if turtle is facing the crate
			else 
				turtle.turnLeft()
			end
		end
	end
	return false-- if it can get the correct way
end

function usefulFunctions.sortToCrate(top,middle,bottom,turtleToMessage,hopper,noHopper)-- pass to the left
	local item = turtle.getItemDetail() --gets the item name
	if item then -- see if turle has an item
		if item.name == top then -- checks the item name against the top variable
			print("Sorting " .. string.sub(item.name, 11))
			turtle.dropUp()-- drops the item in to the correct crate
		elseif item.name == bottom then
			print("Sorting " .. string.sub(item.name, 11))
			turtle.dropDown()
			if not noHopper then--dont set redstone 
				rs.setOutput("bottom",false)-- turns off the redstone signal so tht the hopper will empty
				while true do --check to see if hopper has items
					local hopInv = hopper.list()
					local totalCount = 0
					for _, stack in pairs(hopInv) do
						totalCount = totalCount + stack.count
					end
					--print(totalCount)
					if totalCount == 0 then
						rednet.send(turtleToMessage,"sort")-- let the upstream turtle know they can resume sorting
						break
					end
					sleep(0.5)
					print("Going to sleep. Hopper contains " .. totalCount .. " total item(s).")
					--print(textutils.serialize(hopInv)) -- Print table content for debugging
				end
			else
				rednet.send(turtleToMessage,"sort")-- let the upstream turtle know they can resume sorting
			end
			print("Resuming...")
			rs.setOutput("bottom",true)-- turns on the redstone signal so that the hopper won't suck the items out of the turtle
		elseif item.name == middle then
			print("Sorting " .. string.sub(item.name, 11))
			turtle.drop()
		else
			print("Passing along " .. string.sub(item.name, 11)) 
			turtle.turnLeft()
			turtle.drop()
			turtle.turnRight()
		end
	end
end

function usefulFunctions.sortToCrateRight(top,middle,bottom,turtleToMessage,hopper,noHopper)-- pass to the right
	local item = turtle.getItemDetail() --gets the item name
	if item then -- see if turle has an item
		if item.name == top then -- checks the item name against the top variable
			print("Sorting " .. string.sub(item.name, 11))
			turtle.dropUp()-- drops the item in to the correct crate
		elseif item.name == bottom then
			print("Sorting " .. string.sub(item.name, 11))
			turtle.dropDown()
			if not noHopper then--dont set redstone
				rs.setOutput("bottom",false)-- turns off the redstone signal so tht the hopper will empty
				while true do --check to see if hopper has items
					local hopInv = hopper.list()
					local totalCount = 0
					for _, stack in pairs(hopInv) do
						totalCount = totalCount + stack.count
					end
					--print(totalCount)
					if totalCount == 0 then
						rednet.send(turtleToMessage,"sort")-- let the upstream turtle know they can resume sorting
						break
					end
					sleep(0.5)
					print("Going to sleep. Hopper contains " .. totalCount .. " total item(s).")
					--print(textutils.serialize(hopInv)) -- Print table content for debugging
				end
			end
			print("Resuming...")
			rs.setOutput("bottom",true)-- turns on the redstone signal so that the hopper won't suck the items out of the turtle
		elseif item.name == middle then
			print("Sorting " .. string.sub(item.name, 11))
			turtle.drop()
		else
			print("Passing along " .. string.sub(item.name, 11)) 
			turtle.turnRight()
			turtle.drop()
			turtle.turnLeft()
		end
	end
end

function usefulFunctions.refuel()
	local fuelLevel = turtle.getFuelLevel()
	if fuelLevel < 10 then
		print("Fuel is getting low!")
	end
	if fuelLevel == 0 then
		print("Out of fuel!")
		print("Waiting for a fuel item into slot 1")
		while fuelLevel < 500 do
			turtle.refuel()
			fuelLevel = turtle.getFuelLevel()
		end
	end
	return fuelLevel
end

function usefulFunctions.getFile(fileName, serverID)--request a file from a computer
	local sent = rednet.send(serverID, {
					type = "file_request",
					fileName = fileName
					})
	if sent then
		print("Sent a request to id: " .. serverID)
	else
		print("Error:Did not complete the sending of the request.")
	end
end

function usefulFunctions.receiveFile(fileName,serverID)-- receive a file from a computer and saves it locally
	local id, message, protocol = rednet.receive()
	--debug prints
	print("id" .. id)
	if message then
		print("message")
		for _,v in pairs(message) do
			print(v)
		end
	end
	print("received id" .. id)
	print("serverID" .. serverID)
	--check to make sure the content of the message was correct
	if id == serverID and type(message) == "table" and message.type == "file_response" and message.fileName == fileName then
		if message.error then
			print("Error from server: " .. message.error)
		elseif message.content then
        -- 3. Save the file locally
			local file = fs.open(fileName, "w")
			file.write(message.content)
			file.close()
			print("Successfully downloaded and saved: " .. fileName)
		else
			print("Received an incomplete response.")
		end
	else
		print("Did not receive a valid response from the server.")
	end
end

function usefulFunctions.sendFile(fileName, id)
    if fs.exists(fileName) and not fs.isDir(fileName) then
        local file = fs.open(fileName, "r")
        local content = file.readAll()
        file.close()
        -- Send the content back to the requesting computer
        rednet.send(id, {
						type = "file_response",
						fileName = fileName,
						content = content
        })
        print("Sent " .. fileName .. " to ID " .. id)
    else
        -- Send an error response
        rednet.send(id, {
            type = "file_response",
            fileName = fileName,
            error = "File not found or is a directory."
        })
        print("File not found: " .. fileName .. " for ID " .. id)
    end
end

function usefulFunctions.openRednet()
	local modem = peripheral.find("modem", rednet.open)
	if rednet.isOpen() then	
		return modem, true
	else
		return false
	end
end

--------------------------------------gps findLocation-------------------------------
--use to get back to a specific block in the x axis

--[[
x is location the turtle is now, 
location is the place you want the turtle to end, 
facing is if kepping track of which way the turtle is facing should be a direction--]]
function usefulFunctions.x(x, location, facing)-- east west  
-- tutle is at the correct location
	print(facing)
	if x == location then
	print("Already at x:" .. location)
		return true
	end
	
	if x > location then 		
		print("west")
		if facing == "north" or facing == "east" or facing == "south" or facing == "west" then
			while true do
				facing = usefulFunctions.turnRight(facing)
				if facing == "west" then
					break
				end
			end
		else
			usefulFunctions.eastWest(x,"west")
		end
			
		while true do
			x,_,_ = gps.locate()
			if x == location then
				return true, facing
			end
			usefulFunctions.moveForward()
		end
	else 
		print("east")
		if facing  == "north" or facing == "east" or facing == "south" or facing == "west" then
			while true do
				facing = usefulFunctions.turnRight(facing)
				if facing == "east" then
					break
				end
			end
		else
			usefulFunctions.eastWest(x,"east")
		end
		
		while true do
			x,_,_ = gps.locate()
			if x == location then
				return true, facing
			end
			usefulFunctions.moveForward()
		end
	end
end

--use to get back to a specific block in the y axis
function usefulFunctions.y(y, location) -- up down
	if y == location then
	print("Already at y:" .. location)
		return true
	end
	if y < location then -- turtle is below the location
		--print("turtle is below the location")
		while true do
			usefulFunctions.moveUp()
			local _,newY,_ = gps.locate()
			if newY == location then
				return true
			end
		end
	elseif y > location then -- turtle is above the location
		--print("turtle is above the location")
		while true do
			usefulFunctions.moveDown()
			local _,newY,_ = gps.locate()
			if newY == location then
				return true
			end
		end
	end
end

--use to get back to a specific block in the z axis
--[[
z is location the turtle is now, 
location is the place you want the turtle to end, 
facing is if kepping track of which way the turtle is facing should be a direction--]]
function usefulFunctions.z(z, location, facing)-- north south
	-- tutle is at the corect location
	if z == location then
	print("Already at z:" .. location)
		return true
	end
	
	if z > location then 
		print("north")
		if facing == "north" or facing == "east" or facing == "south" or facing == "west" then
			while true do
				facing = usefulFunctions.turnRight(facing)
				if facing == "north" then
					break
				end
			end
		else
			usefulFunctions.northSouth(z,"north")
		end
		while true do
			_,_,z = gps.locate()
			if z == location then
				return true, facing
			end
			usefulFunctions.moveForward()
		end
	else 
		print("south")
		if facing == "north" or facing == "east" or facing == "south" or facing == "west" then
			while true do
				facing = usefulFunctions.turnRight(facing)
				if facing == "south" then
					break
				end
			end
		else
			usefulFunctions.northSouth(z,"north")
		end
		while true do
			_,_,z = gps.locate()
			if z == location then
				return true, facing
			end
			usefulFunctions.moveForward()
		end
	end
end

--use to find the direction the turtle is facing in the x axis east/west
function usefulFunctions.eastWest(x,direction)
	local direction = direction or "" 
	-- find the x direction that the turtle is facing
	x = usefulFunctions.reverseSign(x)
	
	local turned = 0
	local newX = x
	while x == newX do
		local digAndReplace = false
		turtle.turnRight()
		turned = turned + 1
		if turtle.inspect() then
			turtle.select(10)
			digAndReplace = true
		end
		usefulFunctions.moveForward()
		newX,_,_ = gps.locate()
		newX = newX^2
		newX = math.sqrt(newX)
		turtle.back()
		if digAndReplace then
			turtle.select(10)
			turtle.place()
		end
	end
	if newX > x then -- newX is bigger. Went West
		if direction == "east" then
			turtle.turnLeft()
			turtle.turnLeft()
			print("Facing East")
			return direction, turned
		else
			direction = "west"
			print("Facing West")
			return direction, turned
		end
	else -- newX is smaller. Went East
		if direction == "west" then
			turtle.turnLeft()
			turtle.turnLeft()
			print("Facing West")
			return direction, turned
		else
			direction = "east"
			print("Facing East")
			return direction, turned
		end
	end		
end

--use to find the direction the turtle is facing in the z axis north/south
function usefulFunctions.northSouth(z,direction)
	local direction = direction or "" 
	-- find the z direction that the turtle is facing
	z = usefulFunctions.reverseSign(z)
	
	local turned = 0
	local newz = z
	while z == newz do
		local digAndReplace = false
		turtle.turnRight()
		turned = turned + 1
		if turtle.inspect() then
			turtle.select(10)
			digAndReplace = true
		end
		usefulFunctions.moveForward()
		_,_,newz = gps.locate()
		newz = newz^2
		newz = math.sqrt(newz)
		turtle.back()
		if digAndReplace then
			turtle.select(10)
			turtle.place()
		end
	end

		-- figure out what direction to go in
	if newz > z then -- newz is bigger. Went south
		if direction == "north" then
			turtle.turnLeft()
			turtle.turnLeft()
			print("Facing North")
			return direction, turned
		else
			direction = "south"
			print("Facing South")
			return direction, turned
		end
	else -- newz is smaller. Went north
		if direction == "south" then
			turtle.turnLeft()
			turtle.turnLeft()
			print("Facing South")
			return direction, turned
		else
			direction = "north"
			print("Facing North")
			return direction, turned
		end
	end		
end

--use to keep track of the direction the turtle is facing
function usefulFunctions.turnRight(direction)
print("in turnRight. " .. direction)
	local directions = {"north","east","south","west"}
	local index = 0
	for i,dir in ipairs(directions) do--get the index of the correct direction
		if direction == dir then
			index = i
			break
		end
	end
	--print("index is " .. index)--debug
	turtle.turnRight()
	
	index = (index + 1) % 4
	if index == 0 then
		index = 4
	end
	
	--print("about to exit turnRight " .. directions[index])--debug
	return directions[index]
end
	
--use to keep track of the direction the turtle is facing
function usefulFunctions.turnLeft(direction)
	local directions = {"north","east","south","west"}
	local index = 0
	for i,dir in ipairs(directions) do--get the index of the correct direction
		if direction == dir then
			index = i
			break
		end
	end
	--print("index is " .. index)--debug
	turtle.turnLeft()
	index = index - 1
	if index  == 0 then
		index = 4
	end
	--print("about to exit turnLeft " .. directions[index])--debug
	return directions[index]
end

function usefulFunctions.sign(num)
    if num > 0 then
        return 1
    elseif num < 0 then
        return -1
    else
        return 0
    end
end

function usefulFunctions.reverseSign(num)
	if usefulFunctions.sign(num) == -1 then -- see if x is a negative number
		num = num^2
		num = math.sqrt(num)
		isNegative = true 
	end
	return num, isNegative
end

--------------------------------------end of gps ------------------------------------

-------------------------functions for displaying to the terminal--------------------

-- Helper function to wrap a single line segment
function usefulFunctions.wrapSegment(text_segment, width, currentX, currentY)
    local x = currentX
    local y = currentY
    
    -- Pattern matches non-space sequences (words) plus any trailing space
    for word in string.gmatch(text_segment, "(%S+%s*)") do
        if x + string.len(word) > width and x > 1 then
            -- If the next word goes past the width, move to a new line
            y = y + 1
            x = 1
            term.setCursorPos(x, y)
        end
        
        -- Write the word
        -- **NOTE:** This assumes term.write() still does not respect \n, 
        -- but we've already split the string by \n in the main function.
        term.write(word)
        x = x + string.len(word)
    end
    
    return x, y -- Return the final cursor position
end

function usefulFunctions.printWrap(text)
    local width, _ = term.getSize()
    local x, y = term.getCursorPos()
    
    local segments = {}
    
    -- Split the string by the newline character.
    -- This pattern uses the newline as a delimiter.
    local pattern = "([^\n]*)\n?"
    local last_end = 1
    
    -- Use gmatch to find and capture each line segment
    for segment in string.gmatch(text .. "\n", pattern) do
        -- Only insert non-empty segments (the check is cleaner here)
        if #segment > 0 then
            table.insert(segments, segment)
        end
    end
    
    -- Edge case: If the entire string was empty, it won't have any segments
    if #segments == 0 and #text > 0 then
        table.insert(segments, text)
    end
    
    -- 2. Process each segment
    for i, segment in ipairs(segments) do
        -- Assuming usefulFunctions.wrapSegment updates x and y correctly
        x, y = usefulFunctions.wrapSegment(segment, width, x, y) 
        
        -- After processing a segment, we need to explicitly move to the start 
        -- of the next line, unless it's the very last segment.
        if i < #segments then
            y = y + 1
            x = 1
            term.setCursorPos(x, y)
        end
    end
end

--------------------------------end of display functions------------------------------
return usefulFunctions