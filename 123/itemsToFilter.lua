local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:beef",middle = "minecraft:mutton", bottom = "minecraft:salmon"}
	local turtleToMessage = 235
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter