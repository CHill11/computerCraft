local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lapis_lazuli",middle = "minecraft:iron_nugget", bottom = "minecraft:gold_nugget"}
	local turtleToMessage = 227
	local spotInRow = 9
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter