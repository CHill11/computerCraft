local farm_width = 8 -- should be 8
local farm_length = 22 -- should be 22
local m = "minecraft:"
local seeds = {"carrot","potato","wheat_seeds","beetroot_seeds"}
local crops = {"wheat","beetroot"} 
local waitTime = 480 -- 300 = 5min
local numberOfWaitCycles = 4
local totalTime = waitTime * numberOfWaitCycles

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
		turtle.select(1)
    end
end

function plant()
	for o = 1, 16 do --go through the inventory looking for a seed
		turtle.select(o)
		seed = turtle.getItemDetail()
		if seed then 
			for i = 1, 4 do
			--go = m .. seeds[i]
				if seed.name == (m .. seeds[i]) then --if a seed is found then return true
					print("Seed is " .. seed.name)
					return true
				end 
			end
			print(seed.name .. " is not a seed.")
		end
	end
	return false
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
	turtle.turnLeft()
	turtle.turnLeft()
	for i = 1, 16 do
		turtle.select(i)
		local item = turtle.getItemDetail()
		if item then
			for o = 1, 4 do
				if item.name == m .. seeds[o] then --if it a plantable then drop up else drop back
					turtle.dropUp()
				end
			end
			for j = 1,2 do
				if item.name == m .. crops[j] then
					turtle.drop()
				end
			end
		end
	end
	turtle.turnLeft()
	turtle.turnLeft()
	turtle.select(1)
end

--start of main 
while true do
	turtle.suckUp()
    if not checkFuel() then
        print("Exiting.")
        return
    end
    startFarm(farm_width,farm_length)
	if farm_width % 2 == 0 then
		turtle.turnRight()
	else
		turtle.turnLeft()
		turtle.turnLeft()
		for i = 1,farm_length do
			if i == farm_length then
				break
			end
			assert(turtle.forward())
		end
		turtle.turnRight()
	end
	for i = 1,farm_width - 1 do
		assert(turtle.forward())
	end --turtle should be back to start but not faceing the correct way
	turtle.turnRight() --uncomment if only one farm
	emptyInv()
	turtle.turnLeft()
	--get turtle to the start of second farm
	for i = 1, farm_width + 1 do
		assert(turtle.forward())
	end
	turtle.turnRight()
	startFarm(farm_width,farm_length)
	if farm_width % 2 ~= 0 then
		turtle.turnLeft()
		turtle.turnLeft()
		for i = 1,farm_length do
			if i == farm_length then
				break
			end
			assert(turtle.forward())
		end
		
	end
	turtle.turnLeft()
	assert(turtle.forward())
	assert(turtle.forward())
	turtle.turnLeft()
	emptyInv()
	
	print("Finished. Going to sleep for " .. (totalTime / 60) .. " mins.")
	for i = 1, numberOfWaitCycles do
		sleep(waitTime)
		if i ~= 0 then
			print((totalTime - waitTime * i) / 60 .. " mins till harvest.")
		else
			print("Starting harvest...")
		end
	end
end