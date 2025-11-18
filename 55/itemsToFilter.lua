local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:glass_bottle",middle = "minecraft:blaze_powder", bottom = "minecraft:nether_wart"}
	local turtleToMessage = 188
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter