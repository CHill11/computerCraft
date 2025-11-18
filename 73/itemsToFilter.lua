local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:feather",middle = "minecraft:glow_ink_sac", bottom = "minecraft:slime_ball"}
	local turtleToMessage = 201
	local spotInRow = 3
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
