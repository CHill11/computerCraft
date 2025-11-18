local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cooked_beef",middle = "minecraft:cooked_mutton", bottom = "minecraft:cooked_salmon"}
	local turtleToMessage = 235
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter