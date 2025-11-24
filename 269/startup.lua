--id = 269
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
while true do
	local wasSuck = turtle.suck()
	if wasSuck then
		turtle.dropUp()
	end
	sleep(0.2)
end
