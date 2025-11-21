--id = 
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1					Column 2				Column 3					Column 4				Column 5					Column 6				Column 7				Column 8				Column 9
local inRowItemsRawName = {		"copper_block",			"cut_copper",			"waxed_cut_copper",			"copper_door",			"copper_trapdoor",			"copper_bulb",			"copper_chest",			"chiseled_copper",		"candle",
								"waxed_copper_block",	"cut_copper_slab",		"waxed_cut_copper_slab",	"waxed_copper_door",	"waxed_copper_trapdoor",	"waxed_copper_bulb",	"waxed_copper_chest",	"waxed_chiseled_copper","red_candle",
								"decorated_pot",		"cut_copper_stairs",	"waxed_cut_copper_stairs",	"copper_grate",			"waxed_copper_grate",		"polished_tuff",		"polished_tuff_slab",	"polished_tuff_stairs",	"polished_tuff_wall"}

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