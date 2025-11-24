local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cut_copper",middle = "minecraft:cut_copper_slab", bottom = "minecraft:cut_copper_stairs"}
	local turtleToMessage = 229
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
