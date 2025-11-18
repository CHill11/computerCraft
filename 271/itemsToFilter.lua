local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:chorus_flower",middle = "minecraft:stone_stairs", bottom = "minecraft:chiseled_stone_bricks"}
	local turtleToMessage = 293
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter