local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:brown_stained_glass_pane",middle = "minecraft:orange_stained_glass_pane", bottom = "minecraft:red_stained_glass_pane"}
	local turtleToMessage = 281
	local spotInRow = 1
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter