local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:redstone",middle = "minecraft:diamond", bottom = "minecraft:ender_pearl"}
	local turtleToMessage = 162
	local spotInRow = 9
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
