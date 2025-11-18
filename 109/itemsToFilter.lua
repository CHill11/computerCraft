local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lime_dye",middle = "minecraft:green_dye", bottom = "minecraft:yellow_dye"}
	local turtleToMessage = 227
	local spotInRow = 4
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter