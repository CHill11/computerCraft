local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:basalt",middle = "minecraft:smooth_basalt", bottom = "minecraft:warped_wart_block"}
	local turtleToMessage = 183
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter