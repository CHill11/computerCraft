local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:white_dye",middle = "minecraft:pink_dye", bottom = "minecraft:magenta_dye"}
	local turtleToMessage = 227
	local spotInRow = 5
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter