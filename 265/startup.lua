--id = 265
local function chestFull(chestWrap)
	local slotsUsedInChest = 0
	local chestSize = chestWrap.size()
	local chest = chestWrap.list()
	if chest then
		for _ in pairs(chest) do
			slotsUsedInChest = slotsUsedInChest + 1
		end
		if slotsUsedInChest >= chestSize then
			return true
		else
			return false
		end
	end
	return false
end

local turtleID = os.getComputerID()
local toCoalChest = peripheral.wrap("front")
local toBlastFurnaceChest = peripheral.wrap("bottom")

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
while true do
	while chestFull(toBlastFurnaceChest) do -- see if ores chest is full
		print("Blast furnace chest is full.")
		sleep(10)
	end

	while chestFull(toCoalChest) do -- see if fuel chest is full
		print("Coal chest is full.")
		sleep(10)
	end

	local wasSuck = turtle.suckUp()
	if wasSuck then
		local item = turtle.getItemDetail()
		if item.name == "minecraft:raw_iron" or item.name == "minecraft:raw_gold" then
			turtle.dropDown()
		elseif item.name == "minecraft:coal" or item.name == "minecraft:charcoal" then
			turtle.drop()
		end
	end
	sleep(0.2)
end
