local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:big_dripleaf",middle = "minecraft:small_dripleaf", bottom = "minecraft:cactus_flower"}
	local turtleToMessage = 293
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter