local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:firefly_bush",middle = "minecraft:name_tag", bottom = "minecraft:egg"}
	local turtleToMessage = 201
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
