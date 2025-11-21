local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:lantern",middle = "minecraft:blast_furnace", bottom = "minecraft:lodestone"}
	local turtleToMessage = 184
	local spotInRow = 5
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter