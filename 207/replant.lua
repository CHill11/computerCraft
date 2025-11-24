local usefulFunctions = require("usefulFunctions")

local numberOfPlotsPerRow = 20
local secondRow = true
local numberOfPlotsTotal

if secondRow then
	numberOfPlotsTotal = numberOfPlotsPerRow * 2
else
	numberOfPlotsTotal = numberOfPlotsPerRow
end

--refill saplings
local function refill_saplings(numOfPlots)
print(numOfPlots)
    local item = turtle.getItemDetail()
	if item then
		if item.count < numOfPlots then
			print(item.count)
			for i = 1, (numOfPlots - item.count) do
				turtle.suck(1)
			end
			print("saplings reloaded")
		end
	else
		for i = 1, numOfPlots do
            turtle.suck(1)
        end
    end
end
--end of refill saplings

--start planting to the left
local function plant_saps_left(num)
	for i = 1, num - 1 do
		usefulFunctions.place()
		usefulFunctions.turnLeft()
		usefulFunctions.moveForward()
		usefulFunctions.turnRight()
	end
	usefulFunctions.place()
end
--end of planting to the left

--start planting to the right
local function plant_saps_Right(num)
	for i = 1, num - 1 do
		usefulFunctions.place()
		usefulFunctions.turnRight()
		usefulFunctions.moveForward()
		usefulFunctions.turnLeft()
	end
	usefulFunctions.place()
end
--end of planting to the right

--start of goto first row's first plot
local function goToStartPlant()
	usefulFunctions.turnRight()
	for i = 1,2 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnRight()
	for i = 1,3 do
		usefulFunctions.moveUp()
	end
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	for i = 1,3 do
		usefulFunctions.moveUp()
	end
	usefulFunctions.turnAround()
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnLeft()
	for i = 1,3 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnRight()
end
--end of goto first row's first plot

--start of go home from first row first plot
local function goHomeOneRow()
	usefulFunctions.turnRight()
	for i = 1,22 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnRight()
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	for i = 1,3 do
		usefulFunctions.moveDown()
	end
	usefulFunctions.turnAround()
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnLeft()
	for i = 1,3 do
		usefulFunctions.moveDown()
	end
	for i = 1,2 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnRight()
	rednet.send(8, "close")
	rednet.send(62, "close")
end
--end of go home from first row first plot

--start of goHomeSecondRow
local function goHomeSecondRow()
	usefulFunctions.turnLeft()
	for i = 1,22 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnRight()
	for i = 1,10 do
		usefulFunctions.moveForward()
	end
	for i = 1,3 do
		usefulFunctions.moveDown()
	end
	usefulFunctions.turnAround()
	for i = 1,4 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnLeft()
	for i = 1,3 do
		usefulFunctions.moveDown()
	end
	for i = 1,2 do
		usefulFunctions.moveForward()
	end
	usefulFunctions.turnRight()
	rednet.send(8, "close")
	rednet.send(62, "close")
end
--end of goHomeSecondRow

--start of goToSecondRow
local function goToSecondRow()
	usefulFunctions.turnRight()
	for i = 1,20 do
		usefulFunctions.moveForward()
	end
end
--end of goToSecondRow

--start of main loop
rednet.open("left")
while true do
    local event, id, message = os.pullEvent("rednet_message")
    print(message)
    if event == "rednet_message" then
        if message == "go" then
            rednet.send(8, "open")
            rednet.send(62, "open")
            refill_saplings(numberOfPlotsTotal)
            goToStartPlant()
			if secondRow then
				plant_saps_left(numberOfPlotsPerRow)
				goToSecondRow()
				usefulFunctions.turnLeft()
				for i = 1,6 do
					usefulFunctions.moveForward()
				end
				usefulFunctions.turnLeft()
				usefulFunctions.moveForward()
				usefulFunctions.turnLeft()
				plant_saps_Right(numberOfPlotsPerRow)
				goHomeSecondRow()
			else
				plant_saps_left(numberOfPlotsPerRow)
				goHomeOneRow()
			end
        end
    end
end