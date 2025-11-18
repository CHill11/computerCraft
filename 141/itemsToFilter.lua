local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:red_sandstone",middle = "minecraft:red_sandstone_stairs", bottom = "minecraft:red_sandstone_slab"}
	local turtleToMessage = 252
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter