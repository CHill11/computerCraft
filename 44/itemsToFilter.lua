local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:weeping_vines",middle = "minecraft:crimson_roots", bottom = "minecraft:crimson_fungus"}
	local turtleToMessage = 183
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter