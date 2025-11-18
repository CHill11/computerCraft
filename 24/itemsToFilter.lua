local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:birch_sapling",middle = "minecraft:birch_log", bottom = "minecraft:birch_leaves"}
	local turtleToMessage = 168
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter