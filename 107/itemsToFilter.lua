local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_gray_dye",middle = "minecraft:gray_dye", bottom = "minecraft:black_dye"}
	local turtleToMessage = 227
	local spotInRow = 2
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter