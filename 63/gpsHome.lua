function locate()
	x,y,z = gps.locate(3)
	if x and y and z then
		return x,y,z
	else 
		print("Error getting cords!")
	end
end
local preCords = nil
local cords = {}
local home = {-163,76,45}
local tolerance = 0.1 -- Jitter tolerance for cordsance comparison

while true do
    sleep(1)
	cords = {locate()}
	
	local dX = cords[1] - home[1]
	local dY = cords[2] - home[2]
	local dZ = cords[3] - home[3]
	-- The math for finding if getting closer
	local currentcordsance = math.sqrt(dX^2 + dY^2 + dZ^2)
    local currentcordsanceRounded = math.floor(currentcordsance)
	
	if percords ~= nil then
      local difference = preCords - currentcordsance -- Compare previous cordsance to current cordsance
      
      if difference > tolerance then -- gets rid of micro errors with the tolerance variable
        trend = "Getting CLOSER! \u{25b2}" -- Upward triangle
        trendColor = colors.lime -- Bright green
      elseif difference < -tolerance then
        trend = "Getting FURTHER! \u{25bc}" -- Downward triangle
        trendColor = colors.red -- Red
      else
        trend = "Stable / At Location"
        trendColor = colors.yellow
      end
	end
	preCords = currentcordsance
	
	
	-- Print to screen
	term.clear()
	print("X:" .. math.floor(cords[1]))
	print("Y:" .. math.floor(cords[2]))
	print("Z:" .. math.floor(cords[3]))
	
end

--debuging 
for i = 1,3 do 
    print(preCords[i])
end
