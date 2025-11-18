local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:acacia_sapling",middle = "minecraft:acacia_log", bottom = "minecraft:acacia_leaves"}
	local turtleToMessage = 168
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter