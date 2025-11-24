local usefulFunctions = require("usefulFunctions")

print("How far to make stairs?")
local dist = tonumber(read())
local blocksMined = 0
local blocksPlaced = 0
local blocksMoved = 0
local rValue = false--boolen for true and false
for i = 1, dist do
    rValue, blocksMoved, blocksMined = usefulFunctions.moveForward(blocksMoved, blocksMined)
	if not turtle.inspectDown() then
		rValue, blocksPlaced = usefulFunctions.placeDown(blocksPlaced)
        if rValue == false then
            print("Out of approved blocks")
            return
        end
	end
	rValue, blocksMoved, blocksMined = usefulFunctions.moveUp(blocksMoved, blocksMined)
    if turtle.detectUp() then
        blocksMined = usefulFunctions.digUp(blocksMined)
    end
end
print("Finished!")
print("Blocks mined: " .. blocksMined)
print("Blocks moved: " .. blocksMoved)
print("Blocks placed: " .. blocksPlaced)

