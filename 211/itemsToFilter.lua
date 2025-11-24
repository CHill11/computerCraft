local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:copper_block",middle = "minecraft:waxed_copper_block", bottom = "minecraft:decorated_pot"}
	local turtleToMessage = 229
	local spotInRow = 1
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
