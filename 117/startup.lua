rednet.open("bottom")
local timer = 300
start = true
while start do
	rs.setOutput("back",true)
	sleep(1)
	rs.setOutput("back",false)
	sleep(10)
	rs.setOutput("back",true)
	sleep(1)
	rs.setOutput("back",false)
	sleep(timer)
end
