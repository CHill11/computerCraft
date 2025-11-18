local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cobblestone",middle = "minecraft:stone", bottom = "minecraft:charcoal"}
	local turtleToMessage = 162
	local spotInRow = 2
	local pass = "left"
	local noHopper = true
	return items, turtleToMessage, spotInRow, pass, noHopper
end

return itemsToFilter
