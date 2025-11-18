local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:blaze_rod",middle = "minecraft:turtle_scute", bottom = "minecraft:nautilus_shell"}
	local turtleToMessage = 201
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
