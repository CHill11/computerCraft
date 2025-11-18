local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:oak_door",middle = "minecraft:spruce_door", bottom = "minecraft:acacia_door"}
	local turtleToMessage = 221
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter