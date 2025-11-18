local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sandstone",middle = "minecraft:smooth_sandstone", bottom = "minecraft:chiseled_sandstone"}
	local turtleToMessage = 252
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter