local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:kelp",middle = "minecraft:dripstone_block", bottom = "minecraft:cobblestone_slab"}
	local turtleToMessage = 251
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter