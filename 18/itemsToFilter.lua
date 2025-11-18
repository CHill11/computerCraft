local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:pale_oak_sapling",middle = "minecraft:pale_oak_log", bottom = "minecraft:pale_oak_leaves"}
	local turtleToMessage = 168
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter