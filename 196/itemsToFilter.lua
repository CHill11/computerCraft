local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:resin_clump",middle = "minecraft:resin_block", bottom = "minecraft:resin_brick"}
	local turtleToMessage = 184
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter