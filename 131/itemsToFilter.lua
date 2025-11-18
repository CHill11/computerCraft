local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:oak_sign",middle = "minecraft:experience_bottle", bottom = "minecraft:scaffolding"}
	local turtleToMessage = 251
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter