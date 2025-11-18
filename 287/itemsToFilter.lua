local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cyan_stained_glass_pane",middle = "minecraft:oak_fence", bottom = "minecraft:spruce_fence"}
	local turtleToMessage = 281
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter