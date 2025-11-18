local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:pale_oak_fence",middle = "minecraft:piston", bottom = "minecraft:sticky_piston"}
	local turtleToMessage = 281
	local spotInRow = 9
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter