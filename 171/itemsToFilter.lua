local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:crimson_slab",middle = "minecraft:honeycomb_block", bottom = "minecraft:cherry_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
