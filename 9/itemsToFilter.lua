local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:oak_log",middle = "minecraft:stick", bottom = "minecraft:coal"}
	local turtleToMessage = 162
	local spotInRow = 1
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
