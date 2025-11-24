local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:copper_chest",middle = "minecraft:waxed_copper_chest", bottom = "minecraft:polished_tuff_slab"}
	local turtleToMessage = 229
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
