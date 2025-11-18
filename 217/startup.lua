--id = 217
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1		Column 2			Column 3			Column 4		Column 5		Column 6			Column 7		Column 8			Column 9
local inRowItemsRawName = {		"brown_wool",	"light_gray_wool",	"light_blue_wool",	"lime_wool",	"white_wool",	"cyan_wool",		"oak_door",		"pale_oak_door",	"birch_door",
								"orange_wool",	"gray_wool",		"blue_wool",		"green_wool",	"pink_wool",	"amethyst_block",	"spruce_door",	"dark_oak_door",	"mangrove_door",
								"red_wool",		"black_wool",		"purple_wool",		"yellow_wool",	"magenta_wool",	"iron_door",		"acacia_door",	"jungle_door",		"cherry_door"}

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