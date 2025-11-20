local usefulFunctions = require("usefulFunctions")

print("How far to flatten?")
local lenght = tonumber(read())
print("And how wide? (To the right)")
local width = tonumber(read())
print("What block do you want to fill the holes with?")
local block = read()
local rValue = false--use to catch return value
block = "minecraft:" .. block
for w = 1, width do
	for l = 1, lenght do
		if not turtle.detectDown() then
			usefulFunctions.placeDown(1, block)
		end
		usefulFunctions.digUp()
		usefulFunctions.moveForward()
	end--length end
	if w % 2 == 0 then
		turtle.turnLeft()
		if not turtle.detectDown() then
			usefulFunctions.placeDown(1, block)
		end
		if w == width then
			usefulFunctions.turnAround()
			for w = 1, width - 1 do
				usefulFunctions.moveForward()
			end
		else
			usefulFunctions.moveForward()
			turtle.turnLeft()
		end
	else 
		turtle.turnRight()
		if not turtle.detectDown() then
			usefulFunctions.placeDown(1, block)
		end
		if w == width then
			turtle.turnRight()
			for l = 1, lenght do
				usefulFunctions.moveForward()
			end
			turtle.turnRight()
			for w = 1, width - 1 do
				usefulFunctions.moveForward()
			end
		else
			usefulFunctions.moveForward()
			turtle.turnRight()
		end
	end
end--width end
turtle.turnRight()
print("Finished!")