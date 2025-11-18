local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:mangrove_sapling",middle = "minecraft:mangrove_log", bottom = "minecraft:mangrove_leaves"}
	local turtleToMessage = 168
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter