--id = 
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1				Column 2					Column 3					Column 4				Column 5				Column 6					Column 7						Column 8			Column 9
local inRowItemsRawName = {		"sandstone",			"sandstone_slab",			"cut_sandstone",			"sandstone_wall",		"red_sandstone",		"chiseled_red_sandstone",	"smooth_red_sandstone_stairs",	"sculk",			"sculk_vein",
								"smooth_sandstone",		"smooth_sandstone_slab",	"sandstone_stairs",			"red_sandstone_wall",	"red_sandstone_stairs",	"cut_red_sandstone",		"smooth_red_sandstone_slab",	"sculk_catalyst",	"sculk_shrieker",
								"chiseled_sandstone",	"cut_sandstone_slab",		"smooth_sandstone_stairs",	"red_sand",				"red_sandstone_slab",	"smooth_red_sandstone",		"podzol",						"sculk_sensor",		"calibrated_sculk_sensor"}

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