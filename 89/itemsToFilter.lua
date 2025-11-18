local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_gray_terracotta",middle = "minecraft:gray_terracotta", bottom = "minecraft:black_terracotta"}
	local turtleToMessage = 220
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter