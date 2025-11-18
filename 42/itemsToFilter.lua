local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:nether_brick",middle = "minecraft:nether_bricks", bottom = "minecraft:nether_brick_fence"}
	local turtleToMessage = 183
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter