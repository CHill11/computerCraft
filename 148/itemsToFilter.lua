local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_blue_stained_glass",middle = "minecraft:blue_stained_glass", bottom = "minecraft:purple_stained_glass"}
	local turtleToMessage = 293
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter