local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:nether_brick_stairs",middle = "minecraft:nether_brick_wall", bottom = "minecraft:nether_brick_slab"}
	local turtleToMessage = 183
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter