local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_blue_terracotta",middle = "minecraft:blue_terracotta", bottom = "minecraft:purple_terracotta"}
	local turtleToMessage = 220
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter