local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cherry_stairs",middle = "minecraft:cherry_planks", bottom = "minecraft:cherry_slab"}
	local turtleToMessage = 174
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter