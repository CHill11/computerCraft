local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:pale_oak_door",middle = "minecraft:dark_oak_door", bottom = "minecraft:jungle_door"}
	local turtleToMessage = 221
	local spotInRow = 8
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter