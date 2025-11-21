local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:item_frame",middle = "minecraft:resin_brick_wall", bottom = "minecraft:resin_bricks"}
	local turtleToMessage = 184
	local spotInRow = 7
	local pass = "left" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter