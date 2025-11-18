local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:birch_door",middle = "minecraft:mangrove_door", bottom = "minecraft:cherry_door"}
	local turtleToMessage = 221
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter