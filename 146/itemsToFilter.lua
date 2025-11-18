local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:brown_stained_glass",middle = "minecraft:orange_stained_glass", bottom = "minecraft:red_stained_glass"}
	local turtleToMessage = 293
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter