local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cyan_wool",middle = "minecraft:amethyst_block", bottom = "minecraft:iron_door"}
	local turtleToMessage = 221
	local spotInRow = 6
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter