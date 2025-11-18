local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sweet_berries",middle = "minecraft:cookie", bottom = "minecraft:pumpkin"}
	local turtleToMessage = 235
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter