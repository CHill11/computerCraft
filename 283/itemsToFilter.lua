local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:light_gray_stained_glass_pane",middle = "minecraft:gray_stained_glass_pane", bottom = "minecraft:black_stained_glass_pane"}
	local turtleToMessage = 281
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter