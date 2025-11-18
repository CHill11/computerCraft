local turtleID = os.getComputerID()
print("My turtle ID is " .. turtleID .. ".")
print("Started...")

while true do
	wasSucked = turtle.suckDown()
	if wasSucked then
		turtle.dropUp()
	end
end
