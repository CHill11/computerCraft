local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:acacia_stairs",middle = "minecraft:acacia_planks", bottom = "minecraft:acacia_slab"}
	local turtleToMessage = 174
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter