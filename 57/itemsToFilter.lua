local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:dried_ghast",middle = "minecraft:tnt", bottom = "minecraft:blue_egg"}
	local turtleToMessage = 201
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
