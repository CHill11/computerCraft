local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:carrot",middle = "minecraft:melon_slice", bottom = "minecraft:apple"}
	local turtleToMessage = 235
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter