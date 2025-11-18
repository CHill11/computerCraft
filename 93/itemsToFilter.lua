local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:brown_terracotta",middle = "minecraft:cyan_terracotta", bottom = "minecraft:calcite"}
	local turtleToMessage = 220
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter