local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_blue_dye",middle = "minecraft:blue_dye", bottom = "minecraft:purple_dye"}
	local turtleToMessage = 227
	local spotInRow = 3
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter