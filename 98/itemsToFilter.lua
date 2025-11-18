local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_gray_wool",middle = "minecraft:gray_wool", bottom = "minecraft:black_wool"}
	local turtleToMessage = 221
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter