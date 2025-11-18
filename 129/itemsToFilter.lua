local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:beetroot_seeds",middle = "minecraft:torchflower_seeds", bottom = "minecraft:cocoa_beans"}
	local turtleToMessage = 251
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
