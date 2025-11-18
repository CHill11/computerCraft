local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:white_wool",middle = "minecraft:pink_wool", bottom = "minecraft:magenta_wool"}
	local turtleToMessage = 221
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter