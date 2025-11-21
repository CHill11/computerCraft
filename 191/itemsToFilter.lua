local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:heart_of_the_sea",middle = "minecraft:bucket", bottom = "minecraft:furnace"}
	local turtleToMessage = 184
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter