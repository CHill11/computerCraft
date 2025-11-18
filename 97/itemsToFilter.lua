local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:brown_wool",middle = "minecraft:orange_wool", bottom = "minecraft:red_wool"}
	local turtleToMessage = 221
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter