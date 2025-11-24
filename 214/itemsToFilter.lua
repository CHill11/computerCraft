local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:waxed_cut_copper",middle = "minecraft:waxed_cut_copper_slab", bottom = "minecraft:waxed_cut_copper_stairs"}
	local turtleToMessage = 229
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
