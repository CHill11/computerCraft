--id = 280
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1					Column 2						Column 3						Column 4					Column 5						Column 6				Column 7			Column 8			Column 9
local inRowItemsRawName = {		"brown_stained_glass",		"light_gray_stained_glass",		"light_blue_stained_glass",		"lime_stained_glass",		"white_stained_glass",			"cyan_stained_glass",	"flowering_azalea",	"big_dripleaf",		"chorus_flower",
								"orange_stained_glass",		"gray_stained_glass",			"blue_stained_glass",			"green_stained_glass",		"pink_stained_glass",			"moss_block",			"seagrass",			"small_dripleaf",	"stone_stairs",
								"red_stained_glass",		"black_stained_glass",			"purple_stained_glass",			"yellow_stained_glass",		"magenta_stained_glass",		"azalea",				"azalea_leaves",	"cactus_flower",	"chiseled_stone_bricks"}

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