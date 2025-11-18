local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:bone_block",middle = "minecraft:netherrack", bottom = "minecraft:wither_skeleton_skull"}
	local turtleToMessage = 188
	local spotInRow = 3
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter