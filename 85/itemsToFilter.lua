local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:terracotta",middle = "minecraft:orange_terracotta", bottom = "minecraft:red_terracotta"}
	local turtleToMessage = 220
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter