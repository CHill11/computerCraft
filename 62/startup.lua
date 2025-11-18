--[[leftOn = rs.getInput("left")
backOn = rs.getInput("back")
print("is left on")
print(leftOn)
print("is back on")
print(backOn)
]]
rednet.open("left")
--if rednet signal is on dig the block
while true do
    local event, id, message = os.pullEvent("rednet_message")
    print(message)
    if event == "rednet_message" then
        if message == "close" then --place water
		turtle.select(16)
			item = turtle.getItemDetail()
			if item.name == "minecraft:bucket" then
				turtle.turnLeft()
				turtle.turnLeft()
				assert(turtle.forward())
				turtle.placeDown()
				turtle.turnLeft()
				turtle.turnLeft()
				assert(turtle.forward())
			end
            turtle.select(1)
            turtle.dig()
            assert(turtle.forward())
            assert(turtle.forward())
            turtle.select(16)
            turtle.place()
            turtle.turnLeft()
            turtle.turnLeft()
            assert(turtle.forward())
            assert(turtle.forward())
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.select(1)
            turtle.place()
        elseif message == "open" then--pick up water
			turtle.select(16)
			item = turtle.getItemDetail()
			if item.name ~= "minecraft:bucket" then
				turtle.turnLeft()
				turtle.turnLeft()
				assert(turtle.forward())
				turtle.placeDown()
				turtle.turnLeft()
				turtle.turnLeft()
				assert(turtle.forward())
			end
            turtle.select(1)
            turtle.dig()
            turtle.select(16)--get bucket to pick up water
            assert(turtle.forward())
            turtle.place()
            turtle.turnLeft()
            turtle.turnLeft()
            assert(turtle.forward())
			turtle.turnLeft()
			turtle.turnLeft()
			turtle.select(1)
			turtle.place()
        end
    end
end
