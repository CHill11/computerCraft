local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:ender_eye",middle = "minecraft:clay_ball", bottom = "minecraft:dispenser"}
	local turtleToMessage = 251
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter