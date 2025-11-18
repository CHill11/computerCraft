local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:emerald",middle = "minecraft:gold_ingot", bottom = "minecraft:tuff"}
	local turtleToMessage = 162
	local spotInRow = 4
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
