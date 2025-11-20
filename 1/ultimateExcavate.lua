local usefulFunctions = require("usefulFunctions")

---comment
---@param totalMoved number The total number of blocks moved
---@param mined number The number of blocks mined
---@param startX number The starting X coordinate
---@param startY number The starting Y coordinate
---@param startZ number The starting Z coordinate
---@param startFacing string The starting facing direction
---@param facing string The current facing direction
---@return number totalMoved
---@return number mined
---@return string facing
local function emptyInv(totalMoved,mined,startX,startY,startZ,startFacing,facing)
	local invFull = false
	local isFullSlot = turtle.getItemDetail(15)
	if isFullSlot then
		invFull = true
	else
		turtle.select(1)
		return totalMoved,mined,facing
	end
	if invFull then
		local x,y,z = gps.locate() -- the location that the turtle was at before it ran out of space
		local continueMiningFacing = facing

		-- go back to start to empty inventory
		usefulFunctions.y(y,startY)
		_, facing = usefulFunctions.x(x,startX,facing)
		_, facing = usefulFunctions.z(z,startZ,facing)

		-- face the correct way to place the chest
		if facing == startFacing then
			facing = usefulFunctions.turnAround(facing)
		else
			facing = usefulFunctions.faceDirection(facing,startFacing)
			facing = usefulFunctions.turnAround(facing)
		end

		-- keep trying to place a chest or ping the pocket computer
		while true do 
			local inspectedIsBlock, inspectedBlock = turtle.inspect()
			if inspectedIsBlock and inspectedBlock.name ~= "minecraft:chest" then -- make sure there is a place to put the chest
				mined = usefulFunctions.dig(mined)
				print("dug")
			end

			--place the chest or if chest already there then empty inventory
			if inspectedBlock.name == "minecraft:chest" or usefulFunctions.place(0,"minecraft:chest") then
				os.sleep(0.1)
				local chest = peripheral.wrap("front")
				local openSlots = chest.size() -- assume that all slots are full
				local chestList = chest.list()
				for slots, stack in pairs(chestList) do -- count the number of slots used
					if stack then
						openSlots = openSlots - 1
					end
				end
				print(openSlots)
				if openSlots > 15 then -- make sure there is enough space in the chest
					usefulFunctions.emptyInv()
					facing = usefulFunctions.turnAround(facing)
					break
				else -- ping the pocket computer because chest is too full
					rednet.send(63,"Chest out of space. Cords are x:" .. startX .. " y:" .. startY .. " z:" .. startZ)
					print("Wainting for message to continue...")
					local id, message = rednet.receive()
					print(message)
				end
			else -- there is no chest down and don't have a chest in inventory
				rednet.send(63,"I am out of chests. Cords are x:" .. startX .. " y:" .. startY .. " z:" .. startZ)
				print("Wainting for message to continue...")
				local id, message = rednet.receive()
				print(message)
			end
		end
		--return to the mining location
		_,facing = usefulFunctions.x(startX,x,facing)
		_,facing = usefulFunctions.z(startZ,z,facing)
		usefulFunctions.y(startY,y)
		facing = usefulFunctions.faceDirection(facing, continueMiningFacing)
		print("should be back to location")
	end-- end of if invFull
	return totalMoved,mined,facing
end
term.clear()
term.setCursorPos(1,1)
local userLength 
while true do
	usefulFunctions.printWrap("Enter the distance to dig forward:")
	userLength = tonumber(read())
	term.clear()
	if type(userLength) == "number" then
		if userLength <= 0 then
			term.clear()
			term.setCursorPos(1,1)
			--cursorLocation = term.getCursorPos()
			usefulFunctions.printWrap("Distance is too small.")
			term.setCursorPos(1,2)
		else
			break
		end
	else
		term.setCursorPos(1,1)
		usefulFunctions.printWrap("Error. Expected a number.")
		term.setCursorPos(1,2)
	end
end

local userDir
term.clear()
term.setCursorPos(1,1)
usefulFunctions.printWrap("Got it!")
term.setCursorPos(1,2)
while true do
	usefulFunctions.printWrap("Enter the direction you want to go:")
	userDir = read()
	term.clear()
	if userDir == "r" or userDir == "l" or userDir == "R" or userDir == "L" then
		if userDir == "r" or userDir == "R" then
			userDir = "right"
		else
			userDir = "left"
		end
		term.clear()
		break
	else
		term.setCursorPos(1,1)
		usefulFunctions.printWrap("Error. The input was not a valid direction.")
		term.setCursorPos(1,3)
	end
end

local userWidth
term.clear()
term.setCursorPos(1,1)
usefulFunctions.printWrap("Got it!")
term.setCursorPos(1,2)
while true do
	usefulFunctions.printWrap("Enter the distance you want to \ngo " .. userDir .. ": ")
	userWidth = tonumber(read())
	term.clear()
	if type(userWidth) == "number" then
		if userWidth > 0 then
			break
		else
			term.clear()
			term.setCursorPos(1,1)
			usefulFunctions.printWrap("Distance too small.")
			term.setCursorPos(1,2)
		end
	else
		term.setCursorPos(1,1)
		usefulFunctions.printWrap("Error. Expected a number.")
		term.setCursorPos(1,2)
	end
end

local userDepth
term.clear()
term.setCursorPos(1,1)
usefulFunctions.printWrap("Got it!")
term.setCursorPos(1,2)
while true do
	usefulFunctions.printWrap("Enter the depth you want to go:")
	userDepth = tonumber(read())
	term.clear()
	if type(userDepth) == "number" then
		break
	else
		term.setCursorPos(1,1)
		usefulFunctions.printWrap("Error. Expected a number.")
		term.setCursorPos(1,2)
	end
end
--[[
local userLength = 3
local userDir = "right"
local userWidth = 3
local userDepth = 3--]]
---------------------------end of getting user input
local startX, startY, startZ = gps.locate()--get the staring location
local facing, turned = usefulFunctions.eastWest(startX)--get the direction the turtle is facing
--print("starting facing:" .. facing)
--read()
for i = 1,turned do --realign the turtle the direction it was placed
	facing = usefulFunctions.turnLeft(facing)
end
--print("Realigned facing:" .. facing)
--read()
local startFacing = facing -- the original direction
local list =   {["minecraft:ancient_debris"] = true,		["minecraft:diamond_ore"] = true,
				["minecraft:deepslate_diamond_ore"] = true,	["minecraft:gold_ore"] = true,
				["minecraft:deepslate_gold_ore"] = true,	["minecraft:nether_gold_ore"] = true,
				["minecraft:lapis_ore"] = true,				["minecraft:deepslate_lapis_ore"] = true,
				["minecraft:redstone_ore"] = true,			["minecraft:deepslate_redstone_ore"] = true,
				["minecraft:iron_ore"] = true,				["minecraft:deepslate_iron_ore"] = true,
				["minecraft:coal_ore"] = true,				["minecraft:deepslate_coal_ore"] = true}
local totalMoved = 0 --the total amount of blocks move forwards and backwards
local mined = 0 -- total number of blocks mined
local whatToDo = "forward" -- what to do next
local blocksUpFromMiningLayer = 0 -- the number of blocks the turtle is above the
local depth = 1
local width = 1
local length = 1
local moved = nil

while depth <= userDepth do
print("depth:" .. depth)
	while width <= userWidth do
	print("width:" .. width)
		while length <= userLength do
			moved = 0
			totalMoved,mined,facing = emptyInv(totalMoved,mined,startX,startY,startZ,startFacing,facing)
			local isBlock, block = turtle.inspect()

			--switch like logic for what to do
			if whatToDo == "forward" then --forward
				moved,totalMoved,mined,whatToDo,blocksUpFromMiningLayer = usefulFunctions.avoidBlockFront(totalMoved,mined,list,blocksUpFromMiningLayer)
				length = length + moved
			elseif whatToDo == "up" then --up
				moved,totalMoved,mined,whatToDo = usefulFunctions.avoidBlockUp(totalMoved,mined,list)
				if moved == 1 then -- if the turtle moved up add one to blocksUpFromMiningLayer
					blocksUpFromMiningLayer = blocksUpFromMiningLayer + moved
				else -- the turtle moved back. Subtract one from length
					length = length + moved -- needs to stay as addition because moved is negative and needs to be diffrent then then 1 that is coming for blocksUpFromMiningLayer
				end
			elseif whatToDo == "down" then --down
				totalMoved,mined,whatToDo,blocksUpFromMiningLayer = usefulFunctions.avoidBlockDown(totalMoved,mined,list,blocksUpFromMiningLayer)
				else -- if whatToDo is not recognized
					print("Something went wrong")
				return
			end
			print("End of length loop. Length is " .. length .. " UserDist is " .. userLength .. " Moved is " .. moved)
		end --end of length
		while blocksUpFromMiningLayer > 0 do -- go back down to the mining layer before turning
			print("In if while. blocksUpFromMiningLayer is " .. blocksUpFromMiningLayer)
			_,totalMoved,mined = usefulFunctions.moveDown(totalMoved,mined)
			blocksUpFromMiningLayer = blocksUpFromMiningLayer - 1
		end
		if width == userWidth then
			break
		end
		--for width
		print("in for width. Facing:" .. tostring(facing))
		
		if userDir == "left" then --turn the proper direction
			if width % 2 == 0 then
				facing = usefulFunctions.turnRight(facing)
				--print("facing:" .. facing)
				--read()
				_,moved,mined = usefulFunctions.moveForward(moved,mined)
				facing = usefulFunctions.turnRight(facing)
				--print("facing:" .. facing)
				--read()
			else
				facing = usefulFunctions.turnLeft(facing)
				--print("facing:" .. facing)
				--read()
				_,moved,mined = usefulFunctions.moveForward(moved,mined)
				facing = usefulFunctions.turnLeft(facing)
				--print("facing:" .. facing)
				--read()
			end
		elseif userDir == "right" then --turn the proper direction
			if width % 2 == 0 then
				facing = usefulFunctions.turnLeft(facing)
				--print("facing:" .. facing)
				--read()
				_,moved,mined = usefulFunctions.moveForward(moved,mined)
				facing = usefulFunctions.turnLeft(facing)
				--print("facing:" .. facing)
				--read()
			else
				facing = usefulFunctions.turnRight(facing)
				--print("facing:" .. facing)
				--read()
				_,moved,mined = usefulFunctions.moveForward(moved,mined)
				facing = usefulFunctions.turnRight(facing)
				--print("facing:" .. facing)
				--read()
			end
		end
		length = 1 --reset counter
		width = width + 1 --add a loop
	end--end of width
	local x,y,z = gps.locate() --get the location so it know how to get back home
	_, facing = usefulFunctions.x(x,startX,facing)
	_, facing = usefulFunctions.z(z,startZ,facing)
	print(facing)
	--read()
	width = 1--reset counter
	length = 1--reset counter
	facing = usefulFunctions.faceDirection(facing,startFacing)
	if depth == userDepth then --go back to the starting location and end the program
		usefulFunctions.y(y,startY)
		break
	else
		_,moved,mined = usefulFunctions.moveDown(moved,mined)
		depth = depth + 1
		local _,blockDown = turtle.inspectDown()
		if blockDown.name == "minecraft:bedrock" then
			print("Hit bedrock. Ending program.")
			length = userLength + 1 -- to end the length loop
			width = userWidth + 1 -- to end the width loop
			depth = userDepth + 1 -- to end the depth loop
		end
	end
end--end of depth
print("Finished!\nThe amount of blocks mined is " .. mined .. "\nThe ammount of blocks moved is " .. moved)