local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:purpur_stairs",middle = "minecraft:iron_bars", bottom = "minecraft:end_stone_bricks"}
	local turtleToMessage = 220
	local spotInRow = 8
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter