--id = 214
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
while true do
	os.pullEvent("turtle_inventory")
	turtle.drop()
end