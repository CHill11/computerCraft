local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:pointed_dripstone",middle = "minecraft:bone_meal", bottom = "minecraft:grass_block"}
	local turtleToMessage = 227
	local spotInRow = 8
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter