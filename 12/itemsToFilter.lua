local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sand",middle = "minecraft:iron_ingot", bottom = "minecraft:granite"}
	local turtleToMessage = 162
	local spotInRow = 5
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
