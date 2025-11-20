function getTrack() --looks for normal rail in the inventory
	for i = 1,16 do
		turtle.select(i)
		item = turtle.getItemDetail()
		if item then
			if item.name == "minecraft:rail" then
				turtle.placeDown()
				return true
			end	
		end
	end
	return false
end

function getPowerTrack() --looks for power rail in the inventory
	for i = 1,16 do
		turtle.select(i)
		item = turtle.getItemDetail()
		if item then
			if item.name == "minecraft:powered_rail" then
				turtle.placeDown()
				return true
			end	
		end
	end
	return false
end

function getShroomlight() --looks for shroomlight in the inventory
	for i = 1,16 do
		turtle.select(i)
		item = turtle.getItemDetail()
		if item then
			if item.name == "minecraft:shroomlight" then
				turtle.placeDown()
				return true
			end	
		end
	end
	return false
end

function digDown()
	if turtle.detectDown() then
		assert(turtle.digDown())
		return true
	end
	return false
end

function forward()
	if turtle.detect() then
		assert(turtle.dig())
	end
	assert(turtle.forward())
end

print("How far to build track?")
dist = tonumber(read())
trackLaid = 0 --The number of tracks laid/blocks moved
if dist > 265 then
	print("Too far for me to build. Exiting...")--makes sure the number is not too big so it does not leave the loaded chunks
else
	turtle.up()
	while trackLaid <= dist do --keep laying tacks until user distance is reached
	print("in while")
		if getPowerTrack() then --if powered track is in inventory 
			trackLaid = trackLaid + 1 --count the number of tracks placed
		else
			print("Out of powered rail.")
		end
		for i = 1, 8 do --place 7 normal rails
			if getTrack() then --it track is in the inventory
				trackLaid = trackLaid + 1 --count the number of tacks placed
				forward()
			else
				print("Out of track.")
				return false
			end
		end
		turtle.down()
		digDown()
		if not getShroomlight() then--if shroomlight in the inventory 
			return false
		end
		turtle.up()
	end
end
turtle.down()
