local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:jungle_sapling",middle = "minecraft:jungle_log", bottom = "minecraft:jungle_leaves"}
	local turtleToMessage = 168
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter