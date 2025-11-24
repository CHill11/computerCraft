local server = 207
local file = "usefulFunctions.lua"
if shell.run("getfile", server, file) then
	print("Updated usefulFunctions")
else
	print("Error updating usefulFunctions")
end

local usefulFunctions = require("usefulFunctions")

local length  = 20 -- the length  of the farm
local mined = 0 -- just for fun
local moved = 0 -- the counter for getting back to the start
local blockStop = "minecraft:quartz_slab" -- when the turtle inspects this block it stops going up
local blockName = "minecraft:oak_log" -- the type of tree to harvest
local tree = false -- boolean for if there is a tree
rednet.open("right")
local sleepDuration = 600
local secondRow = true

local function harvest1()
print("in harvest")
	while true do
		for i = 1,length do -- go the length  of the farm
			local hasBlock, blockInFront = turtle.inspect()-- see if tree has grown
			print(blockInFront.name)
			if blockInFront.name == blockName then
				tree = true
			end
			local movedUp = 0
			while tree do -- if there is a tree cut the whole tree
				mined = usefulFunctions.dig(mined)
				local hasBlockUp, blockAbove = turtle.inspectUp()
				print(blockAbove.name)
				if blockAbove.name ~= blockStop then -- see if the block above is the ceiling
					_, movedUp, mined = usefulFunctions.moveUp(movedUp,mined)
				else
					tree = false -- if the block above is the ceiling then stop
				end
			end
			for u = 1,movedUp do -- go down the tree
				_, moved, mined = usefulFunctions.moveDown(moved,mined)
			end
			if i == length then
				break
			end
			turtle.turnRight()
			_, moved, mined = usefulFunctions.moveForward(moved,mined)
			turtle.turnLeft()
		end
		turtle.turnLeft()
		for i = 1,length - 1 do -- go back to the start
			_, moved, mined = usefulFunctions.moveForward(moved,mined)
		end
		turtle.turnRight()
		return
	end
end

local function harvest2()
print("in harvest 2")
	while true do
		for i = 1,length do -- go the length  of the farm
			local hasBlock, blockInFront = turtle.inspect()-- see if tree has grown
			print(blockInFront.name)
			if blockInFront.name == blockName then
				tree = true
			end
			local movedUp = 0
			while tree do -- if there is a tree cut the whole tree
				mined = usefulFunctions.dig(mined)
				local hasBlockUp, blockAbove = turtle.inspectUp()
				print(blockAbove.name)
				if blockAbove.name ~= blockStop then -- see if the block above is the ceiling
					_, movedUp, mined = usefulFunctions.moveUp(movedUp,mined)
				else
					tree = false -- if the block above is the ceiling then stop
				end
			end
			for u = 1,movedUp do -- go down the tree
				_, moved, mined = usefulFunctions.moveDown(moved,mined)
			end
			if i == length then
				break
			end
			turtle.turnLeft()
			_, moved, mined = usefulFunctions.moveForward(moved,mined)
			turtle.turnRight()
		end
		turtle.turnRight()
		for i = 1,length - 1 do -- go back to the start
			_, moved, mined = usefulFunctions.moveForward(moved,mined)
		end
		turtle.turnLeft()
		return
	end
end
while true do
	harvest1() --harvest to the right
	if secondRow then --if there is a second row of trees to harvest
		turtle.turnLeft()
		turtle.turnLeft()
		-- this is where to add the moveForward for the distance the rows are apart
		_,moved,mined = usefulFunctions.moveForward(moved,mined)
		_,moved,mined = usefulFunctions.moveForward(moved,mined)
		harvest2()
		turtle.turnLeft()
		turtle.turnLeft()
		-- this shurld match the moveForward up above
		_,moved,mined = usefulFunctions.moveForward(moved,mined)
		_,moved,mined = usefulFunctions.moveForward(moved,mined)
	end
	usefulFunctions.emptyInvDown()
	-- send the go signel to the planter turtle
	rednet.send(7, "go")
	print("Sent for the planter.")
	sleep(sleepDuration)
 -- end of while loop
end
