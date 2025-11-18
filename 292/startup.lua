--id = 292
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1						Column 2							Column 3								Column 4						Column 5						Column 6					Column 7		Column 8			Column 9
local inRowItemsRawName = {		"brown_stained_glass_pane",		"light_gray_stained_glass_pane",	"light_blue_stained_glass_pane",		"lime_stained_glass_pane",		"white_stained_glass_pane",		"cyan_stained_glass_pane",	"birch_fence",	"dark_oak_fence",	"pale_oak_fence",
								"orange_stained_glass_pane",	"gray_stained_glass_pane",			"blue_stained_glass_pane",				"green_stained_glass_pane",		"pink_stained_glass_pane",		"oak_fence",				"jungle_fence",	"mangrove_fence",	"piston",
								"red_stained_glass_pane",		"black_stained_glass_pane",			"purple_stained_glass_pane",			"yellow_stained_glass_pane",	"magenta_stained_glass_pane",	"spruce_fence",				"acacia_fence",	"cherry_fence",		"sticky_piston"}

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