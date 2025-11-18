--id = 153
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
while true do
	local wasSucked = turtle.suckDown()
	if wasSucked then
		turtle.drop()
	end
	sleep(0.2)
end
