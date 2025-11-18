--id = 228
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1		Column 2			Column 3			Column 4		Column 5		Column 6			Column 7			Column 8				Column 9
local inRowItemsRawName = {		"brown_dye",	"light_gray_dye",	"light_blue_dye",	"lime_dye",		"white_dye",	"cyan_dye",			"redstone_torch",	"pointed_dripstone",	"lapis_lazuli",
								"orange_dye",	"gray_dye",			"blue_dye",			"green_dye",	"pink_dye",		"ink_sac",			"comparator",		"bone_meal",			"iron_nugget",
								"red_dye",		"black_dye",		"purple_dye",		"yellow_dye",	"magenta_dye",	"redstone_lamp",	"repeater",			"grass_block",			"gold_nugget"}

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
