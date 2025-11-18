--[[leftOn = rs.getInput("left")
backOn = rs.getInput("back")
print("is left on")
print(leftOn)
print("is back on")
print(backOn)
]]
rednet.open("right")
--if redstone is on dig the block
while true do
    local event, id, message = os.pullEvent("rednet_message")
    print(event)
    print(message)
    if event == "rednet_message" then
        if message == "open" then
            print("open")
            turtle.dig()
        elseif message == "close" then
            print("close")
            turtle.place()
        end
    end
end
