local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:obsidian",middle = "minecraft:paper", bottom = "minecraft:book"}
	local turtleToMessage = 188
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter