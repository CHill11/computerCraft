local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lime_terracotta",middle = "minecraft:green_terracotta", bottom = "minecraft:yellow_terracotta"}
	local turtleToMessage = 220
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter