local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:mossy_stone_brick_stairs",middle = "minecraft:mossy_stone_bricks", bottom = "minecraft:mossy_stone_brick_slab"}
	local turtleToMessage = 202
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
