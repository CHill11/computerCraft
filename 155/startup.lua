--id = 155
local gotFile = false
while not gotFile do
	if shell.run("getfile",207,"usefulFunctions.lua") then
		gotFile = true
	end
end

local turtleID = os.getComputerID()
local usefulFunctions = require("usefulFunctions")

-- Open the modem on a side (e.g., "right")
local modem = usefulFunctions.openRednet()


print("My turtle ID is " .. turtleID .. ".")
print("Started...")

local items = {["minecraft:raw_iron"] = true, ["minecraft:raw_gold"] = true,["minecraft:charcoal"] = false}

local amount = nil
local newAmount = nil

local function timer()
	os.sleep(8)
end

local function gotItem()
	while true do
		local wasSuck = turtle.suckDown()
		if wasSuck then
			local item = turtle.getItemDetail()
			if items[item.name] then
				turtle.drop()
			else
				turtle.dropUp()
			end
		end
		sleep(0.2)
	end
end

local function getItems()
	parallel.waitForAny(gotItem,timer)
end

local function getCharcoalamount()
	while true do
		print("Waiting for a message...")
		ID, MESSAGE = rednet.receive()
		print("Got a message!")
		newAmount = MESSAGE
		if ID == 296 then
			return
		else
			print("Message was from the wrong sender.")
		end
	end
end

--main
while true do
	ID = nil
	MESSAGE = nil
	parallel.waitForAll(getCharcoalamount,getItems)
	if newAmount ~= amount then 
		amount = newAmount
		print("Charcoal:" .. amount)
		if amount >= 2000 then
			items["minecraft:charcoal"] = true
			print("Burning charcoal ")
		else
			items["minecraft:charcoal"] = false
			print("Storing charcoal")
		end
	end
	--drop any item that may be in the turtles inv after it got a message
	local item = nil
	for i = 1,16 do
		turtle.select(i)
		item = turtle.getItemDetail()
		if item then
			if items[item.name] then
				turtle.drop()
			else
				turtle.dropUp()
			end
		end
	end
	turtle.select(1)
end