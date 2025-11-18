local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:glass",middle = "minecraft:glass_pane", bottom = "minecraft:arrow"}
	local turtleToMessage = 162
	local spotInRow = 8
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
