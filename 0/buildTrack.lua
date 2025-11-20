local usefulFunctions = require("usefulFunctions")

print("How far to build track?")
local dist = tonumber(read())
print("How many normal rails in between powered rails?")
local spacingOfRails = tonumber(read())
print("Should I place a light block every 8 blocks? (Y/N)")
local lightPlaceStr = read()
local lightPlace = usefulFunctions.yesNo(string.lower(lightPlaceStr))
local lightBlock = ""
if lightPlace then
	print("What light block do you want to place? (Don't include minecraft))")
	lightBlock = read()
	lightBlock = "minecraft:" .. lightBlock
end
local moved = 0
local trackLaid = 0 --The number of tracks laid/blocks moved
local buildBlock = "minecraft:stone"

usefulFunctions.moveUp()
while moved <= dist do --keep laying tacks until user distance is reached
	if usefulFunctions.hasBlock("minecraft:powered_rail") and usefulFunctions.hasBlock("minecraft:redstone_torch") and usefulFunctions.hasBlock(buildBlock) then --if powered track is in inventory 
		usefulFunctions.moveDown()
		usefulFunctions.moveDown()
		usefulFunctions.moveDown()
		usefulFunctions.placeDown()
		usefulFunctions.moveUp()
		usefulFunctions.placeDown(0,"minecraft:redstone_torch")
		usefulFunctions.moveUp()
		usefulFunctions.placeDown(0,buildBlock)
		usefulFunctions.moveUp()
		_,trackLaid = usefulFunctions.placeDown(trackLaid,"minecraft:powered_rail") --count the number of tracks placed
	else
		print("Out of powered rail.")
		return false
	end
	for i = 1, spacingOfRails do --place normal rails
		if usefulFunctions.hasBlock("minecraft:rail") then --it track is in the inventory
			_,trackLaid = usefulFunctions.placeDown(trackLaid,"minecraft:rail") --count the number of tacks placed
			_,moved = usefulFunctions.moveForward(moved)
		else
			print("Out of track.")
			return false
		end
	end
	if lightPlace then
		usefulFunctions.moveDown()
		if lightBlock == "minecraft:shroomlight" then
			usefulFunctions.digDown()
			usefulFunctions.placeDown(0,"minecraft:shroomlight")
		elseif lightBlock == "minecraft:jack_o_lantern" then
			usefulFunctions.digDown()
			usefulFunctions.placeDown(0,"minecraft:jack_o_lantern")
		elseif lightBlock == "minecraft:glowstone" then
			usefulFunctions.digDown()
			usefulFunctions.placeDown(0,"minecraft:glowstone")
		else
			print("Not a valid light block.")
		end
	end
end
usefulFunctions.moveDown()