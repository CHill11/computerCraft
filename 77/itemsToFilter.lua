local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:tuff_brick_wall",middle = "minecraft:chiseled_tuff_bricks", bottom = "minecraft:chiseled_tuff"}
	local turtleToMessage = 202
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
