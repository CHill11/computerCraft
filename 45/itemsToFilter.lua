local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:brown_mushroom",middle = "minecraft:red_mushroom", bottom = "minecraft:warped_fungus"}
	local turtleToMessage = 183
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter