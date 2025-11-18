--id = 154
local turtleID = os.getComputerID()

local itemsInFilter = require("itemsInFilter")

print("My turtle ID is " .. turtleID .. ".")
print("Started...")

local itemsInFilterRaw = itemsInFilter.items()

local itemNames = {}
for i,items in ipairs(itemsInFilterRaw) do
	itemNames[itemsInFilterRaw[i]] = true
end

local wasSuck = false
local item = nil
while true do
	wasSuck = turtle.suckDown()
	if wasSuck then
		item = turtle.getItemDetail()
		if itemNames[item.name] then
			turtle.dropUp()
		else
			turtle.drop()
		end
	end
	sleep(0.2)
end
