rednet.open("right")
while true do
	wasSucked = turtle.suck()--boolean to see if suck got an item
	if wasSucked then
		turtle.dropUp()
		rednet.send(118,"dropUp")
		print("Waiting for the other turtle to clear its inventory")
		local event, senderId, message = os.pullEvent("rednet_message")
		if message == "resume" then
			print("resuming")
		end
	end
	sleep(5)
end

