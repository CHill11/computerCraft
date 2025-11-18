local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:phantom_membrane",middle = "minecraft:turtle_helmet", bottom = "minecraft:dragon_breath"}
	local turtleToMessage = 188
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter