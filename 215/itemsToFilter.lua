local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:copper_door",middle = "minecraft:waxed_copper_door", bottom = "minecraft:copper_grate"}
	local turtleToMessage = 229
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
