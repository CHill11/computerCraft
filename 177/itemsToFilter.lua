local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:prismarine_wall",middle = "minecraft:sponge", bottom = "minecraft:jungle_trapdoor"}
	local turtleToMessage = 158
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
