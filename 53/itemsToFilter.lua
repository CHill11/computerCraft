local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:glistering_melon_slice",middle = "minecraft:golden_carrot", bottom = "minecraft:sugar"}
	local turtleToMessage = 188
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter