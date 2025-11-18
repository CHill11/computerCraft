local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_blue_wool",middle = "minecraft:blue_wool", bottom = "minecraft:purple_wool"}
	local turtleToMessage = 221
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter