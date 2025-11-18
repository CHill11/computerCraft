local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:soul_sand",middle = "minecraft:soul_soil", bottom = "minecraft:nether_wart_block"}
	local turtleToMessage = 183
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter