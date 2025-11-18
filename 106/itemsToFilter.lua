local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:brown_dye",middle = "minecraft:orange_dye", bottom = "minecraft:red_dye"}
	local turtleToMessage = 227
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter