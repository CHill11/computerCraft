local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:flower_pot",middle = "minecraft:resin_brick_slab", bottom = "minecraft:resin_brick_stairs"}
	local turtleToMessage = 184
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter