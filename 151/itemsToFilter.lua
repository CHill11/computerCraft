local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cyan_stained_glass",middle = "minecraft:moss_block", bottom = "minecraft:azalea"}
	local turtleToMessage = 293
	local spotInRow = 6
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter