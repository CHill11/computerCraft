local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_gray_stained_glass",middle = "minecraft:gray_stained_glass", bottom = "minecraft:black_stained_glass"}
	local turtleToMessage = 293
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter