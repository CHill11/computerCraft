--id = 166
--main column for storage 
--second row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1		Column 2			Column 3			Column 4			Column 5			Column 6			Column 7			Column 8			Column 9
local inRowItemsRawName = {		"oak_sapling",	"pale_oak_sapling",	"cherry_sapling",	"mangrove_sapling",	"dark_oak_sapling",	"acacia_sapling",	"jungle_sapling",	"birch_sapling",	"spruce_sapling",
								"leaf_litter",	"pale_oak_log",		"cherry_log",		"mangrove_log",		"dark_oak_log",		"acacia_log",		"jungle_log",		"birch_log",		"spruce_log",
								"oak_leaves",	"pale_oak_leaves",	"cherry_leaves",	"mangrove_leaves",	"dark_oak_leaves",	"acacia_leaves",	"jungle_leaves",	"birch_leaves",		"spruce_leaves"}

for _, name in ipairs(inRowItemsRawName) do
	itemNames["minecraft:" .. name] = true-- Uses a lookup table (hash map) for fast checking
end

while true do
	os.pullEvent("turtle_inventory")
	turtle.select(1)
	local item = turtle.getItemDetail()
	if item then 
		if itemNames[item.name] then
			print(string.sub(item.name, 11) .. " is in this row. Sorting...")
			turtle.dropDown()
			--break
		else
		print("Passing on " .. string.sub(item.name, 11))
			turtle.drop()
		end
	end
end