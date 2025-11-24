rednet.open("back")

local start = true
while start do
    local event, id, message = os.pullEvent("rednet_message")
	if message == "harvest" then
		print(message)
		rs.setOutput("left",true)
		rs.setOutput("right",true)
		sleep(0.5)
		rs.setOutput("left",false)
		rs.setOutput("right",false)
	end
end
