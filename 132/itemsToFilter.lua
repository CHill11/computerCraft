local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lily_pad",middle = "minecraft:cactus", bottom = "minecraft:sugar_cane"}
	local turtleToMessage = 251
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter