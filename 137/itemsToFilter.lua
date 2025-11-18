local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sculk_vein",middle = "minecraft:sculk_shrieker", bottom = "minecraft:calibrated_sculk_sensor"}
	local turtleToMessage = 252
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter