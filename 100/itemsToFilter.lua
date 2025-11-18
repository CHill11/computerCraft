local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lime_wool",middle = "minecraft:green_wool", bottom = "minecraft:yellow_wool"}
	local turtleToMessage = 221
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter