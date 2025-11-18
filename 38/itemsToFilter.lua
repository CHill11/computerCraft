local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:stripped_crimson_stem",middle = "minecraft:crimson_stem", bottom = "minecraft:crimson_planks"}
	local turtleToMessage = 183
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter