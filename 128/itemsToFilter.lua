local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:wheat_seeds",middle = "minecraft:melon_seeds", bottom = "minecraft:pumpkin_seeds"}
	local turtleToMessage = 251
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter