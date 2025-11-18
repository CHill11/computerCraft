local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lime_stained_glass_pane",middle = "minecraft:green_stained_glass_pane", bottom = "minecraft:yellow_stained_glass_pane"}
	local turtleToMessage = 281
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter