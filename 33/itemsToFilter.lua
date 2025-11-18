local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:spruce_stairs",middle = "minecraft:spruce_planks", bottom = "minecraft:spruce_slab"}
	local turtleToMessage = 174
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter