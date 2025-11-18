local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sandstone_slab",middle = "minecraft:smooth_sandstone_slab", bottom = "minecraft:cut_sandstone_slab"}
	local turtleToMessage = 252
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter