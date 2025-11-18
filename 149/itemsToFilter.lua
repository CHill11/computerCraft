local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lime_stained_glass",middle = "minecraft:green_stained_glass", bottom = "minecraft:yellow_stained_glass"}
	local turtleToMessage = 293
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter