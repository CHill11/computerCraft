local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:mossy_cobblestone_wall",middle = "minecraft:stone_brick_wall", bottom = "minecraft:mossy_stone_brick_wall"}
	local turtleToMessage = 202
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
