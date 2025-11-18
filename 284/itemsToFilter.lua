local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_blue_stained_glass_pane",middle = "minecraft:blue_stained_glass_pane", bottom = "minecraft:purple_stained_glass_pane"}
	local turtleToMessage = 281
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter