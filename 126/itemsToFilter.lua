local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:potato",middle = "minecraft:baked_potato", bottom = "minecraft:poisonous_potato"}
	local turtleToMessage = 235
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter