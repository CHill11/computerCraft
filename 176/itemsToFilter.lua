local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:prismarine_shard",middle = "minecraft:prismarine_crystals", bottom = "minecraft:acacia_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 5
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
