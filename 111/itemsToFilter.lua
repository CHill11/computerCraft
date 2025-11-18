local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cyan_dye",middle = "minecraft:ink_sac", bottom = "minecraft:redstone_lamp"}
	local turtleToMessage = 227
	local spotInRow = 6
	local pass = "" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter