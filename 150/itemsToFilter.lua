local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:white_stained_glass",middle = "minecraft:pink_stained_glass", bottom = "minecraft:magenta_stained_glass"}
	local turtleToMessage = 293
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter