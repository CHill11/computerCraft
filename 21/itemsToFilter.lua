local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:dark_oak_sapling",middle = "minecraft:dark_oak_log", bottom = "minecraft:dark_oak_leaves"}
	local turtleToMessage = 168
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter