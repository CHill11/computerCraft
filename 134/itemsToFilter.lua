local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:iron_horse_armor",middle = "minecraft:golden_horse_armor", bottom = "minecraft:diamond_horse_armor"}
	local turtleToMessage = 251
	local spotInRow = 7
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
