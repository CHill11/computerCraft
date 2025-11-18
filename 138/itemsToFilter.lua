local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sculk",middle = "minecraft:sculk_catalyst", bottom = "minecraft:sculk_sensor"}
	local turtleToMessage = 252
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter