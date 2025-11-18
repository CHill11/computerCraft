local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cracked_stone_bricks",middle = "minecraft:smooth_stone", bottom = "minecraft:smooth_stone_slab"}
	local turtleToMessage = 202
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
