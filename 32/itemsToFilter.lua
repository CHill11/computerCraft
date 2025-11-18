local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:birch_stairs",middle = "minecraft:birch_planks", bottom = "minecraft:birch_slab"}
	local turtleToMessage = 174
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter