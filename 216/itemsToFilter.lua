local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:copper_trapdoor",middle = "minecraft:waxed_copper_trapdoor", bottom = "minecraft:waxed_copper_grate"}
	local turtleToMessage = 229
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
