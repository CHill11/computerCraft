local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:purpur_block",middle = "minecraft:purpur_pillar", bottom = "minecraft:purpur_slab"}
	local turtleToMessage = 220
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter