local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:bricks",middle = "minecraft:fire_charge", bottom = "minecraft:music_disc_13"}
	local turtleToMessage = 184
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter