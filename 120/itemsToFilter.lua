local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cooked_cod",middle = "minecraft:bread", bottom = "minecraft:wheat"}
	local turtleToMessage = 235
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter