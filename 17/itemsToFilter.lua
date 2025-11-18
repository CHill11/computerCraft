local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:oak_sapling",middle = "minecraft:leaf_litter", bottom = "minecraft:oak_leaves"}
	local turtleToMessage = 168
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter