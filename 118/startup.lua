rednet.open("right")
while true do
	local event, senderId, message = os.pullEvent("rednet_message")
	if message == "dropUp" then
		for i = 1,16 do
		print(i)
			turtle.select(i)
			local item = turtle.getItemDetail()
			if item then
				turtle.dropUp()
			end
		end
	end
	rednet.send(116,"resume")
end
