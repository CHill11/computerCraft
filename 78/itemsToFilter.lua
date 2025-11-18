local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:tuff_brick_stairs",middle = "minecraft:tuff_bricks", bottom = "minecraft:tuff_brick_slab"}
	local turtleToMessage = 202
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
