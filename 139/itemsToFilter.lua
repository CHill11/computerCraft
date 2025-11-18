local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:smooth_red_sandstone_stairs",middle = "minecraft:smooth_red_sandstone_slab", bottom = "minecraft:podzol"}
	local turtleToMessage = 252
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter