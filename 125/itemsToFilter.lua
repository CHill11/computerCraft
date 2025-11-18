local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:chicken",middle = "minecraft:porkchop", bottom = "minecraft:rabbit"}
	local turtleToMessage = 235
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter