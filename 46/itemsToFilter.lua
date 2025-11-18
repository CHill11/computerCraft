local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:glowstone_dust",middle = "minecraft:glowstone", bottom = "minecraft:shroomlight"}
	local turtleToMessage = 183
	local spotInRow = 9
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter