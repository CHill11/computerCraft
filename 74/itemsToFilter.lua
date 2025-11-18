local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:string",middle = "minecraft:rotten_flesh", bottom = "minecraft:leather"}
	local turtleToMessage = 201
	local spotInRow = 2
	local pass = "right" --left or right
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
