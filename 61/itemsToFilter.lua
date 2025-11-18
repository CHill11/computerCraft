local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:amethyst_shard",middle = "minecraft:glow_berries", bottom = "minecraft:flowering_azalea_leaves"}
	local turtleToMessage = 201
	local spotInRow = 4
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
