local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:chiseled_red_sandstone",middle = "minecraft:cut_red_sandstone", bottom = "minecraft:smooth_red_sandstone"}
	local turtleToMessage = 252
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter