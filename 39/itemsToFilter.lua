local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:stripped_warped_stem",middle = "minecraft:warped_stem", bottom = "minecraft:warped_planks"}
	local turtleToMessage = 183
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter