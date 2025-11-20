local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:",middle = "minecraft:", bottom = "minecraft:"}
	local turtleToMessage = ""
	local spotInRow = ""
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
