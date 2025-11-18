local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:white_stained_glass_pane",middle = "minecraft:pink_stained_glass_pane", bottom = "minecraft:magenta_stained_glass_pane"}
	local turtleToMessage = 281
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter