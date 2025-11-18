local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:bookshelf",middle = "minecraft:hay_block", bottom = "minecraft:ladder"}
	local turtleToMessage = 251
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter