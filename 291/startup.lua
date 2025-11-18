--id = 291
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Starting...")

while true do
	os.pullEvent("turtle_inventory")
	turtle.dropDown()
end
