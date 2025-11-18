--id = 181
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1				Column 2				Column 3			Column 4			Column 5				Column 6				Column 7			Column 8			Column 9
local inRowItemsRawName = {		"stripped_crimson_stem","stripped_warped_stem",	"basalt",			"soul_sand",		"nether_brick",			"nether_brick_stairs",	"weeping_vines",	"brown_mushroom",	"glowstone_dust",
								"crimson_stem",			"warped_stem",			"smooth_basalt",	"soul_soil",		"nether_bricks",		"nether_brick_wall",	"crimson_roots",	"red_mushroom",		"glowstone",
								"crimson_planks",		"warped_planks",		"warped_wart_block","nether_wart_block","nether_brick_fence",	"nether_brick_slab",	"crimson_fungus",	"warped_fungus",	"shroomlight"}

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