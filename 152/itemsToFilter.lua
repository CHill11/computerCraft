local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:flowering_azalea",middle = "minecraft:seagrass", bottom = "minecraft:azalea_leaves"}
	local turtleToMessage = 293
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter