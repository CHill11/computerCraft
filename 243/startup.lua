--id = 243
--main column for storage 
--first third row
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
local itemNames = {}--lookup table

--								Column 1			Column 2				Column 3		Column 4			Column 5			Column 6			Column 7				Column 8	Column 9
local inRowItemsRawName = {		"wheat_seeds",		"beetroot_seeds",		"bookshelf",	"oak_sign",			"lily_pad",			"kelp",				"iron_horse_armor",		"lever",	"ender_eye",
								"melon_seeds",		"torchflower_seeds",	"hay_block",	"experience_bottle","cactus",			"dripstone_block",	"golden_horse_armor",		"saddle",	"clay_ball",
								"pumpkin_seeds",	"cocoa_beans",			"ladder",		"scaffolding",		"sugar_cane",		"cobblestone_slab",	"diamond_horse_armor",	"hopper",	"dispenser"}

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
