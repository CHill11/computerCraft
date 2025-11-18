local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:dark_oak_stairs",middle = "minecraft:dark_oak_planks", bottom = "minecraft:dark_oak_slab"}
	local turtleToMessage = 174
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter