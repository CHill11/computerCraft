local usefulFunctions = {}--the array of functions

---Trys to move forward and if a block is in the way it digs it
---@param moved number?
---@param dug number?
---@return boolean success
---@return number moved
---@return number dug
function usefulFunctions.moveForward(moved,dug)
	moved = moved or 0
	dug = dug or 0
	if turtle.detect() then
		dug = usefulFunctions.dig(dug)
	end
	if turtle.forward() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

---Trys to move up and if a block is in the way it digs it
---@param moved number?
---@param dug number?
---@return boolean success
---@return number moved
---@return number dug
function usefulFunctions.moveUp(moved,dug)
	moved = moved or 0
	dug = dug or 0
	if turtle.detectUp() then
		dug = usefulFunctions.digUp(dug)
	end
	if turtle.up() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

---Trys to move down and if a block is in the way it digs it
---@param moved number?
---@param dug number?
---@return boolean success
---@return number moved
---@return number dug
function usefulFunctions.moveDown(moved,dug)
	moved = moved or 0
	dug = dug or 0
	if turtle.detectDown() then
		dug = usefulFunctions.digDown(dug)
	end
	if turtle.down() then
		moved = moved + 1
		return true, moved, dug
	else
		return false, moved, dug
	end
end

---Moves back
---@param moved number?
---@return boolean success
---@return number moved
function usefulFunctions.moveBack(moved)
	moved = moved or 0
	if turtle.back() then
		moved = moved + 1
		return true, moved
	else
		return false, moved
	end
end

---Digs the block in front
---@param dug number?
---@return number dug
function usefulFunctions.dig(dug)
	dug = dug or 0
	while turtle.detect() do
		turtle.dig()
		dug = dug + 1
		os.sleep(0.3)
	end
	return dug
end

---commentDigs the block up
---@param dug number?
---@return number dug
function usefulFunctions.digUp(dug)
	dug = dug or 0
	while turtle.detectUp() do
		turtle.digUp()
		dug = dug + 1
		os.sleep(0.3)
	end
	return dug
end

---comment
---@param dug number?
---@return number dug
function usefulFunctions.digDown(dug)
	dug = dug or 0
	if turtle.detectDown() then
		turtle.digDown()
		dug = dug + 1
		return dug
	end
	return 0
end

---Emptys the inventory of a turtle and drops it in front
---@param start number? What slot to start emptying from
---@param stop number? What slot to stop emptying at
---@return boolean success
function usefulFunctions.emptyInv(start, stop)
	start = start or 1
	stop = stop or 16
	for i = start, stop do
		turtle.select(i)
		turtle.drop()
	end
	return true
end

---Emptys the inventory of a turtle and drops it in down
---@param start number? What slot to start emptying from
---@param stop number? What slot to stop emptying at
---@return boolean success
function usefulFunctions.emptyInvDown(start, stop)
	start = start or 1
	stop = stop or 16
	for i = start, stop do
		turtle.select(i)
		turtle.dropDown()
	end
	return true
end

---Turns the turtle around
---@param facing string? The direction the turtle is facing
---@return string facing
function usefulFunctions.turnAround(facing)
	--print("in turnAround. Facing:" .. tostring(facing))
    facing = usefulFunctions.turnRight(facing)
    facing = usefulFunctions.turnRight(facing)
	return facing
end

