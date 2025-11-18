local itemsToFilter = {}

function itemsToFilter.items()
	local items = {top = "minecraft:cobbled_deepslate",middle = "minecraft:deepslate", bottom = "minecraft:gravel"}
	local turtleToMessage = 162
	local spotInRow = 7
	local pass = "left"
	return items, turtleToMessage, spotInRow, pass
end

return itemsToFilter
