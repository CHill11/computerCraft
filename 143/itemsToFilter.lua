local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cut_sandstone",middle = "minecraft:sandstone_stairs", bottom = "minecraft:smooth_sandstone_stairs"}
	local turtleToMessage = 252
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter