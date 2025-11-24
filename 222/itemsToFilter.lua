local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:copper_bulb",middle = "minecraft:waxed_copper_bulb", bottom = "minecraft:polished_tuff"}
	local turtleToMessage = 229
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
