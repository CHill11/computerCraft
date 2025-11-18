local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:tripwire_hook",middle = "minecraft:lead", bottom = "minecraft:brown_egg"}
	local turtleToMessage = 201
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
