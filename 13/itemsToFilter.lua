local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:end_stone",middle = "minecraft:dirt", bottom = "minecraft:andesite"}
	local turtleToMessage = 162
	local spotInRow = 6
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
