local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:sandstone_wall",middle = "minecraft:red_sandstone_wall", bottom = "minecraft:red_sand"}
	local turtleToMessage = 252
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter