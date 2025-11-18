--id = 160
--main column for storage 
--first row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1		Column 2		Column 3		Column 4		Column 5		Column 6		Column 7				Column 8		Column 9
local inRowItemsRawName = {		"oak_log",		"cobblestone",	"raw_copper",	"emerald",		"sand",			"end_stone",	"cobbled_deepslate",	"glass",		"redstone",
								"stick",		"stone",		"copper_ingot",	"gold_ingot",	"iron_ingot",	"dirt",			"deepslate",			"glass_pane",	"diamond",
								"coal",			"charcoal",		"diorite",		"tuff",			"granite",		"andesite",		"gravel",				"arrow",		"ender_pearl"}

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
