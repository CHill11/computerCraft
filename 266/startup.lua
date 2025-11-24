--id = 266
local turtleID = os.getComputerID()

print("My turtle ID is " .. turtleID .. ".")
print("Started...")
while true do
	local wasSuck = turtle.suckDown()
	if wasSuck then
		turtle.drop()
	end
	sleep(0.2)
end