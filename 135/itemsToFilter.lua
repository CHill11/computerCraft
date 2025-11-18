local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lever",middle = "minecraft:saddle", bottom = "minecraft:hopper"}
	local turtleToMessage = 251
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter