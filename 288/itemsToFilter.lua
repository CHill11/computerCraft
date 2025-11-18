local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:birch_fence",middle = "minecraft:jungle_fence", bottom = "minecraft:acacia_fence"}
	local turtleToMessage = 281
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter