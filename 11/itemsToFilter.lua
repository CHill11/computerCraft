local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:raw_copper",middle = "minecraft:copper_ingot", bottom = "minecraft:diorite"}
	local turtleToMessage = 162
	local spotInRow = 3
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
