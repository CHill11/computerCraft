--id = 198
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1					Column 2				Column 3					Column 4				Column 5					Column 6					Column 7					Column 8				Column 9
local inRowItemsRawName = {		"polished_diorite_stairs",	"tuff_brick_wall",		"tuff_brick_stairs",	"polished_andesite_stairs",	"mossy_cobblestone_stairs",	"mossy_stone_brick_stairs",	"mossy_cobblestone_wall",	"stone_brick_stairs",	"cracked_stone_bricks",
								"polished_diorite",			"chiseled_tuff_bricks",	"tuff_bricks",			"polished_andesite",		"mossy_cobblestone",		"mossy_stone_bricks",		"stone_brick_wall",			"stone_bricks",			"smooth_stone",
								"polished_diorite_slab",	"chiseled_tuff",		"tuff_brick_slab",		"polished_andesite_slab",	"mossy_cobblestone_slab",	"mossy_stone_brick_slab",	"mossy_stone_brick_wall",	"stone_brick_slab",		"smooth_stone_slab"}

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