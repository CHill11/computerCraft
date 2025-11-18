local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:polished_andesite_stairs",middle = "minecraft:polished_andesite", bottom = "minecraft:polished_andesite_slab"}
	local turtleToMessage = 202
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
