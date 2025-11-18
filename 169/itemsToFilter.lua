local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sea_lantern",middle = "minecraft:dark_prismarine", bottom = "minecraft:dark_oak_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
