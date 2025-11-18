--id = 213
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1			Column 2					Column 3					Column 4				Column 5				Column 6			Column 7			Column 8			Column 9
local inRowItemsRawName = {		"terracotta",		"light_gray_terracotta",	"light_blue_terracotta",	"lime_terracotta",		"white_terracotta",		"brown_terracotta",	"purpur_block",		"purpur_stairs",	"end_stone_brick_wall",
								"orange_terracotta","gray_terracotta",			"blue_terracotta",			"green_terracotta",		"pink_terracotta",		"cyan_terracotta",	"purpur_pillar",	"iron_bars",		"end_stone_brick_stairs",
								"red_terracotta",	"black_terracotta",			"purple_terracotta",		"yellow_terracotta",	"magenta_terracotta",	"calcite",			"purpur_slab",		"end_stone_bricks",	"end_stone_brick_slab"}

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