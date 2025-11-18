local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cod",middle = "minecraft:tropical_fish", bottom = "minecraft:chorus_fruit"}
	local turtleToMessage = 235
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter