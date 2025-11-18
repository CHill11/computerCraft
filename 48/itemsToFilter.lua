local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:quartz",middle = "minecraft:blackstone", bottom = "minecraft:magma_block"}
	local turtleToMessage = 188
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter