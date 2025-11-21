local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:crimson_nylium",middle = "minecraft:enchanted_golden_apple", bottom = "minecraft:golden_apple"}
	local turtleToMessage = 184
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter