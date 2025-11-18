local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:prismarine_slab",middle = "minecraft:prismarine_brick_slab", bottom = "minecraft:spruce_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