---Gets a block to place from the inventory
---@param block string? The name of the block you want. If left blank then uses a list
---@return boolean
function usefulFunctions.hasBlock(block)
    block = block or ""
	local placeableBlocks = {
        --Logs
        "minecraft:oak_log", "minecraft:stripped_oak_log",
        "minecraft:spruce_log", "minecraft:stripped_spruce_log",
        "minecraft:birch_log", "minecraft:stripped_birch_log",
        "minecraft:jungle_log", "minecraft:stripped_jungle_log",
        "minecraft:acacia_log", "minecraft:stripped_acacia_log",
        "minecraft:dark_oak_log", "minecraft:stripped_dark_oak_log",
        "minecraft:mangrove_log", "minecraft:stripped_mangrove_log",
        "minecraft:cherry_log", "minecraft:stripped_cherry_log",
        "minecraft:crimson_stem", "minecraft:stripped_crimson_stem",
        "minecraft:warped_stem", "minecraft:stripped_warped_stem",    
        "minecraft:bamboo_block", "minecraft:stripped_bamboo_block",

        --Planks
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
        "minecraft:bamboo_mosaic", 

        --Stones
        "minecraft:stone",
        "minecraft:cobblestone",
		"minecraft:deepslate",
		"minecraft:cobbled_deepslate",
		"minecraft:netherrack",
		"minecraft:andesite",

		--Misc
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
                        --print("Placing " .. string.sub(itemName, 11))
                        return true
                    end
                end
            else
                if itemName == block then--get the specific block
                    --print("Placing " .. string.sub(itemName, 11))
                    return true
                end
            end
        end
    end
    turtle.select(1)
    return false
end

---Place block left
---@param placed number? Number of blocks placed
---@param blockName string? Name of block to place
---@return boolean success
---@return number placed
function usefulFunctions.placeLeft(placed, blockName)
	placed = placed or 0
    if usefulFunctions.hasBlock(blockName) then
		turtle.turnLeft()
        turtle.place()
		turtle.turnRight()
		placed = placed + 1
    else
        print("Out of blocks.")
        return false, placed
    end
    return true, placed
end

---Place block right
---@param placed number? Number of blocks placed
---@param blockName string? Name of block to place
---@return boolean success
---@return number placed
function usefulFunctions.placeRight(placed, blockName)
	placed = placed or 0
	blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
		turtle.turnRight()
        turtle.place()
		turtle.turnLeft()
		placed = placed + 1
    else
        print("Out of blocks.")
        return false, placed
    end
    return true, placed
end

---Place block up
---@param placed number? Number of blocks placed
---@param blockName string? Name of block to place
---@return boolean success
---@return number placed
function usefulFunctions.placeUp(placed, blockName)
	placed = placed or 0
	blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
        turtle.placeUp()
		placed = placed + 1
    else
        print("Out of blocks.")
        return false, placed
    end
    return true, placed
end

---Place block down
---@param placed number? Number of blocks placed
---@param blockName string? the name of the block you want to place
---@return boolean success
---@return number placed
function usefulFunctions.placeDown(placed, blockName)
	placed = placed or 0
	blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
        turtle.placeDown()
		placed = placed + 1
    else
        print("Out of blocks.")
        return false, placed
    end
    return true, placed
end

---Placed block front
---@param placed number? Number of blocks placed
---@param blockName string? the name of the block you want to place
---@return boolean success
---@return number placed
function usefulFunctions.place(placed, blockName)
	placed = placed or 0
	blockName = blockName or ""
    if usefulFunctions.hasBlock(blockName) then
        turtle.place()
		placed = placed + 1
    else
        print("Out of blocks.")
        return false, placed
    end
    return true, placed
end

---Used to make sure the filter turtle are facing the crate
---@param direction string? The direction the turtle will turn
---@return boolean
function usefulFunctions.faceTheCorrectWay(direction)
	direction = direction or "left"
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
	return false-- if it can't get the correct way
end

---Used to sort items into crate
---@param top string 
---@param middle string
---@param bottom string
---@param turtleToMessage integer
---@param hopper any
---@param noHopper boolean
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
					os.sleep(0.5)
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

---Used to sort items into crate
---@param top string 
---@param middle string
---@param bottom string
---@param turtleToMessage integer
---@param hopper any
---@param noHopper boolean
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
					os.sleep(0.5)
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

---Use to refuel if fuel level is less than 500
---@return number
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

---Request a file from a computer or turtle
---@param fileName string
---@param serverID integer
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

---Use to receive a file
---@param fileName string
---@param serverID integer
function usefulFunctions.receiveFile(fileName,serverID)-- receive a file from a computer and saves it locally
	local id, message, protocol = rednet.receive()
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

---Use to send a file
---@param fileName string
---@param id integer
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

---Use to open rednet
---@return any
---@return boolean
function usefulFunctions.openRednet()
	local modem = peripheral.find("modem", rednet.open) or ""
	if rednet.isOpen() then	
		return modem, true
	else
		return modem, false
	end
end

---Use to find the user input yes or no 
---@param s string
---@return boolean|nil
function usefulFunctions.yesNo(s)
	s = string.lower(s)
	if s == "y" or s == "yes" then
		return true
	end
	if s == "n" or "no" then
		return false
	end
	return nil -- if string is not yes or no
end

---Use to wait for a reply. Good for use in parallel.waitForAny
---@return boolean
---@return number?
---@return string?
---@return string?
function usefulFunctions.getReply()
	local success = false
	if rednet.isOpen() then
		local id,message,protocal = rednet.receive()
		return success,id,message,protocal
	end
	return success
end
-------------------------------------Mining functions--------------------------------
---Use to avoid blocks in front of the turtle
---@param totalMoved number? The total number of blocks moved
---@param mined number? The number of blocks mined
---@param list table The list of blocks to avoid
---@param blocksUpFromMiningLayer number The number of blocks that the turtle is above the mining layer
---@return number moved
---@return number totalMoved
---@return number mined
---@return string whatToDo
---@return number blocksUpFromMiningLayer
function usefulFunctions.avoidBlockFront(totalMoved,mined,list,blocksUpFromMiningLayer)
    totalMoved = totalMoved or 0
    mined = mined or 0
    --print("totalMoved " .. totalMoved .. " mined " .. mined .. " blocksUpFromMiningLayer " .. tostring(blocksUpFromMiningLayer)) --debug
    list = list or {}
    local moved = nil -- initialize moved variable
    local whatToDo = nil
    local success = false -- initialize success variable
    local _,blockFront = turtle.inspect() -- get the block's details
    if list[blockFront.name] then -- if its in the list
        --print("avoidBlockFront if") --debug
        local _, blockUp = turtle.inspectUp() -- get the block above details
        if list[blockUp.name] then -- if block above is in the list
            whatToDo = "up"
            moved = -1 -- went back one block
            --print("avoidBlockFront inner if") --debug
            success,totalMoved = usefulFunctions.moveBack(totalMoved) -- move back to avoid the block in front
            return moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer  -- return the amount moved and up becaues the block 
        else -- the block is mineable
            whatToDo = "forward"
            moved = 0 -- did not move forward
            --print("avoidBlockFront inner else") --debug
            success,totalMoved,mined = usefulFunctions.moveUp(totalMoved,mined)
            if success then
                blocksUpFromMiningLayer = blocksUpFromMiningLayer + 1
            end
            return moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer
        end
    else --else it not in the list or no block in front
        moved = 1 -- went forwad 1 block
        if blocksUpFromMiningLayer > 0 then -- go forward one then let down try and get back to the mining layer
            whatToDo = "down"
            --print("avoidBlockFront else if") --debug
            success,totalMoved,mined = usefulFunctions.moveForward(totalMoved,mined)
            return moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer
        end
        whatToDo = "forward"
        --print("avoidBlockFront else") --debug
        _,totalMoved,mined = usefulFunctions.moveForward(totalMoved,mined) --this will run if blocksUpFromMiningLayer is 0
        return 1,totalMoved,mined,whatToDo,blocksUpFromMiningLayer
    end
end

---Use to avoid blocks above the turtle
---@param totalMoved number? The total number of blocks moved
---@param mined number? The number of blocks mined
---@param list table The list of blocks to avoid
---@return number moved
---@return number toalMoved
---@return number mined
---@return string whatToDo
function usefulFunctions.avoidBlockUp(totalMoved,mined,list)
    totalMoved = totalMoved or 0
    mined = mined or 0
    local moved = nil -- initialize moved variable
    local whatToDo = nil -- initialize whatToDo variable
    local success = false -- initialize success variable
    local _, blockUp = turtle.inspectUp()
    if list[blockUp.name] then -- if block above is in the list
    --print("avoidBlockUp if") --debug
        moved = -1 -- went back one block
        whatToDo = "up"
        success,totalMoved = usefulFunctions.moveBack(totalMoved) --go back one block
        return moved,totalMoved,mined,whatToDo
    else
        moved = 1 -- went up one block
        whatToDo = "forward"
        --print("avoidBlockUp else") --debug
        success,totalMoved,mined = usefulFunctions.moveUp(totalMoved,mined)
        return moved,totalMoved,mined,whatToDo -- went up a block so try going forword again
    end
end

---Use to avoid blocks below the turtle
---@param totalMoved number? The total number of blocks moved
---@param mined number? The number of blocks mined
---@param list table The list of blocks to avoid
---@param blocksUpFromMiningLayer number The number of blocks that the turtle is above the mining layer
---@return number toalMoved
---@return number mined
---@return string shatToDo
---@return number blocksUpFromMiningLayer
function usefulFunctions.avoidBlockDown(totalMoved,mined,list,blocksUpFromMiningLayer)
    totalMoved = totalMoved or 0
    mined = mined or 0
    local whatToDo = "forward" -- initialize whatToDo variable
    while blocksUpFromMiningLayer ~= 0 do --keep trying to dig down unless the block should not be dug
        local _,blockDown = turtle.inspectDown()
        if list[blockDown.name] then -- if there is a block down and it is in the list
            return totalMoved,mined,whatToDo,blocksUpFromMiningLayer -- stop trying to go down, block is in the way
        else
            local success
            success,totalMoved,mined = usefulFunctions.moveDown(totalMoved,mined)
            if success then
                blocksUpFromMiningLayer = blocksUpFromMiningLayer - 1
            end
        end
    end
    return totalMoved,mined,whatToDo,blocksUpFromMiningLayer
end

---------------------------------End of mining functions----------------------------

--------------------------------------gps functions-------------------------------
--use to get back to a specific block in the x axis

---use to get a turtle to a location
---@param x number the x coordinate of the turtle now
---@param location number the coordiante of where the turtle should go
---@param facing string? track which way the turtle is facing. Should be a direction (north,east,south,west) Run either eastWest or northSouth to get the direction
---@param single boolean? move only one block
---@return boolean
---@return string facing
function usefulFunctions.x(x, location, facing,single)-- east west  
	single = single or false
	-- tutle is at the correct location
	--print(facing)
	facing  = facing or ""
	if x == location then
	print("Already at x:" .. location)
		return true, facing
	end

	if x > location then
		print("west")
		if facing == "north" or facing == "east" or facing == "south" or facing == "west" then
			facing = usefulFunctions.faceDirection(facing,"west")
		else
			usefulFunctions.eastWest(x,"west")
		end
		if single then
			usefulFunctions.moveForward()
			return true, facing
		else
			while true do
				x,_,_ = gps.locate()
				if x == location then
					return true, facing
				end
				usefulFunctions.moveForward()
			end
		end
	else
		print("east")
		if facing  == "north" or facing == "east" or facing == "south" or facing == "west" then
			facing = usefulFunctions.faceDirection(facing,"east")
		else
			usefulFunctions.eastWest(x,"east")
		end

		if single then
			usefulFunctions.moveForward()
			return true, facing
		else
			while true do
				x,_,_ = gps.locate()
				if x == location then
					return true, facing
				end
				usefulFunctions.moveForward()
			end
		end
	end
end

---use to get back to a specific block in the y axis
---Start location, destination
---@param y number the y coordinate of the turtle now
---@param location number the coordiante of where the turtle should go
---@param single boolean?
---@return boolean
function usefulFunctions.y(y, location, single) -- up down
	if y == location then
	print("Already at y:" .. location)
		return true
	end
	single = single or false

	if y < location then -- turtle is below the location
		--print("turtle is below the location")
		if single then
			usefulFunctions.moveUp()
		else
			while true do
				usefulFunctions.moveUp()
				local _,newY,_ = gps.locate()
				if newY == location then
					return true
				end
			end
		end
	elseif y > location then -- turtle is above the location
		--print("turtle is above the location")
		if single then
			usefulFunctions.moveDown()
		else
			while true do
				usefulFunctions.moveDown()
				local _,newY,_ = gps.locate()
				if newY == location then
					return true
				end
			end
		end
	end
	return false
end


---z is location the turtle is now, 
---location is the place you want the turtle to end, 
---facing is if kepping track of which way the turtle is facing should be a direction
---@param z number the z coordinate of the turtle now
---@param location number the coordiante of where the turtle should go
---@param facing string? track which way the turtle is facing. Should be a direction (north,east,south,west) Run either eastWest or northSouth to get the direction
---@return boolean
---@return any
function usefulFunctions.z(z, location, facing, single)-- north south
	facing = facing or ""
	single = single or false
	-- tutle is at the corect location
	if z == location then
	print("Already at z:" .. location)
		return true, facing
	end

	if z > location then -- turtle is north of location
		print("north")
		if facing == "north" or facing == "east" or facing == "south" or facing == "west" then -- turtle knows which way it is facing
			facing = usefulFunctions.faceDirection(facing,"north")
		else
			usefulFunctions.northSouth(z,"north") -- figure out which way the turtle is facing
		end

		if single then
			usefulFunctions.moveForward()
			return true, facing
		else
			while true do
				_,_,z = gps.locate()
				if z == location then
					return true, facing
				end
				usefulFunctions.moveForward()
			end
		end
	else -- turtle is south of location
		print("south")
		if facing == "north" or facing == "east" or facing == "south" or facing == "west" then -- turtle knows which way it is facing
			facing = usefulFunctions.faceDirection(facing,"south")
		else
			usefulFunctions.northSouth(z,"south") -- figure out which way the turtle is facing
		end

		if single then
			usefulFunctions.moveForward()
			return true, facing
		else
			while true do
				_,_,z = gps.locate()
				if z == location then
					return true, facing
				end
				usefulFunctions.moveForward()
			end
		end
	end
end


---use to find the direction the turtle is facing in the x axis east/west
---@param x number the x coordinate of the turtle now
---@param direction string? the direction you want the turtle to face
---@return string
---@return integer
function usefulFunctions.eastWest(x,direction)
	direction = direction or "" 
	-- find the x direction that the turtle is facing

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
		turtle.back()
		if digAndReplace then
			turtle.select(10)
			turtle.place()
		end
	end
	if newX > x then -- newX is bigger. Went West
		if direction == "west" then
			turtle.turnLeft()
			turtle.turnLeft()
			--print("Facing East")
			return direction, turned
		else
			direction = "east"
			--print("Facing West")
			return direction, turned
		end
	else -- newX is smaller. Went East
		if direction == "east" then
			turtle.turnLeft()
			turtle.turnLeft()
			--print("Facing West")
			return direction, turned
		else
			direction = "west"
			--print("Facing East")
			return direction, turned
		end
	end
end

---use to find the direction the turtle is facing in the z axis north/south
---@param z number the z coordinate of the turtle now
---@param direction? string the direction you want the turtle to face
---@return string direction
---@return integer turned
function usefulFunctions.northSouth(z,direction)
	direction = direction or ""
	-- find the z direction that the turtle is facing

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
			--print("Facing North")
			return direction, turned
		else
			direction = "south"
			--print("Facing South")
			return direction, turned
		end
	else -- newz is smaller. Went north
		if direction == "south" then
			turtle.turnLeft()
			turtle.turnLeft()
			--print("Facing South")
			return direction, turned
		else
			direction = "north"
			--print("Facing North")
			return direction, turned
		end
	end
end

--variables for the turn functions
local directions = {"north","east","south","west"}
local directionsIndex = {north = 1,east = 2,south = 3,west = 4}

---helper function for turning and keeping track of direction
---@param direction string The direction the turtle is facing
---@param clockwise boolean Whether to turn clockwise
---@return string
local function turn(direction, clockwise)
	local index = 1
	if direction ~= "" then
		index = directionsIndex[direction]
	end
	if clockwise then
		index = (index % 4) + 1
		turtle.turnRight()
	else
		index = index - 1
		if index == 0 then
			index = 4
		end
		turtle.turnLeft()
	end
	return directions[index]
end


---Turn the tutle to the right and keep track of direction
---@param facing string?
---@return string
function usefulFunctions.turnRight(facing)
	facing = facing or ""
	return turn(facing, true)
end

---Turn the turtle to the left and keep track of direction
---@param facing string?
---@return string
function usefulFunctions.turnLeft(facing)
	facing = facing or ""
	return turn(facing, false)
end

---Face the turtle a specific direction if you know what direction it is facing
---@param facing string The direction the turtle is currently facing
---@param direction string The direction the turtle should face
---@return any
function usefulFunctions.faceDirection(facing,direction) -- use to face a direction after knowing what direction you are facing
	while facing ~= direction do
		facing = usefulFunctions.turnRight(facing)
	end
	return facing
end

---See if a number is negative
---@param num number
---@return integer
function usefulFunctions.sign(num)
    if num > 0 then
        return 1
    elseif num < 0 then
        return -1
    else
        return 0
    end
end

---Can be used to get the absolute value of a number and see if it was negative
---@param num number
---@return number
---@return boolean
function usefulFunctions.reverseSign(num)
	local isNegative = false
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

function usefulFunctions.wait(secs,intervals)
	local secs = secs or 4
	local intervalse = intervals or 4
	local secsDivided = secs / intervals
	for i = 1,intervals do
		print(intervals)
		intervals = intervals - 1
		os.sleep(secsDivided)
	end
end
--------------------------------end of display functions------------------------------


-----------------------------Functions to modify a file-------------------------------

---comment
---@param fileName string
---@param searchPattern string
---@param replaceString string
---@return boolean worked
function usefulFunctions.modifyFile(fileName,searchPattern,replaceString)
local oldFileHandle, err = fs.open(shell.resolve(fileName),"r") -- open the file for reading
if not oldFileHandle then -- make sure the file is open
    print("Error reading file. Error " .. err)
	return false
end
local oldFile = oldFileHandle.readAll() -- read all the file
oldFileHandle.close()
local newContent, count = string.gsub(oldFile,searchPattern,replaceString)
if count > 0 then -- if gsub changed the file then count will reflet the number changed
    print("Successfully changed file.")

    local writeHandle,err = fs.open(shell.resolve(fileName),"w")
    if not writeHandle then
        print("Error writing to file. Error " .. err)
        return false
    end
    writeHandle.write(tostring(newContent))
    writeHandle.close()
else
    print("Unable to find the string.")
	return false
end
print("passed adding id")
return true
end
return usefulFunctions