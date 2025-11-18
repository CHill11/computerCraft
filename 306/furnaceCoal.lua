print("FurnaceCoal is running...")
local hopper = peripheral.wrap("back")
while true do
	local hopperInv = hopper.list()
	local totalCoal = 0
	for _,item in ipairs(hopperInv) do
		totalCoal = totalCoal + item.count
	end
	if totalCoal > 64 then
		rs.setOutput("back",true)
		print("Redstone signel is on")
	else
		rs.setOutput("back", false)
		print("Redstone signel is off")
	end
	sleep(10)
end

