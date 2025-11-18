local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:prismarine",middle = "minecraft:prismarine_bricks", bottom = "minecraft:oak_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
