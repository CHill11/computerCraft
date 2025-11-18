local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:oak_stairs",middle = "minecraft:oak_planks", bottom = "minecraft:oak_slab"}
	local turtleToMessage = 174
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter