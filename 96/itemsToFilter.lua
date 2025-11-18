local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:end_stone_brick_wall",middle = "minecraft:end_stone_brick_stairs", bottom = "minecraft:end_stone_brick_slab"}
	local turtleToMessage = 220
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter