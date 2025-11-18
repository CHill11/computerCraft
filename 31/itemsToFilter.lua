local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:jungle_stairs",middle = "minecraft:jungle_planks", bottom = "minecraft:jungle_slab"}
	local turtleToMessage = 174
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter