local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:polished_diorite_stairs",middle = "minecraft:polished_diorite", bottom = "minecraft:polished_diorite_slab"}
	local turtleToMessage = 202
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
