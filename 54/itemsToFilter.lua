local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:fermented_spider_eye",middle = "minecraft:magma_cream", bottom = "minecraft:ghast_tear"}
	local turtleToMessage = 188
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter