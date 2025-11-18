local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:quartz_slab",middle = "minecraft:quartz_block", bottom = "minecraft:mangrove_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
