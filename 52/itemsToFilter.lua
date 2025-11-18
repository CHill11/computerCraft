local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:rabbit_foot",middle = "minecraft:pufferfish", bottom = "minecraft:spider_eye"}
	local turtleToMessage = 188
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter