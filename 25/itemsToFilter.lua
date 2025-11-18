local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:spruce_sapling",middle = "minecraft:spruce_log", bottom = "minecraft:spruce_leaves"}
	local turtleToMessage = 168
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter