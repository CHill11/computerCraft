print("FurnaceWood is running...")
local hopper = peripheral.wrap("back")
while true do
	local hopperInv = hopper.list()
	local totalWood = 0
	for _,item in ipairs(hopperInv) do
		totalWood = totalWood + item.count
	end
	if totalWood > 64 then
		rs.setOutput("back",true)
		print("Redstone signel is on")
	else
		rs.setOutput("back", false)
		print("Redstone signel is off")
	end
	sleep(10)
end