local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:polished_granite",middle = "minecraft:totem_of_undying", bottom = "minecraft:music_disc_cat"}
	local turtleToMessage = 184
	local spotInRow = 2
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter