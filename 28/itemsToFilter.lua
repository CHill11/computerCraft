local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:mangrove_stairs",middle = "minecraft:mangrove_planks", bottom = "minecraft:mangrove_slab"}
	local turtleToMessage = 174
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter