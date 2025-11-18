local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:redstone_torch",middle = "minecraft:comparator", bottom = "minecraft:repeater"}
	local turtleToMessage = 227
	local spotInRow = 7
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter