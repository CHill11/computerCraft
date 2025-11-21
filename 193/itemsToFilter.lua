local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cobblestone_stairs",middle = "minecraft:minecart", bottom = "minecraft:chest_minecart"}
	local turtleToMessage = 184
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter