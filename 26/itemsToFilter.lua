local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:pale_oak_stairs",middle = "minecraft:pale_oak_planks", bottom = "minecraft:pale_oak_slab"}
	local turtleToMessage = 174
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter