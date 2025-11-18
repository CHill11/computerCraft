local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:prismarine_stairs",middle = "minecraft:prismarine_brick_stairs", bottom = "minecraft:birch_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
