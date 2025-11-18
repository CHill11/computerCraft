local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:dark_oak_fence",middle = "minecraft:mangrove_fence", bottom = "minecraft:cherry_fence"}
	local turtleToMessage = 281
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter