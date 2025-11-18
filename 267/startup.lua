--id = 267
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
while true do
	wasSuck = turtle.suckDown()
	if wasSuck then
		turtle.dropUp()
	end
	sleep(0.2)
end
