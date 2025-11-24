local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:candle",middle = "minecraft:red_candle", bottom = "minecraft:polished_tuff_wall"}
	local turtleToMessage = 229
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
