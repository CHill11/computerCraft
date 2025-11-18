local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:crying_obsidian",middle = "minecraft:flint", bottom = "minecraft:armadillo_scute"}
	local turtleToMessage = 201
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
