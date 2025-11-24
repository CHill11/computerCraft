local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:honey_block",middle = "minecraft:honeycomb", bottom = "minecraft:pale_oak_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
