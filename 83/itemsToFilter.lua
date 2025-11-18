local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:stone_brick_stairs",middle = "minecraft:stone_bricks", bottom = "minecraft:stone_brick_slab"}
	local turtleToMessage = 202
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
