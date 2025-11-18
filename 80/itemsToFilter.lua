local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:mossy_cobblestone_stairs",middle = "minecraft:mossy_cobblestone", bottom = "minecraft:mossy_cobblestone_slab"}
	local turtleToMessage = 202
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
