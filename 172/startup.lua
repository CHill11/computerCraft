--id = 172
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1		Column 2			Column 3			Column 4			Column 5			Column 6			Column 7			Column 8			Column 9
local inRowItemsRawName = {		"oak_stairs",	"spruce_stairs",	"birch_stairs",		"jungle_stairs",	"acacia_stairs",	"dark_oak_stairs",	"mangrove_stairs",	"cherry_stairs",	"pale_oak_stairs",
								"oak_planks",	"spruce_planks",	"birch_planks",		"jungle_planks",	"acacia_planks",	"dark_oak_planks",	"mangrove_planks",	"cherry_planks",	"pale_oak_planks",
								"oak_slab",		"spruce_slab",		"birch_slab",		"jungle_slab",		"acacia_slab",		"dark_oak_slab",	"mangrove_slab",	"cherry_slab",		"pale_oak_slab"}

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