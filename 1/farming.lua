function checkFuel() --make sure there is enough fuel to finish a pass
    if turtle.getFuelLevel() < 500 then

                print("Fuel too low to complete a harvest. Fuel level is " .. turtle.getFuelLevel())
        return false
    end
    print("true")
    return true
end

function harvestAndPlant() --dig plant and replace it
    turtle.digDown()
    if plant() then
	print("planting...")
        turtle.placeDown()
    end
end

function plant()
    turtle.select(1)
    seed = turtle.getItemDetail()
    for i = 1, 4 do
	--go = m .. plants[i]
        if seed.name == (m .. plants[i]) then
            return true
        else
            return false
        end 
    end
end

function startFarm(width, length)
	for i = 1, width do
        for o = 1, length do
			print(length)
			print("o is " .. o)
            harvestAndPlant()
			if o == length then
				if i == width then
					break
				else
					turn(i)
					break
				end
			end
			assert(turtle.forward())
        end
		print("i is " .. i)
		if i == width then
			break
		end
    end
end

function turn(numRow)
	if numRow % 2 == 0 then
		turtle.turnLeft()
		assert(turtle.forward())
		turtle.turnLeft()
	else
		turtle.turnRight()
		assert(turtle.forward())
		turtle.turnRight()
	end
end

function emptyInv()
	for i = 2, 16 do
		turtle.select(i)
		turtle.dropUp()
	end
end

farm_width = 8 -- should be 8
farm_length = 22 -- should be 22
m = "minecraft:"
plants = {"carrot","potato","wheat_seeds","beetroot_seeds"}

while true do
    if not checkFuel() then
        print("Exiting.")
        return
    end
    startFarm(farm_width,farm_length)
	turtle.turnRight()
	for i = 1,farm_width - 1 do
		assert(turtle.forward())
	end --turtle should be back to start but not faceing the correct way
	--turtle.turnRight() --uncomment if only one farm
	--get turtle to the start of second farm
	for i = 1, farm_width + 1 do
		assert(turtle.forward())
	end
	turtle.turnRight()
	startFarm(farm_width,farm_length)
	turtle.turnLeft()
	turtle.forward()
	turtle.forward()
	turtle.turnLeft()
	emptyInv()
	print("Finished. Going to sleep for 20 mins.")
	sleep(300)
	print("15 mins till harvest.")
	sleep(300)
	print("10 mins till harvest.")
	sleep(300)
	print("5 mins till harvest.")
	sleep(300)
end
