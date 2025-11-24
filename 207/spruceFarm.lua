local usefulFunctions = require("usefulFunctions")
turtle.select(1)
local sapling = turtle.getItemDetail()
turtle.select(16)
local bonemeal = turtle.getItemDetail()
local cont = false
local isBlock = false
local moved = 0
local rValue = false

if bonemeal.name == "minecraft:bone_meal" and sapling.name == "minecraft:spruce_sapling" then
	cont = true
else
	print("No spruce sapling in the first slot or no bonemeal in the last slot")
end
while cont do
	local blockID
	isBlock, blockID = turtle.inspect()
	if not isBlock then
		turtle.select(1)
		turtle.place()
	elseif blockID.name == "minecraft:spruce_log" then
		while true do
			isBlock, blockID = turtle.inspect()
			print(blockID.name)
			if blockID.name == "minecraft:spruce_log" or blockID.name == "minecraft:spruce_leaves" then
				print("in if")
				usefulFunctions.dig()
				rValue, moved = usefulFunctions.moveUp(moved)
			else
				print("in else. Moved = " .. moved)
				for i = 1, moved do
					usefulFunctions.moveDown()
					print("i = " .. i)
					if i == moved then
						break
					end
				end
				break
			end
		end
	elseif blockID.name == "minecraft:spruce_sapling" then
		turtle.select(16)
		bonemeal = turtle.getItemDetail()
		if bonemeal then
			if bonemeal.name ~= "minecraft:bone_meal" then
				print("There is not bonemeal in the last slot. Exiting...")
				cont = false
				break
			end
			turtle.select(16)
			turtle.place()--use bone meal
		else
			print("Out of bonemeal. Exiting...")
			cont = false
			break
		end
	end
end

