local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:chiseled_copper",middle = "minecraft:waxed_chiseled_copper", bottom = "minecraft:polished_tuff_stairs"}
	local turtleToMessage = 229
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
