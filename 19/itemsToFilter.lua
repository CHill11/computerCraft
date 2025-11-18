local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cherry_sapling",middle = "minecraft:cherry_log", bottom = "minecraft:cherry_leaves"}
	local turtleToMessage = 168
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter