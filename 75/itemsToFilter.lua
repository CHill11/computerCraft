local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:bone",middle = "minecraft:gunpowder", bottom = "minecraft:rabbit_hide"}
	local turtleToMessage = 201
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
