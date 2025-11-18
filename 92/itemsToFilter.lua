local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:white_terracotta",middle = "minecraft:pink_terracotta", bottom = "minecraft:magenta_terracotta"}
	local turtleToMessage = 220
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter