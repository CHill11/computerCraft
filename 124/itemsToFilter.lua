local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cooked_chicken",middle = "minecraft:cooked_porkchop", bottom = "minecraft:cooked_rabbit"}
	local turtleToMessage = 235
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter