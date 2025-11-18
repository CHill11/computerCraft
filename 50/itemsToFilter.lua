local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:breeze_rod",middle = "minecraft:cobweb", bottom = "minecraft:slime_block"}
	local turtleToMessage = 188
	local spotInRow = 4
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter